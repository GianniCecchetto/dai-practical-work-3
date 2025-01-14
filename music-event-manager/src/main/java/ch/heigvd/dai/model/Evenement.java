package ch.heigvd.dai.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public record Evenement (Integer id, String nom, Date debut, Date fin, Float prix, Lieu lieu) {
    public static List<Evenement> getEvenements(Connection connection) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM vue_evenement_lieu;";
        List<Evenement> evenements = new ArrayList<>();

        try (Statement stmt = connection.createStatement()) {
            ResultSet resultSet = stmt.executeQuery(sql);
            while (resultSet.next()) {
                evenements.add(new Evenement(
                    resultSet.getInt("evenement_id"),
                    resultSet.getString("evenement_nom"),
                    resultSet.getDate("date_debut"),
                    resultSet.getDate("date_fin"),
                    resultSet.getFloat("prix_entree"),
                    new Lieu(
                        resultSet.getString("lieu_nom"),
                        resultSet.getString("adresse"),
                        resultSet.getInt("NPA")
                    )
                ));
            }
        }

        return evenements;
    }

    @Override
    public String toString() {
        return id + " " + nom + " " + debut + " " + fin + " " + prix + " " + lieu;
    }
}
