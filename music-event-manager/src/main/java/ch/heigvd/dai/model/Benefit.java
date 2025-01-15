package ch.heigvd.dai.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public record Benefit(Integer id, String name, Float benefitStand, Float benefitsTickets) {
    public static Benefit getBenefit(Connection connection, Integer evenementId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM vue_recettes_evenement WHERE evenement_id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, evenementId);
            ResultSet resultSet = stmt.executeQuery();
            resultSet.next();
            return new Benefit(
                resultSet.getInt("evenement_id"),
                resultSet.getString("evenement_nom"),
                resultSet.getFloat("recettes_stands"),
                resultSet.getFloat("recettes_billets")
            );
        }
    }

    public static List<Benefit> getBenefits(Connection connection) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM vue_recettes_evenement;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet resultSet = stmt.executeQuery();

            List<Benefit> benefits = new ArrayList<>();
            while (resultSet.next()) {
                benefits.add(new Benefit(
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
