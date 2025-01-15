package ch.heigvd.dai;

import ch.heigvd.dai.controller.*;
import ch.heigvd.dai.model.*;
import io.javalin.Javalin;
import io.javalin.rendering.template.JavalinJte;

import java.util.Collections;

import java.sql.*;
import java.util.Arrays;
import java.util.Properties;

public class Main {
    static Connection conn;
    public static void main(String[] args) {
        Javalin app = Javalin.create(
                config -> { config.fileRenderer(new JavalinJte()); }
        );

        final String url = "jdbc:postgresql://localhost:5432/bdr?currentSchema=embedded";
        final Properties props = new Properties();
        props.setProperty("user", "bdr");
        props.setProperty("password", "bdr");
        try  {
            conn = DriverManager.getConnection(url, props);

            Events events = new Events();

            // Controllers
            UsersController usersController = new UsersController(conn);
            EventsController eventsController = new EventsController(conn, events);
            BenefitsController benefitsController = new BenefitsController(conn);
            StandController standController = new StandController(conn);
            RestaurateurController restaurateurController = new RestaurateurController(conn);

            // Users routes
            app.get("/api/users",usersController::getAll);
            app.post("/api/users", usersController::create);
            app.get("/api/users/{id}", usersController::getOne);
            app.put("/api/users/{id}", usersController::update);
            app.delete("/api/users/{id}", usersController::delete);
            app.get("/api/events", eventsController::getAll);

            app.get("/", ctx -> ctx.render("root.jte"));
            app.get("/moi", ctx -> ctx.render("moi.jte", Collections.singletonMap("events", events)));

            app.start(7000);

            app.get("/benefits/{id}", benefitsController::getOne);
            app.get("/benefits", benefitsController::getAll);

            app.get("/stands/{id}", standController::getOne);
            app.get("/restaurateurs/{id}", restaurateurController::getOne);
        } catch(SQLException e) {
            System.out.println("Error connecting to database " + Arrays.toString(e.getStackTrace()));
        }
    }
}
