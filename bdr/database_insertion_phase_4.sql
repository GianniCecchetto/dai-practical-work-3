-- Insérer des lieux
INSERT INTO lieu (nom, adresse, NPA) VALUES
('Salle Polyvalente', 'Rue de la Gare 12', '1000'),
('Parc des Étoiles', 'Avenue des Champs 24', '2000'),
('Théâtre Antique', 'Chemin du Vieux Théâtre', '3000');

-- Insérer des événements
INSERT INTO evenement (nom, description, prix_entree, date_debut, date_fin, lieu_id) VALUES
('Festival de Jazz', 'Un festival annuel de jazz.', 50.00, '2025-06-01', '2025-06-03', 1),
('Rock en Plein Air', 'Concert rock sous les étoiles.', 75.00, '2025-07-10', '2025-07-12', 2),
('Soirée Classique', 'Une soirée dédiée à la musique classique.', 30.00, '2025-08-15', '2025-08-15', 3);

-- Insérer des restaurateurs
INSERT INTO restaurateur (nom, description) VALUES
('Foodies Gourmet', 'Cuisine de qualité supérieure.'),
('Burger Paradise', 'Les meilleurs burgers.'),
('Vegan Treats', 'Options végétaliennes et saines.');

-- Insérer des stands
INSERT INTO stand (taille, cout, restaurateur_id, evenement_id) VALUES
(15.5, 500.00, 1, 1),
(20.0, 600.00, 2, 2),
(12.0, 400.00, 3, 3);

-- Insérer des plats
INSERT INTO plat (nom, description, cout, restaurateur_id) VALUES
('Sandwich Gourmet', 'Un délicieux sandwich artisanal.', 15.00, 1),
('Cheeseburger', 'Un burger classique avec fromage.', 12.00, 2),
('Salade Vegan', 'Une salade saine et fraîche.', 10.00, 3);

-- Insérer des boissons
INSERT INTO boisson (nom, cout, contenance, restaurateur_id) VALUES
('Limonade Maison', 3.50, 0.5, 1),
('Cola', 2.50, 0.33, 2),
('Smoothie Mangue', 5.00, 0.4, 3);

-- Insérer des menus
INSERT INTO menu (cout, restaurateur_id, plat_id, boisson_id) VALUES
(18.00, 1, 1, 1),
(14.00, 2, 2, 2),
(13.00, 3, 3, 3);

-- Insérer des scènes
INSERT INTO scene (capacite_max, plein_air, cout, evenement_id) VALUES
(500, FALSE, 1000.00, 1),
(1000, TRUE, 1500.00, 2),
(300, FALSE, 700.00, 3);

-- Insérer des groupes
INSERT INTO groupe (nom, genre) VALUES
('Jazz Masters', 'Jazz'),
('Rock Rebels', 'Rock'),
('Orchestre Symphonique', 'Classique');

-- Insérer des concerts
INSERT INTO concert (date, heure_debut, heure_fin, necessite_siege, scene_id, groupe_id) VALUES
('2025-06-01', '18:00', '20:00', TRUE, 1, 1),
('2025-07-10', '20:00', '22:00', FALSE, 2, 2),
('2025-08-15', '19:30', '21:30', TRUE, 3, 3);

-- Insérer des matériels
INSERT INTO materiel (nom, description, cout) VALUES
('Projecteur', 'Projecteur LED haute luminosité.', 500.00),
('Enceintes', 'Système audio haute qualité.', 1000.00),
('Microphone', 'Micro sans fil.', 200.00);

-- Associer matériels aux concerts
INSERT INTO materiel_concert (materiel_id, concert_id, nombre) VALUES
(1, 1, 2),
(2, 2, 4),
(3, 3, 3);

-- Insérer des personnes
INSERT INTO personne (nom, prenom, adresse, num_tel, email) VALUES
('Dupont', 'Jean', 'Rue de la Paix 5', '123456789', 'jean.dupont@example.com'),
('Martin', 'Claire', 'Avenue des Fleurs 10', '987654321', 'claire.martin@example.com'),
('Durand', 'Paul', 'Boulevard Central 3', '654321987', 'paul.durand@example.com');

-- Insérer artistes
INSERT INTO artiste (personne_id, cout, score_popularite, groupe_id) VALUES
(1, 1000.00, 95.00, 1),
(2, 1200.00, 90.00, 2),
(3, 800.00, 85.00, 3);

-- Insérer spectateurs
INSERT INTO spectateur (personne_id) VALUES
(1),
(2),
(3);

-- Insérer sièges
INSERT INTO siege (concert_id, place, categorie, prix, spectateur_id) VALUES
(1, 1, 'VIP', 100.00, 1),
(2, 2, 'Standard', 50.00, 2),
(3, 3, 'Economique', 30.00, 3);

-- Associer spectateurs aux événements
INSERT INTO spectateur_evenement (evenement_id, spectateur_id, prix) VALUES
(1, 1, 50.00),
(2, 2, 75.00),
(3, 3, 30.00);

-- Insérer intervenants
INSERT INTO intervenant (personne_id, role, salaire) VALUES
(1, 'Technicien Lumière', 500.00),
(2, 'Organisateur', 800.00),
(3, 'Sécurité', 300.00);

-- Associer intervenants aux événements
INSERT INTO intervenant_evenement (intervenant_id, evenement_id) VALUES
(1, 1),
(2, 2),
(3, 3);
