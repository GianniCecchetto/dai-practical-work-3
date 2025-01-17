package ch.heigvd.dai.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public record User(Integer id, String name, String firstName, String address, String phone, String email) {
    public static List<User> getAll(Connection connection) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT DISTINCT * FROM personne;";
        List<User> users = new ArrayList<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet resultSet = stmt.executeQuery();
            while(resultSet.next()){
                users.add(new User(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("prenom"),
                        resultSet.getString("address"),
                        resultSet.getString("num_tel"),
                        resultSet.getString("email")
                ));
            }
        }

        return users;
    }

    @Override
    public String toString() {
        return id + " " + name + " " + firstName + " " + address + " " + phone + " " + email;
    }
}
