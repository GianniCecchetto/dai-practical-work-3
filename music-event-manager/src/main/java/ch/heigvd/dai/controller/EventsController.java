package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.Events;
import ch.heigvd.dai.model.Event;
import ch.heigvd.dai.model.Lieu;
import ch.heigvd.dai.model.User;
import io.javalin.http.Context;
import io.javalin.http.HttpStatus;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EventsController {
    private final Connection connection;
    public Events events;

    public EventsController(Connection connection, Events events) {
        this.connection = connection;
        this.events = events;
    }

    public void create(Context ctx) throws SQLException {
        User newUser =
                ctx.bodyValidator(User.class)
                        .check(obj -> obj.nom != null, "Missing last name")
                        .check(obj -> obj.prenom != null, "Missing first name")
                        .check(obj -> obj.adresse != null, "Missing address")
                        .check(obj -> obj.num_tel != null, "Missing phone number")
                        .check(obj -> obj.email != null, "Missing email")
                        .get();

        /*Statement stmt = connection.createStatement();

        ResultSet resultSet = stmt.executeQuery("SELECT * FROM personne");

        while (resultSet.next())
        {
            String columnValue = resultSet.getString("column_name");
            System.out.println("Column Value: " + columnValue);
        }

        resultSet.close();
        stmt.close();*/


        User user = new User();

        user.nom = newUser.nom;
        user.prenom = newUser.prenom;
        user.adresse = newUser.adresse;
        user.num_tel = newUser.num_tel;
        user.email = newUser.email;

        // SQL COMMAND TO INSERT USER INTO DATABASE
        //Statement statement = connection.createStatement();

        String sql = "INSERT INTO personne(nom, prenom, adresse, num_tel, email) VALUES (nom, prenom, adresse, num_tel, email)";
        


        ctx.status(HttpStatus.CREATED);
        ctx.json(user);
    }

    public void getAll(Context ctx) throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("La connexion à la base de données est fermée ou non initialisée.");
        }

        String sql = "SELECT * FROM vue_evenement_lieu;";

        try (Statement stmt = connection.createStatement()) {
            ResultSet resultSet = stmt.executeQuery(sql);
            while (resultSet.next()) {
                events.events.add(new Event(
                        resultSet.getInt("evenement_id"),
                        resultSet.getString("evenement_nom"),
                        resultSet.getDate("date_debut"),
                        resultSet.getDate("date_fin"),
                        resultSet.getFloat("prix_entree"),
                        new Lieu(
                                resultSet.getString("lieu_nom"),
                                resultSet.getString("adresse"),
                                resultSet.getInt("NPA")
                        )
                ));
            }
        }
    }

    public void getOne(Context ctx) throws SQLException {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        // SQL COMMAND TO INSERT USER INTO DATABASE
        String sql = "SELECT * FROM utilisateur";

        Statement stmt = connection.createStatement();

        ResultSet rs = stmt.executeQuery(sql);


    }

    public void update(Context ctx) {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        User updateUser =
                ctx.bodyValidator(User.class)
                        .check(obj -> obj.nom != null, "Missing last name")
                        .check(obj -> obj.prenom != null, "Missing first name")
                        .check(obj -> obj.adresse != null, "Missing address")
                        .check(obj -> obj.num_tel != null, "Missing phone number")
                        .check(obj -> obj.email != null, "Missing email")
                        .get();


//        user.firstName = updateUser.firstName;
//        user.lastName = updateUser.lastName;
//        user.email = updateUser.email;
//        user.password = updateUser.password;

        // SQL COMMAND TO INSERT USER INTO DATABASE

    }

    public void delete(Context ctx) {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

//        if (!users.containsKey(id)) {
//            throw new NotFoundResponse();
//        }
//
//        // SQL COMMAND TO INSERT USER INTO DATABASE
//        users.remove(id);

        ctx.status(HttpStatus.NO_CONTENT);
    }
}