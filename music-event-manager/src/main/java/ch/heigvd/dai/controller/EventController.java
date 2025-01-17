package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Event;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class EventController {
    private final Connection connection;

    public EventController(Connection connection) {
        this.connection = connection;
    }

    public void getAll(Context ctx) throws SQLException {
        ctx.render("events.jte", Map.of("events", Event.getAll(connection)));
    }

    public void getOne(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        ctx.render("event.jte", Map.of("event", Event.getOne(connection, id)));
    }
}
