package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Group;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class GroupEventController {
    private final Connection connection;

    public GroupEventController(Connection connection) {
        this.connection = connection;
    }

    public Context getAll(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        //System.out.println(Benefit.getRecettes(connection, id));

        return ctx.render("groupEvent.jte", Map.of("groups", Group.getGroupEvent(connection, id)));
    }

}


