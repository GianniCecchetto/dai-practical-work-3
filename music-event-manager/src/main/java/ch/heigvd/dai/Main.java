package ch.heigvd.dai;

import ch.heigvd.dai.controller.UsersController;
import ch.heigvd.dai.model.User;
import io.javalin.Javalin;

import java.io.InputStream;
import java.sql.*;
import java.util.Arrays;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;

public class Main {
    static Connection conn;
    public static void main(String[] args) {
        Javalin app = Javalin.create();
        final String url = "jdbc:postgresql://localhost:5432/bdr?currentSchema=embedded";
        final Properties props = new Properties();
        props.setProperty("user", "bdr");
        props.setProperty("password", "bdr");
        try  {
            conn = DriverManager.getConnection(url, props);
            // Controllers
            UsersController usersController = new UsersController(conn);

            // Users routes
            app.get("/api/users",usersController::getAll);
            app.post("/api/users", usersController::create);
            app.get("/api/users/{id}", usersController::getOne);
            app.put("/api/users/{id}", usersController::update);
            app.delete("/api/users/{id}", usersController::delete);
            app.start(7000);

        } catch(SQLException e) {
            System.out.println("Error connecting to database " + Arrays.toString(e.getStackTrace()));
        }
    }
}