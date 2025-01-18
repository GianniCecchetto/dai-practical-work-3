package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Helper;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class HelperController {
        private final Connection connection;

        public HelperController(Connection connection) {
            this.connection = connection;
        }

        public Context getAll(Context ctx) throws SQLException {
            Integer id = Integer.parseInt(ctx.pathParam("id"));

            return ctx.render("helpers.jte", Map.of("helpers", Helper.getAll(connection, id)));
        }

        public Context getOne(Context ctx) throws SQLException {
            Integer helperId = Integer.parseInt(ctx.pathParam("helper_id"));

            return ctx.render("helperDetail.jte", Map.of("helper", Helper.getOne(connection, helperId)));
        }
}
