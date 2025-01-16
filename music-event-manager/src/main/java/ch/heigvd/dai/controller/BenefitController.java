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

    public void getOne(Context ctx) throws SQLException, JsonProcessingException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        ObjectMapper mapper = new ObjectMapper();

        Benefit benefit = ctx.bodyValidator(Benefit.class)
                .check(obj -> obj.id() != null, "Missing id")
                .check(obj -> obj.name() != null, "Missing name")
                .check(obj -> obj.benefitStand() != null, "Missing stand benefits")
                .check(obj -> obj.benefitsTickets() != null, "Missing tickets benefits")
                .get();

        ctx.render("benefit.jte", Map.of("benefit", benefit));
    }

    public void getAll(Context ctx) throws SQLException, JsonProcessingException {

        ObjectMapper mapper = new ObjectMapper();

        List<Benefit> benefits = mapper.readValue(Benefit.getAll(connection), new TypeReference<List<Benefit>>(){});

        ctx.render("benefits.jte", Map.of("benefits", benefits));
    }
}
