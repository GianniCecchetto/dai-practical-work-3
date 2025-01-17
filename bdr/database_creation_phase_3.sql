DROP SCHEMA IF EXISTS embedded CASCADE;
CREATE SCHEMA embedded;

SET search_path = embedded;

-- Table lieu
CREATE TABLE lieu
(
    id      SERIAL PRIMARY KEY,
    nom     VARCHAR(255) NOT NULL,
    adresse VARCHAR(255),
    NPA     VARCHAR(10)
);

-- Table evenement
CREATE TABLE evenement
(
    id          SERIAL PRIMARY KEY,
    nom         VARCHAR(255) NOT NULL,
    description TEXT,
    prix_entree DECIMAL(10, 2),
    date_debut  DATE         NOT NULL,
    date_fin    DATE         NOT NULL,
    lieu_id     INT          NOT NULL,
    FOREIGN KEY (lieu_id) REFERENCES lieu (id)
);

-- Table restaurateur
CREATE TABLE restaurateur
(
    id          SERIAL PRIMARY KEY,
    nom         VARCHAR(255) NOT NULL,
    description TEXT
);

-- Table stand
CREATE TABLE stand
(
    id              SERIAL PRIMARY KEY,
    taille          DECIMAL(10, 2) NOT NULL,
    cout            DECIMAL(10, 2) NOT NULL,
    restaurateur_id INT,
    evenement_id    INT            NOT NULL,
    FOREIGN KEY (restaurateur_id) REFERENCES restaurateur (id),
    FOREIGN KEY (evenement_id) REFERENCES evenement (id)
);

-- Table plat
CREATE TABLE plat
(
    id              SERIAL PRIMARY KEY,
    nom             VARCHAR(255)   NOT NULL,
    description     TEXT,
    cout            DECIMAL(10, 2) NOT NULL,
    restaurateur_id INT            NOT NULL,
    FOREIGN KEY (restaurateur_id) REFERENCES restaurateur (id)
);

-- Table boisson
CREATE TABLE boisson
(
    id              SERIAL PRIMARY KEY,
    nom             VARCHAR(255)   NOT NULL,
    cout            DECIMAL(10, 2) NOT NULL,
    contenance      DECIMAL(10, 2),
    restaurateur_id INT            NOT NULL,
    FOREIGN KEY (restaurateur_id) REFERENCES restaurateur (id)
);

-- Table menu
CREATE TABLE menu
(
    cout            DECIMAL(10, 2) NOT NULL,
    restaurateur_id INT            NOT NULL,
    plat_id         INT            NOT NULL,
    boisson_id      INT            NOT NULL,
    PRIMARY KEY (restaurateur_id, plat_id, boisson_id),
    FOREIGN KEY (restaurateur_id) REFERENCES restaurateur (id),
    FOREIGN KEY (plat_id) REFERENCES plat (id),
    FOREIGN KEY (boisson_id) REFERENCES boisson (id)
);

-- Table scene
CREATE TABLE scene
(
    id           SERIAL PRIMARY KEY,
    capacite_max INT,
    plein_air    BOOLEAN        NOT NULL,
    cout         DECIMAL(10, 2) NOT NULL,
    evenement_id INT            NOT NULL,
    FOREIGN KEY (evenement_id) REFERENCES evenement (id)
);

-- Table groupe
CREATE TABLE groupe
(
    id    SERIAL PRIMARY KEY,
    nom   VARCHAR(255) NOT NULL,
    genre VARCHAR(255)
);

-- Table concert
CREATE TABLE concert
(
    id              SERIAL PRIMARY KEY,
    date            DATE    NOT NULL,
    heure_debut     TIME    NOT NULL,
    heure_fin       TIME    NOT NULL,
    necessite_siege BOOLEAN NOT NULL,
    scene_id        INT     NOT NULL,
    groupe_id       INT     NOT NULL,
    FOREIGN KEY (scene_id) REFERENCES scene (id),
    FOREIGN KEY (groupe_id) REFERENCES groupe (id)
);

-- Table materiel
CREATE TABLE materiel
(
    id          SERIAL PRIMARY KEY,
    nom         VARCHAR(255)   NOT NULL,
    description TEXT,
    cout        DECIMAL(10, 2) NOT NULL
);

-- Table materiel_concert
CREATE TABLE materiel_concert
(
    materiel_id INT,
    concert_id  INT,
    nombre      INT NOT NULL,
    PRIMARY KEY (materiel_id, concert_id),
    FOREIGN KEY (materiel_id) REFERENCES materiel (id),
    FOREIGN KEY (concert_id) REFERENCES concert (id)
);

-- Table personne
CREATE TABLE personne
(
    id      SERIAL PRIMARY KEY,
    nom     VARCHAR(255) NOT NULL,
    prenom  VARCHAR(255) NOT NULL,
    adresse VARCHAR(255),
    num_tel VARCHAR(15),
    email   VARCHAR(255) NOT NULL
);

-- Table artiste
CREATE TABLE artiste
(
    personne_id      INT PRIMARY KEY NOT NULL,
    cout             DECIMAL(10, 2)  NOT NULL,
    score_popularite DECIMAL(10, 2),
    groupe_id        INT,
    FOREIGN KEY (personne_id) REFERENCES personne (id),
    FOREIGN KEY (groupe_id) REFERENCES groupe (id)
);

-- Table spectateur
CREATE TABLE spectateur
(
    personne_id INT PRIMARY KEY NOT NULL,
    FOREIGN KEY (personne_id) REFERENCES personne (id)
);

-- Table intervenant
CREATE TABLE intervenant
(
    personne_id INT PRIMARY KEY NOT NULL,
    role        VARCHAR(255)    NOT NULL,
    salaire     DECIMAL(10, 2)  NOT NULL,
    FOREIGN KEY (personne_id) REFERENCES personne (id)
);

-- Table siege
CREATE TABLE siege
(
    concert_id INT,
    place      INT,
    categorie  VARCHAR(255),
    prix       DECIMAL(10, 2) NOT NULL,
    spectateur_id INT,
    PRIMARY KEY (concert_id, place),
    FOREIGN KEY (concert_id) REFERENCES concert (id),
    FOREIGN KEY (spectateur_id) REFERENCES spectateur (personne_id)
);

-- Table billet
CREATE TABLE spectateur_evenement
(
    evenement_id  INT,
    spectateur_id INT,
    prix          DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (evenement_id, spectateur_id),
    FOREIGN KEY (evenement_id) REFERENCES evenement (id),
    FOREIGN KEY (spectateur_id) REFERENCES spectateur (personne_id)
);

-- Table billet_spectateur
