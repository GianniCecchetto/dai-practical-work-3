package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Event;
import ch.heigvd.dai.model.Location;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class EventController {
    private final Connection connection;

    public EventController(Connection connection) {
        this.connection = connection;
    }

    public void showAllEvents(Context ctx) throws SQLException {
        ctx.render("events.jte", Map.of("events", Event.getAll(connection)));
    }

    public void showDetails(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        Event event = Event.getOne(connection, id);
        Location location = Location.getOne(connection, event.locationId());

        ctx.render("eventDetail.jte", Map.of("event", event, "location", location));
    }

    public void insertEvent(Context ctx) throws SQLException {
        ctx.render("insertEvent.jte", Map.of("locations", Location.getAll(connection)));
    }

    public void modifyEvent(Context ctx) throws SQLException {
        ctx.render("modifyEvent.jte");
    }

    public void deleteEvent(Context ctx) throws SQLException {
        ctx.render("deleteEvent.jte");
    }
}
