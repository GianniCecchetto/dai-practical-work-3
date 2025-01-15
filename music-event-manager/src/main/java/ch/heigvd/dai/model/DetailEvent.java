package ch.heigvd.dai.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public record DetailEvent(Integer id,String name,Date beginning, Date end,Integer entryPrice,String placeName,String adresse,String NPA) {
    public static DetailEvent getDetailEvent(Connection connection, Integer evenementId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT DISTINCT evenement_id ,evenement_nom,date_debut, " +
                "date_fin, prix_entree, lieu_nom, adresse," +
                " NPA FROM vue_evenement_lieu WHERE evenement_id = ? ;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, evenementId);
            ResultSet resultSet = stmt.executeQuery();
            resultSet.next();

            return new DetailEvent(
                    resultSet.getInt("evenement_id"),
                    resultSet.getString("evenement_nom"),
                    resultSet.getDate("date_debut"),
                    resultSet.getDate("date_fin"),
                    resultSet.getInt("prix_entree"),
                    resultSet.getString("lieu_nom"),
                    resultSet.getString("adresse"),
                    resultSet.getString("NPA")


            );
        }
    }

    @Override
    public String toString() {
        return name + " " + beginning + " " + end;
    }
}

