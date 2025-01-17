package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Benefit;

import ch.heigvd.dai.model.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class BenefitController {
    private final Connection connection;

    public BenefitController(Connection connection) {
        this.connection = connection;
    }

    public void getOne(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        ctx.render("benefit.jte", Map.of("benefit", Benefit.getOne(connection, id)));
    }

    public void getAll(Context ctx) throws SQLException {
        ctx.render("benefits.jte", Map.of("benefits", Benefit.getAll(connection)));
    }
}
