package ch.heigvd.dai.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public record Helper(Integer id, String firstName, String lastName, String address, String phoneNumber, String email, String role, Float salary) {
    public static List<Helper> getHelpers(Connection connection) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM intervenant AS i INNER JOIN personne AS p ON p.id = i.personne_id;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet resultSet = stmt.executeQuery();

            List<Helper> helpers = new ArrayList<>();
            while (resultSet.next()) {
                helpers.add(new Helper(
                        resultSet.getInt("id"),
                        resultSet.getString("nom"),
                        resultSet.getString("prenom"),
                        resultSet.getString("adresse"),
                        resultSet.getString("num_tel"),
                        resultSet.getString("email"),
                        resultSet.getString("role"),
                        resultSet.getFloat("salaire")
                ));
            }

            return helpers;
        }
    }

    public static Helper getHelper(Connection connection, Integer helperId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM intervenant AS i INNER JOIN personne AS p ON p.id = i.personne_id WHERE id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, helperId);
            ResultSet resultSet = stmt.executeQuery();

            resultSet.next();
            return new Helper(
                    resultSet.getInt("id"),
                    resultSet.getString("nom"),
                    resultSet.getString("prenom"),
                    resultSet.getString("adresse"),
                    resultSet.getString("num_tel"),
                    resultSet.getString("email"),
                    resultSet.getString("role"),
                    resultSet.getFloat("salaire")
            );
        }
    }
}
