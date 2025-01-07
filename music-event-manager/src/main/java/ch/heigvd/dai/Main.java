package ch.heigvd.dai;

import io.javalin.Javalin;
import gg.jte.ContentType;
import gg.jte.TemplateEngine;
import gg.jte.TemplateOutput;
import gg.jte.output.StringOutput;
import gg.jte.resolve.DirectoryCodeResolver;

import java.io.IOException;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;

import java.sql.*;

public class Main {
    public static void main(String[] args) {
        Database database = new Database();
        try {
            database.connect();
            for (String arg : args) {
                switch (arg) {
                case "--init":
                    database.init();
                    break;
                case "--seed":
                    database.seed();
                    break;
                }
            }
        } catch (SQLException | IOException e) {
            System.err.println(e.getMessage());
        } finally {
            database.disconnect();
        }

        // Définir le répertoire contenant les fichiers JTE
        Path templateDirectory = Path.of("templates");
        DirectoryCodeResolver codeResolver = new DirectoryCodeResolver(templateDirectory);

        // Créer le moteur de template
        TemplateEngine templateEngine = TemplateEngine.create(codeResolver, ContentType.Html);

        // Démarrer Javalin
        Javalin app = Javalin.create(config -> {
        //config.staticFiles.add("public"); // Ajouter des fichiers statiques si nécessaire
        }).start(7000);

        // Route pour afficher une page HTML
        app.get("/", ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("message", "Bienvenue sur ma page dynamique avec Javalin et JTE !");

            // Rendre le template
            StringOutput output = new StringOutput();
            templateEngine.render("index.jte", model, output);

            // Renvoyer le contenu HTML
            ctx.html(output.toString());
        });
    }
}
