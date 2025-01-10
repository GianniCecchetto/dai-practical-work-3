package ch.heigvd.dai;

import io.javalin.Javalin;
import io.javalin.rendering.template.JavalinJte;


public class Main {
    public static void main(String[] args) {
        Javalin app = Javalin.create(
                config -> { config.fileRenderer(new JavalinJte()); }
        ).start(7000);

        app.get("/", ctx -> ctx.render("root.jte"));
    }
}
