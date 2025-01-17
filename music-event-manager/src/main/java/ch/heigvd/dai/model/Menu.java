package ch.heigvd.dai.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public record Menu(Float cout, Plate plate, Soda soda) {
    public static List<Menu> getMenus(Connection connection, Integer restaurateurId) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM menu WHERE restaurateur_id = ?;";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, restaurateurId);
            ResultSet resultSet = stmt.executeQuery();

            List<Menu> menus = new ArrayList<>();
            while (resultSet.next()) {
                Plate plate = Plate.getPlat(connection, resultSet.getInt("plat_id"));
                Soda soda = Soda.getBoisson(connection, resultSet.getInt("boisson_id"));

                if (soda == null || plate == null) {
                    continue;
                }

                menus.add(new Menu(
                        resultSet.getFloat("cout"),
                        plate,
                        soda
                ));
            }

            return menus;
        }
    }
}
