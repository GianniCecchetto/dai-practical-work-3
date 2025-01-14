package ch.heigvd.dai.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public record Event(Integer id, String nom, Date debut, Date fin, Float prix, Lieu lieu) {
    @Override
    public String toString() {
        return id + " " + nom + " " + debut + " " + fin + " " + prix + " " + lieu;
    }
}
