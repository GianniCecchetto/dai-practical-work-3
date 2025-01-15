package ch.heigvd.dai.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public record Event(String name, Date beginning, Date end,Integer id) {
    public static List<Event> getEvents(Connection connection) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT DISTINCT nom, date_debut,date_fin,id FROM evenement ;";
        List<Event> events = new ArrayList<>();

        try (Statement stmt = connection.createStatement()) {
            ResultSet resultSet = stmt.executeQuery(sql);
            while(resultSet.next()){
                events.add(new Event(
                        resultSet.getString("nom"),
                        resultSet.getDate("date_debut"),
                        resultSet.getDate("date_fin"),
                        resultSet.getInt("id")
                ));
            }
        }

        return events;
    }

    @Override
    public String toString() {
        return name + " " + beginning + " " + end;
    }
}

