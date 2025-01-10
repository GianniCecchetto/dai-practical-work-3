package ch.heigvd.dai;

import ch.heigvd.dai.controller.AuthController;
import ch.heigvd.dai.controller.UsersController;
import ch.heigvd.dai.model.User;
import io.javalin.Javalin;

import java.util.concurrent.ConcurrentHashMap;

public class Main {
    public static void main(String[] args) {
        Javalin app = Javalin.create();

        // This will serve as our database
        ConcurrentHashMap<Integer, User> users = new ConcurrentHashMap<>();

        // Controllers
        AuthController authController = new AuthController(users);
        UsersController usersController = new UsersController(users);

        // Auth routes
        app.post("/login", authController::login);
        app.post("/logout", authController::logout);
        app.get("/profile", authController::profile);

        // Users routes
        app.post("/users", usersController::create);
        app.get("/users", usersController::getMany);
        app.get("/users/{id}", usersController::getOne);
        app.put("/users/{id}", usersController::update);
        app.delete("/users/{id}", usersController::delete);

        app.start(7000);
    }
}