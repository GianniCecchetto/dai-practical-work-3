package ch.heigvd.dai.model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public record Benefit(Integer id, String name, Float benefitStand, Float benefitsTickets) {
    public static String getOne(Connection connection, Integer eventId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM vue_recettes_evenement WHERE evenement_id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, eventId);
            ResultSet resultSet = stmt.executeQuery();
            resultSet.next();
            Benefit benefit = new Benefit(
                resultSet.getInt("evenement_id"),
                resultSet.getString("evenement_nom"),
                resultSet.getFloat("recettes_stands"),
                resultSet.getFloat("recettes_billets")
            );

            ObjectMapper mapper = new ObjectMapper().enable(SerializationFeature.INDENT_OUTPUT);

            String json = "";
            try {
                json = mapper.writeValueAsString(benefit);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }

            return json;
        }
    }

    public static String getAll(Connection connection) throws SQLException {
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

            ObjectMapper mapper = new ObjectMapper().enable(SerializationFeature.INDENT_OUTPUT);

            String json = "";
            try {
                json = mapper.writeValueAsString(benefits);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }

            return json;
        }
    }

    @Override
    public String toString() {
        return "Recettes Stands: " + benefitStand + " Recettes Billets: " + benefitsTickets;
    }
}
