package ch.heigvd.dai.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public record Benefits(Integer id, String name, Float benefitStand, Float benefitsTickets) {
    public static Benefits getBenfit(Connection connection, Integer evenementId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM vue_recettes_evenement WHERE evenement_id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, evenementId);
            ResultSet resultSet = stmt.executeQuery();
            resultSet.next();
            return new Benefits(
                resultSet.getInt("evenement_id"),
                resultSet.getString("evenement_nom"),
                resultSet.getFloat("recettes_stands"),
                resultSet.getFloat("recettes_billets")
            );
        }
    }

    public static List<Benefits> getBenfits(Connection connection) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM vue_recettes_evenement;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet resultSet = stmt.executeQuery();

            List<Benefits> benefits = new ArrayList<>();
            while (resultSet.next()) {
                benefits.add(new Benefits(
                        resultSet.getInt("evenement_id"),
                        resultSet.getString("evenement_nom"),
                        resultSet.getFloat("recettes_stands"),
                        resultSet.getFloat("recettes_billets")
                ));
            }

            return benefits;
        }
    }

    @Override
    public String toString() {
        return "Recettes Stands: " + benefitStand + " Recettes Billets: " + benefitsTickets;
    }
}
