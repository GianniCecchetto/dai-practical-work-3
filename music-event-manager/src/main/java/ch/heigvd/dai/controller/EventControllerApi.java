package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Event;
import io.javalin.http.Context;
import io.javalin.http.HttpStatus;
import io.javalin.http.NotFoundResponse;

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

        Event event = Event.getOne(connection, id);

        if (event == null) {
            throw new NotFoundResponse();
        }

        ctx.json(Event.getOne(connection, id));
    }

    public void create(Context ctx) throws SQLException {
        Event event = ctx.bodyValidator(Event.class)
                .check(obj -> obj.description() != null, "Missing name")
                .check(obj -> obj.name() != null, "Missing stand benefits")
                .check(obj -> obj.entryPrice() != null, "Missing tickets benefits")
                .check(obj -> obj.beginning() != null, "Missing tickets benefits")
                .check(obj -> obj.end() != null, "Missing tickets benefits")
                .check(obj -> obj.locationId() != null, "Missing tickets benefits")
                .get();

        Event.create(connection, event);

        ctx.status(HttpStatus.CREATED);
        ctx.json(event);
    }

    public void update(Context ctx) throws SQLException {

    }

    public void delete(Context ctx) throws SQLException {

    }
}
