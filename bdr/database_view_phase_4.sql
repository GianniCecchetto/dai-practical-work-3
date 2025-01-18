SET search_path = embedded;

-- Vue pour obtenir les événements avec leurs lieux
CREATE OR REPLACE VIEW vue_evenement_lieu AS
SELECT
    e.id AS evenement_id,
    e.description,
    e.nom AS evenement_nom,
    e.date_debut,
    e.date_fin,
    e.prix_entree,
    l.id AS lieu_id,
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
    e.nom AS evenement_nom,
    e.id AS evenement_id,
    g.genre AS groupe_genre
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

-- Requête pour obtenir les événements par lieu
--SELECT * FROM vue_evenement_lieu WHERE lieu_nom = 'Palais des Congrès';

-- Requête pour les recettes totales d'un événement
--SELECT * FROM vue_recettes_evenement WHERE evenement_nom = 'Festival de Musique';

-- Requête pour obtenir les concerts d'un groupe spécifique
--SELECT * FROM vue_concert_details WHERE groupe_nom = 'The Rockers';

-- Requête pour les concerts nécessitant des sièges
--SELECT * FROM vue_concert_details WHERE necessite_siege = TRUE;

-- Requête pour les spectateurs inscrits à un événement donné
--SELECT sp.nom, sp.prenom, sp.email
--FROM spectateur_evenement se
--JOIN spectateur s ON se.spectateur_id = s.personne_id
--JOIN personne sp ON s.personne_id = sp.id
--WHERE se.evenement_id = (SELECT id FROM evenement WHERE nom = 'Festival de Musique');
