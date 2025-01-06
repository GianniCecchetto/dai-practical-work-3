package ch.heigvd.dai;

import io.javalin.Javalin;

public class Main {
    public static void main(String[] args) {
        Javalin app = Javalin.create();



        app.post();
    }
}