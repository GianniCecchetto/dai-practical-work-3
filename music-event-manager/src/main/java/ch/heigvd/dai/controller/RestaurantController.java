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

        return ctx.render("restaurant.jte", Map.of("restaurant", Restaurant.getRestaurant(connection, id), "plates", Plate.getPlats(connection, id), "sodas", Soda.getBoissons(connection, id), "menus", Menu.getMenus(connection, id)));
    }
}
