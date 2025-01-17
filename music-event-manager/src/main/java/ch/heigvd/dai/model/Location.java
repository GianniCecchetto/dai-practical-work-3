package ch.heigvd.dai.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public record Location(Integer id, String name, String address, String npa) {
    public static Location getOne(Connection connection, Integer locationId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT DISTINCT * FROM lieu WHERE id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, locationId);
            ResultSet resultSet = stmt.executeQuery();
            resultSet.next();

            return new Location(
                    resultSet.getInt("id"),
                    resultSet.getString("nom"),
                    resultSet.getString("adresse"),
                    resultSet.getString("npa")
            );
        }
    }

    public static List<Location> getAll(Connection connection) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM lieu;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet resultSet = stmt.executeQuery();

            List<Location> locations = new ArrayList<>();
            while (resultSet.next()) {
                locations.add(new Location(
                        resultSet.getInt("id"),
                        resultSet.getString("nom"),
                        resultSet.getString("adresse"),
                        resultSet.getString("npa")
                ));
            }

            return locations;
        }
    }

    @Override
    public String toString() {
        return name + " " + address + " " + npa;
    }
}
