package ch.heigvd.dai;

import ch.heigvd.dai.controller.*;
import io.javalin.Javalin;

import java.sql.*;
import java.util.Arrays;
import java.util.Properties;
import io.javalin.rendering.template.JavalinJte;

public class Main {
    static Connection conn;
    public static void main(String[] args) {
        Javalin app = Javalin.create(
                config -> { config.fileRenderer(new JavalinJte()); }
        ).start(7000);

        final String url = "jdbc:postgresql://localhost:5432/bdr?currentSchema=embedded";
        final Properties props = new Properties();
        props.setProperty("user", "bdr");
        props.setProperty("password", "bdr");
        try  {
            conn = DriverManager.getConnection(url, props);
            // Controllers
            BenefitController benefitController = new BenefitController(conn);
            BenefitControllerApi benefitControllerApi = new BenefitControllerApi(conn);

            // Benefit routes
            app.get("/api/benefits", benefitControllerApi::getAll);
            app.get("/api/benefits/{id}", benefitControllerApi::getOne);

            // Event routes
            app.get("/api/events");
            app.get("/api/events/{id}");
            app.get("/api/events");
            app.get("/api/events");
            app.get("/api/events");
            app.get("/api/events");

            app.get("/benefits/{id}", benefitController::getOne);
            app.get("/benefits", benefitController::getAll);

        } catch(SQLException e) {
            System.out.println("Error connecting to database " + Arrays.toString(e.getStackTrace()));
        }
    }
}