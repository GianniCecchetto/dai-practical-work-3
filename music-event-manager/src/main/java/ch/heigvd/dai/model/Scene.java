package ch.heigvd.dai.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public record Scene(Integer id, Integer maxCapacity, Boolean openAir, Double cost, Integer eventId) {

    public static Scene getOne(Connection connection, Integer sceneId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT id, capacite_max, plein_air, cout, evenement_id FROM scene WHERE id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, sceneId);
            ResultSet resultSet = stmt.executeQuery();

            if (resultSet.next()) {
                return new Scene(
                        resultSet.getInt("id"),
                        resultSet.getInt("capacite_max"),
                        resultSet.getBoolean("plein_air"),
                        resultSet.getDouble("cout"),
                        resultSet.getInt("evenement_id")
                );
            } else {
                throw new SQLException("Aucune scène trouvée avec l'ID fourni.");
            }
        }
    }

    public static List<Scene> getAll(Connection connection, Integer eventId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT id, capacite_max, plein_air, cout, evenement_id FROM scene WHERE evenement_id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, eventId);
            ResultSet resultSet = stmt.executeQuery();

            List<Scene> scenes = new ArrayList<>();
            while (resultSet.next()) {
                scenes.add(new Scene(
                        resultSet.getInt("id"),
                        resultSet.getInt("capacite_max"),
                        resultSet.getBoolean("plein_air"),
                        resultSet.getDouble("cout"),
                        resultSet.getInt("evenement_id")
                ));
            }

            return scenes;
        }
    }

    public static void create(Connection connection, Scene scene) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "INSERT INTO scene (capacite_max, plein_air, cout, evenement_id) VALUES (?, ?, ?, ?);";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, scene.maxCapacity());
            stmt.setBoolean(2, scene.openAir());
            stmt.setDouble(3, scene.cost());
            stmt.setInt(4, scene.eventId());
            stmt.executeUpdate();
        }
    }

    @Override
    public String toString() {
        return "Scene {" +
                "id=" + id +
                ", maxCapacity=" + maxCapacity +
                ", openAir=" + (openAir ? "Oui" : "Non") +
                ", cost=" + cost +
                ", eventId=" + eventId +
                '}';
    }
}
