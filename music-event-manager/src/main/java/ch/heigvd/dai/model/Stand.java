package ch.heigvd.dai.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public record Stand(Integer id, Float size, Float cout, Integer restaurantId) {
    public static List<Stand> getStands(Connection connection, Integer evenementId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM stand WHERE evenement_id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, evenementId);
            ResultSet resultSet = stmt.executeQuery();

            List<Stand> stands = new ArrayList<>();
            while (resultSet.next()) {
                stands.add(new Stand(
                    resultSet.getInt("id"),
                    resultSet.getFloat("taille"),
                    resultSet.getFloat("cout"),
                    resultSet.getInt("restaurateur_id")
                ));
            }

            return stands;
        }
    }
}