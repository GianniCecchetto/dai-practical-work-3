package ch.heigvd.dai.controller;

import ch.heigvd.dai.model.User;
import io.javalin.http.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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

        Statement stmt = connection.createStatement();

        ResultSet resultSet = stmt.executeQuery("SELECT * FROM personne");

        while (resultSet.next())
        {
            String columnValue = resultSet.getString("column_name");
            System.out.println("Column Value: " + columnValue);
        }

        resultSet.close();
        stmt.close();

        for (User user : users.values()) {
            if (user.email.equalsIgnoreCase(newUser.email)) {
                throw new ConflictResponse();
            }
        }

        User user = new User();

        user.nom = newUser.nom;
        user.prenom = newUser.prenom;
        user.adresse = newUser.adresse;
        user.num_tel = newUser.num_tel;
        user.email = newUser.email;

        // SQL COMMAND TO INSERT USER INTO DATABASE
        Statement statement = connection.createStatement();

        String sql = "INSERT INTO personne(nom, prenom, adresse, num_tel, email) VALUES (nom, prenom, adresse, num_tel, email)";
        


        ctx.status(HttpStatus.CREATED);
        ctx.json(user);
    }

    public void getOne(Context ctx) {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        // SQL COMMAND TO INSERT USER INTO DATABASE
        User user = users.get(id);

        if (user == null) {
            throw new NotFoundResponse();
        }

        ctx.json(user);
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

        User user = users.get(id);

        if (user == null) {
            throw new NotFoundResponse();
        }

        user.firstName = updateUser.firstName;
        user.lastName = updateUser.lastName;
        user.email = updateUser.email;
        user.password = updateUser.password;

        // SQL COMMAND TO INSERT USER INTO DATABASE
        users.put(id, user);

        ctx.json(user);
    }

    public void delete(Context ctx) {
        Integer id = ctx.pathParamAsClass("id", Integer.class).get();

        if (!users.containsKey(id)) {
            throw new NotFoundResponse();
        }

        // SQL COMMAND TO INSERT USER INTO DATABASE
        users.remove(id);

        ctx.status(HttpStatus.NO_CONTENT);
    }
}