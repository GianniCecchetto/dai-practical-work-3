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
    public void handleInsertEvent(Context ctx) throws SQLException {
        try {
            // Récupérer les données du formulaire
            String name = ctx.formParam("name");  // Nom de l'événement
            String description = ctx.formParam("description");  // Description de l'événement (peut être vide)
            Double entryPrice = ctx.formParamAsClass("entryPrice", Double.class).get();  // Prix d'entrée
            String beginning = ctx.formParam("beginning");  // Date de début de l'événement
            String end = ctx.formParam("end");
            Integer locationId = ctx.formParamAsClass("locationId", Integer.class).get();  // Lieu de l'événement

            java.sql.Date startDate = java.sql.Date.valueOf(beginning);
            java.sql.Date endDate = java.sql.Date.valueOf(end);

            Event event = new Event(null,name, description, entryPrice, startDate, endDate, locationId);
            Event.create(connection, event);

            ctx.redirect("/events");
        } catch (Exception e) {
            ctx.status(400).result("Erreur lors de l'insertion de l'événement : " + e.getMessage());
        }
    }

}
