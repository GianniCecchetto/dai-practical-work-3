package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Benefit;
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

        System.out.println(Benefit.getRecettes(connection, id));

        return ctx.render("benefits.jte", Map.of("recette", Benefit.getRecettes(connection, id)));
    }
}
