package ch.heigvd.dai.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public record Spectator(Integer id, String firstName, String lastName, String address, String phoneNumber, String email, Float cost, Integer eventId) {
    public static List<Spectator> getSpectators(Connection connection, Integer eventId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM spectateur AS s INNER JOIN personne AS p ON p.id = s.personne_id INNER JOIN spectateur_evenement AS se ON se.spectateur_id = s.personne_id WHERE evenement_id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, eventId);
            ResultSet resultSet = stmt.executeQuery();

            List<Spectator> spectators = new ArrayList<>();
            while (resultSet.next()) {
                spectators.add(new Spectator(
                        resultSet.getInt("id"),
                        resultSet.getString("nom"),
                        resultSet.getString("prenom"),
                        resultSet.getString("adresse"),
                        resultSet.getString("num_tel"),
                        resultSet.getString("email"),
                        resultSet.getFloat("prix"),
                        resultSet.getInt("evenement_id")
                ));
            }

            return spectators;
        }
    }

    public static Spectator getSpectator(Connection connection, Integer spectatorId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM spectateur AS s INNER JOIN personne AS p ON p.id = s.personne_id INNER JOIN spectateur_evenement AS se ON se.spectateur_id = s.personne_id WHERE id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, spectatorId);
            ResultSet resultSet = stmt.executeQuery();

            resultSet.next();
            return new Spectator(
                    resultSet.getInt("id"),
                    resultSet.getString("nom"),
                    resultSet.getString("prenom"),
                    resultSet.getString("adresse"),
                    resultSet.getString("num_tel"),
                    resultSet.getString("email"),
                    resultSet.getFloat("prix"),
                    resultSet.getInt("evenement_id")
            );
        }
    }
}
