package ch.heigvd.dai.model;

import java.sql.*;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

public record Event(Integer id, String name, String description, Double entryPrice, Date beginning, Date end, Location location) {
    public static Event getOne(Connection connection, Integer evenementId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT DISTINCT     e.id AS evenement_id,\n" +
                "    description," +
                "    evenement_nom," +
                "    date_debut," +
                "    date_fin," +
                "    prix_entree," +
                "    lieu_id," +
                "    lieu_nom," +
                "    adresse," +
                "    NPA" +
                " NPA FROM vue_evenement_lieu WHERE evenement_id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, evenementId);
            ResultSet resultSet = stmt.executeQuery();
            resultSet.next();

            return new Event(
                    resultSet.getInt("evenement_id"),
                    resultSet.getString("description"),
                    resultSet.getString("evenement_nom"),
                    resultSet.getDouble("prix_entree"),
                    resultSet.getDate("date_debut"),
                    resultSet.getDate("date_fin"),
                    new Location(
                            resultSet.getInt("lieu_id"),
                            resultSet.getString("lieu_nom"),
                            resultSet.getString("adresse"),
                            resultSet.getString("NPA"))
            );
        }
    }

    public static List<Event> getAll(Connection connection) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT DISTINCT     e.id AS evenement_id,\n" +
                "    description," +
                "    evenement_nom," +
                "    date_debut," +
                "    date_fin," +
                "    prix_entree," +
                "    lieu_id," +
                "    lieu_nom," +
                "    adresse," +
                "    NPA" +
                " NPA FROM vue_evenement_lieu;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet resultSet = stmt.executeQuery();

            List<Event> events = new ArrayList<>();
            while (resultSet.next()) {
                events.add(new Event(
                        resultSet.getInt("evenement_id"),
                        resultSet.getString("description"),
                        resultSet.getString("evenement_nom"),
                        resultSet.getDouble("prix_entree"),
                        resultSet.getDate("date_debut"),
                        resultSet.getDate("date_fin"),
                        new Location(
                                resultSet.getInt("lieu_id"),
                                resultSet.getString("lieu_nom"),
                                resultSet.getString("adresse"),
                                resultSet.getString("NPA"))
                ));
            }

            return events;
        }
    }

    public static void create(Connection connection, Event event) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "INSERT INTO evenement (nom, description, prix_entree, date_debut, date_fin, lieu_id)" +
                "VALUES (?, ?, ?, ?, ?, ?);";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, event.name());
            stmt.setString(2, event.description());
            stmt.setDouble(3, event.entryPrice());
            stmt.setDate(4, event.beginning());
            stmt.setDate(5, event.end());
            stmt.setInt(6, event.location().id());
            stmt.executeQuery();
        }
    }

    @Override
    public String toString() {
        return name + " " + beginning + " " + end;
    }
}

