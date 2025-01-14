SET search_path = embedded;

-- Insérer des données dans la table lieu
INSERT INTO lieu (nom, adresse, NPA) VALUES
('Palais des Congrès', '1 Rue des Expositions', '75001'),
('Centre Sportif', '10 Avenue du Stade', '75002'),
('Parc des Expositions', '5 Boulevard des Jardins', '75003'),
('Théâtre Municipal', '3 Rue des Arts', '75004'),
('Salle Polyvalente', '12 Rue Centrale', '75005'),
('Place Centrale', 'Grand Place', '75006'),
('Cinéma Paradiso', '8 Rue du Cinéma', '75007'),
('Halle Municipale', '2 Avenue des Marchés', '75008'),
('Parc Urbain', 'Avenue des Fleurs', '75009'),
('Stade National', 'Route du Stade', '75010');

-- Insérer des données dans la table evenement
INSERT INTO evenement (nom, description, prix_entree, date_debut, date_fin, lieu_id) VALUES
('Festival de Musique', 'Un festival avec des groupes locaux et internationaux.', 50.00, '2024-06-10', '2024-06-12', 1),
('Salon de la Gastronomie', 'Découvrez les meilleurs chefs et stands gastronomiques.', 20.00, '2024-06-15', '2024-06-17', 2),
('Exposition d Art', 'Des artistes contemporains présentent leurs œuvres.', 10.00, '2024-06-20', '2024-06-22', 3),
('Conférence Tech', 'Un événement pour les passionnés de technologie.', 100.00, '2024-07-01', '2024-07-03', 4),
('Foire Agricole', 'Événement familial avec des activités agricoles.', 15.00, '2024-07-10', '2024-07-12', 5),
('Marché de Noël', 'Vente de produits artisanaux et animations.', 5.00, '2024-12-01', '2024-12-24', 6),
('Tournoi de Sports', 'Compétitions entre équipes locales.', 0.00, '2024-08-15', '2024-08-17', 7),
('Projection de Films', 'Films cultes projetés en plein air.', 10.00, '2024-09-10', '2024-09-12', 8),
('Festival Enfantin', 'Animations pour enfants et familles.', 8.00, '2024-10-01', '2024-10-03', 9),
('Concert Caritatif', 'Pour une cause solidaire.', 25.00, '2024-11-01', '2024-11-02', 10);

-- Insérer des données dans la table restaurateur
INSERT INTO restaurateur (nom, description) VALUES
('Chez Léon', 'Cuisine française traditionnelle.'),
('Pizza Bella', 'Pizzas artisanales et produits italiens.'),
('Sushi Zen', 'Spécialités japonaises de qualité.'),
('Le Gourmet Bio', 'Produits bio et locaux.'),
('Tacos Fiesta', 'Authentiques tacos mexicains.'),
('Sweet Tooth', 'Desserts et pâtisseries.'),
('Burger Town', 'Burgers faits maison.'),
('Café du Coin', 'Boissons chaudes et snacks.'),
('La Crêperie', 'Crêpes bretonnes salées et sucrées.'),
('Brasserie Royale', 'Bière artisanale et plats copieux.');

-- Insérer des données dans la table stand
INSERT INTO stand (taille, cout, restaurateur_id, evenement_id) VALUES
(10.5, 200.00, 1, 1),
(8.0, 150.00, 2, 1),
(12.0, 250.00, 3, 2),
(15.0, 300.00, 4, 2),
(7.0, 100.00, 5, 3),
(10.0, 200.00, 6, 3),
(8.5, 180.00, 7, 4),
(9.0, 190.00, 8, 4),
(10.0, 210.00, 9, 5),
(14.0, 280.00, 10, 5);

-- Insérer des données dans la table plat
INSERT INTO plat (nom, description, cout, restaurateur_id) VALUES
('Coq au Vin', 'Poulet cuisiné au vin rouge.', 15.00, 1),
('Margherita', 'Pizza classique à la tomate et mozzarella.', 12.00, 2),
('Sashimi de Saumon', 'Saumon frais servi cru.', 20.00, 3),
('Salade Quinoa', 'Quinoa avec légumes bio.', 10.00, 4),
('Tacos Al Pastor', 'Tacos de porc mariné.', 8.00, 5),
('Éclair au Chocolat', 'Dessert pâtissier.', 5.00, 6),
('Double Cheeseburger', 'Burger avec double viande.', 14.00, 7),
('Club Sandwich', 'Sandwich classique.', 8.00, 8),
('Crêpe Sucrée', 'Crêpe au sucre et beurre.', 5.00, 9),
('Choucroute', 'Plat alsacien traditionnel.', 18.00, 10);

-- Insérer des données dans la table boisson
INSERT INTO boisson (nom, cout, contenance, restaurateur_id) VALUES
('Vin Rouge', 5.00, 0.2, 1),
('Coca-Cola', 2.00, 0.33, 2),
('Thé Vert', 3.00, 0.25, 3),
('Smoothie Bio', 4.00, 0.3, 4),
('Margarita', 6.00, 0.2, 5),
('Café', 2.50, 0.15, 6),
('Limonade Maison', 3.00, 0.4, 7),
('Chocolat Chaud', 3.50, 0.25, 8),
('Cidre', 4.00, 0.5, 9),
('Bière Blonde', 5.00, 0.5, 10);

-- Insertion des données pour la table groupe
INSERT INTO groupe (nom, genre) VALUES
('The Rockers', 'Rock'),
('Jazz Lovers', 'Jazz'),
('Classical Ensemble', 'Classique'),
('Pop Stars', 'Pop'),
('Metal Fury', 'Metal'),
('Reggae Vibes', 'Reggae'),
('Electro Beats', 'Electro'),
('Country Roads', 'Country'),
('Hip-Hop Crew', 'Hip-Hop'),
('Latin Rhythms', 'Latino');

-- Insertion des données pour la table scene
INSERT INTO scene (capacite_max, plein_air, cout, evenement_id) VALUES
(500, TRUE, 1000.00, 1),
(300, FALSE, 800.00, 1),
(400, TRUE, 1200.00, 2),
(600, TRUE, 1500.00, 3),
(200, FALSE, 500.00, 4),
(350, TRUE, 700.00, 5),
(450, FALSE, 1100.00, 6),
(500, TRUE, 1300.00, 7),
(250, FALSE, 600.00, 8),
(300, TRUE, 900.00, 9);

-- Insertion des données pour la table concert
INSERT INTO concert (heure_debut, heure_fin, necessite_siege, scene_id, groupe_id) VALUES
('18:00:00', '20:00:00', TRUE, 1, 1),
('21:00:00', '23:00:00', FALSE, 1, 2),
('15:00:00', '17:00:00', TRUE, 2, 3),
('20:00:00', '22:00:00', FALSE, 2, 4),
('19:00:00', '21:00:00', TRUE, 3, 5),
('22:00:00', '23:59:00', FALSE, 3, 6),
('16:00:00', '18:00:00', TRUE, 4, 7),
('20:00:00', '22:00:00', FALSE, 4, 8),
('14:00:00', '16:00:00', TRUE, 5, 9),
('19:00:00', '21:00:00', FALSE, 5, 10);

-- Insertion des données pour la table materiel
INSERT INTO materiel (nom, description, cout) VALUES
('Amplificateur', 'Amplificateur audio haute puissance.', 500.00),
('Microphone', 'Microphone sans fil.', 150.00),
('Projecteur', 'Projecteur lumineux.', 300.00),
('Mixeur Audio', 'Table de mixage audio.', 400.00),
('Baffle', 'Enceinte haute puissance.', 250.00),
('Trépied', 'Support pour équipement.', 50.00),
('Câbles', 'Câbles audio et électriques.', 30.00),
('Batterie', 'Batterie pour instruments.', 200.00),
('Scène Mobile', 'Structure pour concerts.', 1000.00),
('Pupitre', 'Support pour partitions.', 100.00);

-- Insertion des données pour la table materiel_concert
INSERT INTO materiel_concert (materiel_id, concert_id, nombre) VALUES
(1, 1, 2),
(2, 1, 5),
(3, 2, 3),
(4, 2, 1),
(5, 3, 4),
(6, 4, 2),
(7, 5, 10),
(8, 6, 1),
(9, 7, 1),
(10, 8, 3);

-- Insertion des données pour la table personne
INSERT INTO personne (nom, prenom, adresse, num_tel, email) VALUES
('Dupont', 'Jean', '1 Rue de Paris', '0601020304', 'jean.dupont@example.com'),
('Martin', 'Sophie', '10 Avenue de Lyon', '0611121314', 'sophie.martin@example.com'),
('Durand', 'Pierre', '5 Boulevard de Marseille', '0621222324', 'pierre.durand@example.com'),
('Lemoine', 'Claire', '3 Rue de Nice', '0631323334', 'claire.lemoine@example.com'),
('Roux', 'Paul', '12 Rue de Lille', '0641424344', 'paul.roux@example.com'),
('Blanc', 'Lucie', '8 Rue de Bordeaux', '0651525354', 'lucie.blanc@example.com'),
('Noir', 'Jacques', '2 Avenue de Toulouse', '0661626364', 'jacques.noir@example.com'),
('Vert', 'Marie', '4 Rue de Nantes', '0671727374', 'marie.vert@example.com'),
('Bleu', 'Antoine', '6 Rue de Rennes', '0681828384', 'antoine.bleu@example.com'),
('Jaune', 'Julie', '7 Avenue de Strasbourg', '0691929394', 'julie.jaune@example.com');

-- Insertion des données pour la table artiste
INSERT INTO artiste (personne_id, cout, score_popularite, groupe_id) VALUES
(1, 2000.00, 85.00, 1),
(2, 1800.00, 78.00, 2),
(3, 2200.00, 90.00, 3),
(4, 2500.00, 92.00, 4),
(5, 1900.00, 80.00, 5),
(6, 1700.00, 75.00, 6),
(7, 2100.00, 88.00, 7),
(8, 2400.00, 91.00, 8),
(9, 2000.00, 86.00, 9),
(10, 2600.00, 95.00, 10);

-- Insertion des données pour la table spectateur
INSERT INTO spectateur (personne_id) VALUES
(6), (7), (8), (9), (10);

-- Insertion des données pour la table intervenant
INSERT INTO intervenant (personne_id, role, salaire) VALUES
(1, 'Technicien', 1500.00),
(2, 'Organisateur', 2500.00),
(3, 'Sécurité', 1800.00),
(4, 'Logistique', 2000.00),
(5, 'Communication', 2200.00);

-- Insertion des données pour la table siege
INSERT INTO siege (concert_id, place, categorie, prix, spectateur_id) VALUES
(1, 1, 'VIP', 100.00, 6),
(1, 2, 'Standard', 50.00, 7),
(2, 1, 'Standard', 60.00, 8),
(3, 1, 'VIP', 120.00, 9),
(4, 1, 'Standard', 80.00, 10);

-- Insertion des données pour la table spectateur_evenement
INSERT INTO spectateur_evenement (evenement_id, spectateur_id, prix) VALUES
(1, 6, 50.00),
(2, 7, 20.00),
(3, 8, 10.00),
(4, 9, 100.00),
(5, 10, 15.00);

-- Vue pour obtenir les événements avec leurs lieux
CREATE OR REPLACE VIEW vue_evenement_lieu AS
SELECT
    e.id AS evenement_id,
    e.nom AS evenement_nom,
    e.date_debut,
    e.date_fin,
    e.prix_entree,
    l.nom AS lieu_nom,
    l.adresse,
    l.NPA
FROM evenement e
JOIN lieu l ON e.lieu_id = l.id;

-- Vue pour obtenir les concerts avec les scènes et groupes
CREATE OR REPLACE VIEW vue_concert_details AS
SELECT
    c.id AS concert_id,
    c.heure_debut,
    c.heure_fin,
    c.necessite_siege,
    sc.capacite_max,
    sc.plein_air,
    g.nom AS groupe_nom,
    e.nom AS evenement_nom
FROM concert c
JOIN scene sc ON c.scene_id = sc.id
JOIN groupe g ON c.groupe_id = g.id
JOIN evenement e ON sc.evenement_id = e.id;

-- Vue pour les recettes générées par les événements
CREATE OR REPLACE VIEW vue_recettes_evenement AS
SELECT
    e.id AS evenement_id,
    e.nom AS evenement_nom,
    SUM(s.cout) AS recettes_stands,
    SUM(se.prix) AS recettes_billets
FROM evenement e
LEFT JOIN stand s ON s.evenement_id = e.id
LEFT JOIN spectateur_evenement se ON se.evenement_id = e.id
GROUP BY e.id, e.nom;

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

-- Création des requêtes

-- Requête pour obtenir les événements par lieu
SELECT * FROM vue_evenement_lieu WHERE lieu_nom = 'Palais des Congrès';

-- Requête pour les recettes totales d'un événement
SELECT * FROM vue_recettes_evenement WHERE evenement_nom = 'Festival de Musique';

-- Requête pour obtenir les concerts d'un groupe spécifique
SELECT * FROM vue_concert_details WHERE groupe_nom = 'The Rockers';

-- Requête pour les concerts nécessitant des sièges
SELECT * FROM vue_concert_details WHERE necessite_siege = TRUE;

-- Requête pour les spectateurs inscrits à un événement donné
SELECT sp.nom, sp.prenom, sp.email
FROM spectateur_evenement se
JOIN spectateur s ON se.spectateur_id = s.personne_id
JOIN personne sp ON s.personne_id = sp.id
WHERE se.evenement_id = (SELECT id FROM evenement WHERE nom = 'Festival de Musique');
