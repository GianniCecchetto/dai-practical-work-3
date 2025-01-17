package ch.heigvd.dai.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public record Soda(Integer id, String name, Float cout, Float content) {
    public static List<Soda> getBoissons(Connection connection, Integer restaurateurId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM boisson WHERE restaurateur_id = ?;";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, restaurateurId);
            ResultSet resultSet = stmt.executeQuery();

            List<Soda> sodas = new ArrayList<>();
            while (resultSet.next()) {
                sodas.add(new Soda(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getFloat("cout"),
                        resultSet.getFloat("contenance")
                ));
            }

            return sodas;
        }
    }

    public static Soda getBoisson(Connection connection, Integer boissonId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM boisson WHERE id = ?;";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, boissonId);
            ResultSet resultSet = stmt.executeQuery();

            resultSet.next();
            return new Soda(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getFloat("cout"),
                    resultSet.getFloat("contenance")
            );
        }
    }
}
