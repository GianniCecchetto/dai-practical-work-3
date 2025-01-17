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
        try  {
            Connection conn = DriverManager.getConnection(url, props);

            // Controllers
            BenefitController benefitController = new BenefitController(conn);
            BenefitControllerApi benefitControllerApi = new BenefitControllerApi(conn);

            GroupEventController groupEventController = new GroupEventController(conn);

            EventController eventController = new EventController(conn);
            EventControllerApi eventControllerApi = new EventControllerApi(conn);

            StandController standController = new StandController(conn);
            RestaurateurController restaurateurController = new RestaurateurController(conn);

            // Benefit routes
            app.get("/api/benefits", benefitControllerApi::getAll);
            app.get("/api/benefits/{id}", benefitControllerApi::getOne);

            // Events routes
            app.get("/api/group_event/{id}", groupEventController::getAll);
            app.get("/api/events", eventControllerApi::getAll);
            app.get("/api/events/{id}", eventControllerApi::getOne);
            app.post("/api/events", eventControllerApi::create);
            app.put("/api/events/{id}", eventControllerApi::update);
            app.delete("/api/events/{id}", eventControllerApi::delete);

            // Stands routes
            app.get("/stands/{id}", standController::getOne);
            app.get("/restaurateurs/{id}", restaurateurController::getOne);

            // HTML routes
            app.get("/", ctx -> ctx.render("root.jte"));

            app.get("/benefits/{id}", benefitController::getOne);
            app.get("/benefits", benefitController::getAll);

            app.get("/group_event/{id}", groupEventController::getAll);
            app.get("/events", eventController::showAllEvents);
            app.get("/events/{id}", eventController::showDetails);

            app.get("/stands/{id}", standController::getOne);
            app.get("/restaurateurs/{id}", restaurateurController::getOne);

            app.start(7000);
        } catch(SQLException e) {
            System.out.println("Error connecting to database " + Arrays.toString(e.getStackTrace()));
        }
    }
}
