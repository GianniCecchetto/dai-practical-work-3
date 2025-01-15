package ch.heigvd.dai.model;

import java.sql.*;
import java.util.ArrayList;
//import java.util.Date;
import java.util.List;

public record Group(Integer id, String name, String genre) {
    public static List<Group> getGroupEvent(Connection connection, Integer evenementId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT DISTINCT evenement_id,groupe_nom,groupe_genre FROM vue_concert_details WHERE evenement_id = ?;";
        List<Group> groups = new ArrayList<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, evenementId);
            ResultSet resultSet = stmt.executeQuery();
            while(resultSet.next()){
                groups.add(new Group(
                        resultSet.getInt("evenement_id"),
                        resultSet.getString("groupe_nom"),
                        resultSet.getString("groupe_genre")
                ));
            }
        }

        return groups;
    }

    @Override
    public String toString() {
        return id + " " + name + " " + genre;
    }
}

