package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.User;
import io.javalin.http.*;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

public class UsersController {
    private final Connection connection;

    public UsersController(Connection connection) {
        this.connection = connection;

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
        String sql = "SELECT * FROM personne";
        List<User> users = new ArrayList<>();

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                User user = new User();
                user.id = (rs.getInt("id")); // Assurez-vous que les colonnes existent
                user.nom = (rs.getString("nom"));
                user.prenom = (rs.getString("prenom"));
                user.adresse = (rs.getString("adresse"));
                user.num_tel = (rs.getString("num_tel"));
                user.email = (rs.getString("email"));

                users.add(user);
            }
        }

        // Retourner la liste des utilisateurs en réponse JSON
        ctx.json(users);
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