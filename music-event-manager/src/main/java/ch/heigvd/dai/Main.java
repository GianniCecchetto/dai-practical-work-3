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
            BenefitsController benefitsController = new BenefitsController(conn);
            GroupEventController groupEventController = new GroupEventController(conn);

            // Users routes
            app.get("/api/users",usersController::getAll);
            app.post("/api/users", usersController::create);
            app.get("/api/users/{id}", usersController::getOne);
            app.put("/api/users/{id}", usersController::update);
            app.delete("/api/users/{id}", usersController::delete);



            app.get("/benefits/{id}", benefitsController::getOne);
            app.get("/benefits", benefitsController::getAll);

            app.get("/", ctx -> ctx.render("root.jte"));
            app.get("/moi", ctx -> ctx.render("moi.jte", Collections.singletonMap("events", events)));

            app.get("/group_event/{id}", groupEventController::getAll);


            app.start(7000);
        } catch(SQLException e) {
            System.out.println("Error connecting to database " + Arrays.toString(e.getStackTrace()));
        }
    }
}
