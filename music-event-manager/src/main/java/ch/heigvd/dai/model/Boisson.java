package ch.heigvd.dai.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public record Boisson(Integer id, String name, Float cout, Float content) {
    public static List<Boisson> getBoissons(Connection connection, Integer restaurateurId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM boisson WHERE restaurateur_id = ?;";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, restaurateurId);
            ResultSet resultSet = stmt.executeQuery();

            List<Boisson> boissons = new ArrayList<>();
            while (resultSet.next()) {
                boissons.add(new Boisson(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getFloat("cout"),
                        resultSet.getFloat("contenance")
                ));
            }

            return boissons;
        }
    }

    public static Boisson getBoisson(Connection connection, Integer boissonId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM boisson WHERE id = ?;";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, boissonId);
            ResultSet resultSet = stmt.executeQuery();

            resultSet.next();
            return new Boisson(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getFloat("cout"),
                    resultSet.getFloat("contenance")
            );
        }
    }
}
