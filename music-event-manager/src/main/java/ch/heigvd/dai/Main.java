package ch.heigvd.dai;

import ch.heigvd.dai.model.*;
import io.javalin.Javalin;
import io.javalin.rendering.template.JavalinJte;

import java.util.Collections;


public class Main {
    public static void main(String[] args) {
        Javalin app = Javalin.create(
                config -> { config.fileRenderer(new JavalinJte()); }
        ).start(7000);

        AllEvents allEvents = new AllEvents();
        allEvents.events.add(new Event("A","B"));
        allEvents.events.add(new Event("A","C"));

        app.get("/", ctx -> ctx.render("root.jte"));
        app.get("/moi", ctx -> ctx.render("moi.jte", Collections.singletonMap("allEvents", allEvents)));
    }
}
