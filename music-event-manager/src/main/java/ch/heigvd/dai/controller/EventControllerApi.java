package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Event;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;

public class EventControllerApi {
    private final Connection connection;

    public EventControllerApi(Connection connection) {
        this.connection = connection;
    }

    public void getAll(Context ctx) throws SQLException {
        ctx.json(Event.getAll(connection));
    }

    public void getOne(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        ctx.json(Event.getOne(connection, id));
    }

    public void create(Context ctx) throws SQLException {
        Event event = ctx.bodyValidator(Event.class)
                .check(obj -> obj.id() != null, "Missing id")
                .check(obj -> obj.name() != null, "Missing name")
                .check(obj -> obj.benefitStand() != null, "Missing stand benefits")
                .check(obj -> obj.benefitsTickets() != null, "Missing tickets benefits")
                .get();

        ctx.json(Event.create(connection, event));
    }
}
