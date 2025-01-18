package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Spectator;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class SpectatorController {
        private final Connection connection;

        public SpectatorController(Connection connection) {
            this.connection = connection;
        }

        public Context getAll(Context ctx) throws SQLException {
            Integer id = Integer.parseInt(ctx.pathParam("id"));

            return ctx.render("spectators.jte", Map.of("spectators", Spectator.getSpectators(connection, id)));
        }

        public Context getOne(Context ctx) throws SQLException {
            Integer id = Integer.parseInt(ctx.pathParam("spectator_id"));

            return ctx.render("spectatorDetail.jte", Map.of("spectator", Spectator.getSpectator(connection, id)));
        }
}
