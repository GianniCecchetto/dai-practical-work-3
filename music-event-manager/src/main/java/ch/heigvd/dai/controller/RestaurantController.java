package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Plate;
import ch.heigvd.dai.model.Soda;
import ch.heigvd.dai.model.Menu;
import ch.heigvd.dai.model.Restaurant;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class RestaurantController {
    private final Connection connection;

    public RestaurantController(Connection connection) {
        this.connection = connection;
    }

    public Context getOne(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        return ctx.render("restaurateur.jte", Map.of("restaurateur", Restaurant.getRestaurateur(connection, id), "plats", Plate.getPlats(connection, id), "boissons", Soda.getBoissons(connection, id), "menus", Menu.getMenus(connection, id)));
    }
}
