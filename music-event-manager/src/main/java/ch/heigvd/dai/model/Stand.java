package ch.heigvd.dai.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public record Stand(Integer id, Float size, Float cost, Restaurant restaurant) {
    public static List<Stand> getStands(Connection connection, Integer evenementId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT s.id AS id, s.taille, s.cout, r.id AS restaurant_id, r.nom, r.description FROM stand AS s INNER JOIN restaurateur AS r ON s.restaurateur_id = r.id WHERE evenement_id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, evenementId);
            ResultSet resultSet = stmt.executeQuery();

            List<Stand> stands = new ArrayList<>();
            while (resultSet.next()) {
                stands.add(new Stand(
                    resultSet.getInt("id"),
                    resultSet.getFloat("taille"),
                    resultSet.getFloat("cout"),
                    new Restaurant(
                        resultSet.getInt("restaurant_id"),
                        resultSet.getString("nom"),
                        resultSet.getString("description")
                    )
                ));
            }

            return stands;
        }
    }
}