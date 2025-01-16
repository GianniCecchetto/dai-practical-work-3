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
            UsersController usersController = new UsersController(conn);
            BenefitController benefitController = new BenefitController(conn);
            

            // Users routes
            app.get("/api/users",usersController::getAll);
            app.post("/api/users", usersController::create);
            app.get("/api/users/{id}", usersController::getOne);
            app.put("/api/users/{id}", usersController::update);
            app.delete("/api/users/{id}", usersController::delete);

            app.get("/benefits/{id}", benefitController::getOne);
            app.get("/benefits", benefitController::getAll);

        } catch(SQLException e) {
            System.out.println("Error connecting to database " + Arrays.toString(e.getStackTrace()));
        }
    }
}