package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Benefits;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class BenefitsController {
    private final Connection connection;

    public BenefitsController(Connection connection) {
        this.connection = connection;
    }

    public Context getOne(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        return ctx.render("benefit.jte", Map.of("benefit", Benefits.getBenfit(connection, id)));
    }

    public Context getAll(Context ctx) throws SQLException {
        return ctx.render("benefits.jte", Map.of("benefits", Benefits.getBenfits(connection)));
    }
}
