package ch.heigvd.dai.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public record Equipement(Integer id, String name, String description, Double cost) {

    public static List<Equipement> getEquipementsBySceneId(Connection connection, Integer sceneId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT m.id, m.nom, m.description, m.cout " +
                "FROM materiel m " +
                "JOIN materiel_concert mc ON m.id = mc.materiel_id " +
                "JOIN concert c ON mc.concert_id = c.id " +
                "WHERE c.scene_id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, sceneId);
            ResultSet resultSet = stmt.executeQuery();

            List<Equipement> equipements = new ArrayList<>();
            while (resultSet.next()) {
                equipements.add(new Equipement(
                        resultSet.getInt("id"),
                        resultSet.getString("nom"),
                        resultSet.getString("description"),
                        resultSet.getDouble("cout")
                ));
            }

            return equipements;
        }
    }
}
