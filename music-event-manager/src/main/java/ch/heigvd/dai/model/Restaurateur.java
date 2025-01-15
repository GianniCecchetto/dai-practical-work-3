package ch.heigvd.dai.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public record Restaurateur(Integer id, String name, String description) {
    public static Restaurateur getRestaurateur(Connection connection, Integer restaurateurId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM restaurateur WHERE id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, restaurateurId);
            ResultSet resultSet = stmt.executeQuery();

            resultSet.next();
            return new Restaurateur(
                    resultSet.getInt("id"),
                    resultSet.getString("nom"),
                    resultSet.getString("description")
            );
        }
    }
}
