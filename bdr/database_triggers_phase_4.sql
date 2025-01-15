SET search_path = embedded;

-- Création des triggers

-- Trigger pour vérifier les dates des événements
CREATE OR REPLACE FUNCTION verif_dates_evenement() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.date_fin < NEW.date_debut THEN
        RAISE EXCEPTION 'La date de fin doit être postérieure à la date de début';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verif_dates_evenement
BEFORE INSERT OR UPDATE ON evenement
FOR EACH ROW EXECUTE FUNCTION verif_dates_evenement();

-- Trigger pour vérifier les heures des événements
CREATE OR REPLACE FUNCTION verif_heures_concert() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.heure_fin <= NEW.heure_debut THEN
        RAISE EXCEPTION 'L heure de fin doit être postérieure à l heure de début';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verif_heures_concert
BEFORE INSERT OR UPDATE ON concert
FOR EACH ROW EXECUTE FUNCTION verif_heures_concert();

-- Trigger pour vérifier la capacité des sièges
CREATE OR REPLACE FUNCTION verif_capacite_siege() RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT COUNT(*) FROM siege WHERE concert_id = NEW.concert_id) >=
       (SELECT capacite_max FROM scene WHERE id = NEW.concert_id) THEN
        RAISE EXCEPTION 'Capacité maximale de la scène atteinte';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verif_capacite_siege
BEFORE INSERT ON siege
FOR EACH ROW EXECUTE FUNCTION verif_capacite_siege();
