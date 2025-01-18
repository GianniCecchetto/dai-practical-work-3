package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Scene;
import ch.heigvd.dai.model.Event;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class SceneController {
    private final Connection connection;

    public SceneController(Connection connection) {
        this.connection = connection;
    }

    public void showAllScenes(Context ctx) throws SQLException {
        ctx.render("scenes.jte", Map.of("scenes", Scene.getAll(connection)));
    }

    public void showDetails(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        Scene scene = Scene.getOne(connection, id);

        ctx.render("sceneDetail.jte", Map.of("scene", scene));
    }

    public void insertScene(Context ctx) throws SQLException {
        ctx.render("insertScene.jte", Map.of("events", Event.getAll(connection)));
    }

    public void modifyScene(Context ctx) throws SQLException {
        ctx.render("modifyScene.jte");
    }

    public void deleteScene(Context ctx) throws SQLException {
        ctx.render("deleteScene.jte");
    }

    public void handleInsertScene(Context ctx) throws SQLException {
        try {
            // Récupérer les données du formulaire
            Integer maxCapacity = ctx.formParamAsClass("maxCapacity", Integer.class).get();
            Boolean openAir = ctx.formParam("openAir") != null; // Checkbox renvoie null si non cochée
            Double cost = ctx.formParamAsClass("cost", Double.class).get();
            Integer eventId = ctx.formParamAsClass("eventId", Integer.class).get();

            // Créer une nouvelle scène
            Scene scene = new Scene(null, maxCapacity, openAir, cost, eventId);

            // Insérer la scène dans la base de données
            Scene.create(connection, scene);

            // Rediriger vers la liste des scènes
            ctx.redirect("/scenes");
        } catch (Exception e) {
            ctx.status(400).result("Erreur lors de l'insertion de la scène : " + e.getMessage());
        }
    }



}
