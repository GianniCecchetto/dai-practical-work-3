package ch.heigvd.dai;

import okio.Path;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.*;
import java.util.Properties;

public class Database {
    private Connection connection;
    private Statement statement;

    public void connect() throws SQLException {
        final String url = "jdbc:postgresql://localhost:5432/bdr";
        final Properties props = new Properties();
        props.setProperty("user", "bdr");
        props.setProperty("password", "bdr");

        this.connection = DriverManager.getConnection(url, props);
        this.statement = connection.createStatement();
    }

    public void disconnect() {
        try {
            if (statement != null)
                statement.close();
            if (connection != null)
                connection.close();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    private void executeScript(String name) throws SQLException, IOException {
        if (connection == null || statement == null)
            return;

        connection.setAutoCommit(false);
        String sqlScript = new String(Files.readAllBytes(Paths.get(name)));
        String[] sqlStatements = sqlScript.split(";");
        for (String sql : sqlStatements) {
            statement.execute(sql.trim());
        }

        connection.commit();
        connection.setAutoCommit(true);

        System.out.println("SQL script executed successfully.");
    }

    public void init() throws SQLException, IOException {
        System.out.println();
        executeScript("./music-event-manager/scripts/init.sql");
    }
    public void seed() throws SQLException, IOException {
        executeScript("./music-event-manager/scripts/seed.sql");
    }

}