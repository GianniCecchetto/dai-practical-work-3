package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Boisson;
import ch.heigvd.dai.model.Menu;
import ch.heigvd.dai.model.Plat;
import ch.heigvd.dai.model.Restaurateur;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class RestaurateurController {
    private final Connection connection;

    public RestaurateurController(Connection connection) {
        this.connection = connection;
    }

    public Context getOne(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        return ctx.render("restaurateur.jte", Map.of("restaurateur", Restaurateur.getRestaurateur(connection, id), "plats", Plat.getPlats(connection, id), "boissons", Boisson.getBoissons(connection, id), "menus", Menu.getMenus(connection, id)));
    }
}
