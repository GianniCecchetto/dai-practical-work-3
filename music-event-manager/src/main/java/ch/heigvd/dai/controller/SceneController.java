package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Scene;
import ch.heigvd.dai.model.Event;
import ch.heigvd.dai.model.Equipement;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class SceneController {
    private final Connection connection;

    public SceneController(Connection connection) {
        this.connection = connection;
    }

    public void showAllScenes(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        ctx.render("scenes.jte", Map.of("scenes", Scene.getAll(connection, id), "event", Event.getOne(connection, id)));
    }

    public void showDetails(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();
        Integer sceneId = ctx.pathParamAsClass("scene_id", Integer.class).get();

        Scene scene = Scene.getOne(connection, sceneId);

        ctx.render("sceneDetail.jte", Map.of("scene", scene));
    }

    public void showEquipement(Context ctx) throws SQLException {
        Integer sceneId = ctx.pathParamAsClass("scene_id", Integer.class).get();

        Scene scene = Scene.getOne(connection, sceneId);

        List<Equipement> equipements = Equipement.getEquipementsBySceneId(connection, sceneId);

        ctx.render("sceneEquipement.jte", Map.of("scene", scene, "equipements", equipements));
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
            Integer maxCapacity = ctx.formParamAsClass("maxCapacity", Integer.class).get();
            Boolean openAir = ctx.formParam("openAir") != null; // Checkbox renvoie null si non cochée
            Double cost = ctx.formParamAsClass("cost", Double.class).get();
            Integer eventId = ctx.formParamAsClass("eventId", Integer.class).get();

            Scene scene = new Scene(null, maxCapacity, openAir, cost, eventId);
            Scene.create(connection, scene);

            ctx.redirect("/scenes");
        } catch (Exception e) {
            ctx.status(400).result("Erreur lors de l'insertion de la scène : " + e.getMessage());
        }
    }



}
