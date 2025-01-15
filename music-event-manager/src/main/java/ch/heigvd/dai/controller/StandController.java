package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Stand;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class StandController {
    private final Connection connection;

    public StandController(Connection connection) {
        this.connection = connection;
    }

    public Context getOne(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        return ctx.render("stands.jte", Map.of("stands", Stand.getStands(connection, id)));
    }
}
