package ch.heigvd.dai;

import ch.heigvd.dai.controller.*;
import io.javalin.Javalin;
import io.javalin.rendering.template.JavalinJte;

import java.sql.*;
import java.util.Arrays;
import java.util.Properties;

public class Main {
    public static void main(String[] args) {
        Javalin app = Javalin.create(
                config -> { config.fileRenderer(new JavalinJte()); }
        );


        final String url = "jdbc:postgresql://localhost:5432/bdr?currentSchema=embedded";
        final Properties props = new Properties();
        props.setProperty("user", "bdr");
        props.setProperty("password", "bdr");
        try (Connection conn = DriverManager.getConnection(url, props)) {
            // Controllers
            UsersController usersController = new UsersController(conn);
            BenefitsController benefitsController = new BenefitsController(conn);
            GroupEventController groupEventController = new GroupEventController(conn);
            EventsController eventsController = new EventsController(conn);

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

            app.get("/benefits/{id}", benefitsController::getOne);
            app.get("/benefits", benefitsController::getAll);

            app.get("/", ctx -> ctx.render("root.jte"));

            app.get("/group_event/{id}", groupEventController::getAll);

            app.get("/stands/{id}", standController::getOne);
            app.get("/restaurateurs/{id}", restaurateurController::getOne);

            app.start(7000);
        } catch(SQLException e) {
            System.out.println("Error connecting to database " + Arrays.toString(e.getStackTrace()));
        }
    }
}
