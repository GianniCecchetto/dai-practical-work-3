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

    public Context getAll(Context ctx) throws SQLException {
        //System.out.println(Benefit.getRecettes(connection, id));

        return ctx.render("events.jte", Map.of("events", Event.getEvents(connection)));
    }

}
