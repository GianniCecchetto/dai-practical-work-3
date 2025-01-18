package ch.heigvd.dai.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public record Plate(Integer id, String name, String description, Float cost) {
    public static List<Plate> getPlats(Connection connection, Integer restaurateurId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM plat WHERE restaurateur_id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, restaurateurId);
            ResultSet resultSet = stmt.executeQuery();

            List<Plate> plates = new ArrayList<>();
            while (resultSet.next()) {
                plates.add(new Plate(
                        resultSet.getInt("id"),
                        resultSet.getString("nom"),
                        resultSet.getString("description"),
                        resultSet.getFloat("cout")
                ));
            }

            return plates;
        }
    }

    public static Plate getPlat(Connection connection, Integer platId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM plat WHERE id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, platId);
            ResultSet resultSet = stmt.executeQuery();

            resultSet.next();
            return new Plate(
                    resultSet.getInt("id"),
                    resultSet.getString("nom"),
                    resultSet.getString("description"),
                    resultSet.getFloat("cout")
            );
        }
    }
}
