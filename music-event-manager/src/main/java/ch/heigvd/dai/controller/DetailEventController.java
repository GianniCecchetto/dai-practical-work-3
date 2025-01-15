package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.DetailEvent;
import ch.heigvd.dai.model.Event;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class DetailEventController {
    private final Connection connection;

    public DetailEventController(Connection connection) {
        this.connection = connection;
    }

    public Context getAll(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        return ctx.render("eventDetail.jte", Map.of("eventDetail", DetailEvent.getDetailEvent(connection,id)));
    }

}
