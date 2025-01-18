package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Benefit;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class BenefitControllerApi {
    private final Connection connection;

    public BenefitControllerApi(Connection connection) {
        this.connection = connection;
    }

    public void getOne(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        ctx.json(Benefit.getOne(connection, id));
    }

    public void getAll(Context ctx) throws SQLException {
        ctx.json(Benefit.getAll(connection));
    }

    public void create(Context ctx) throws SQLException {
        ctx.bodyValidator(Benefit.class)
                .check(obj -> obj.id() != null, "Missing id")
                .check(obj -> obj.name() != null, "Missing name")
                .check(obj -> obj.benefitStand() != null, "Missing stand benefits")
                .check(obj -> obj.benefitsTickets() != null, "Missing tickets benefits")
                .get();
    }
}