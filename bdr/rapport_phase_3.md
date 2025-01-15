# Diagramme relationnel
`lieu(U_ID, nom, adresse, NPA)` \
U_ID est une clé primaire

`evenement(U_ID, nom, description, date, prix_entree, date_debut, date_fin, lieu_ID)` \
U_ID est une clé primaire \
lieu_ID référence lieu.U_ID

`restaurateur(U_ID, nom, description)` \
U_ID est une clé primaire

`stand(U_ID, taille, cout, restaurant_ID, evenement_ID)` \
U_ID est une clé primaire \
restaurateur_ID référence restaurateur.U_ID \
restaurateur_ID peut etre NULL \
evenement_ID référence evenement.U_ID 

`plat(U_ID, nom, description, cout, restaurateur_ID)` \
U_ID est une clé primaire \
restaurateur_ID référence restaurateur.U_ID

`boisson(U_ID, nom, cout, contenance, restaurateur_ID)` \
U_ID est une clé primaire \
restaurateur_ID référence restaurateur.U_ID

`menu(cout, restaurateur_ID, plat_ID, boisson_ID)` \
(restaurateur_ID, plat_ID, boisson_ID) forment la clé primaire \
restaurateur_ID référence restaurateur.U_ID \
plat_ID référence plat.U_ID \
boisson_ID référence boisson.U_ID

`scene(U_ID, capacite_max, plein_air, cout, evenement_ID)` \
U_ID est une clé primaire \
evenement_ID référence evenement.U_ID

`concert(U_ID, heure_debut, heure_fin, scene_ID, groupe_ID)` \
U_ID est une clé primaire \
scene_ID référence scene.U_ID \
groupe_ID référence groupe.U_ID

`materiel(U_ID, nom, description, cout)` \
U_ID est une clé primaire

`materiel_concert(materiel_ID, concert_ID, nombre)` \
(materiel_ID, concert_ID) forment la clé primaire \
materiel_ID référence materiel.U_ID \
concert_ID référence concert.U_ID

`groupe(U_ID, nom, genre)` \
U_ID est une clé primaire

`personne(U_ID, nom, prenom, adresse)` \
U_ID est une clé primaire

`artiste(personne_ID, cout, score_popularite, groupe_ID)` \
personne_ID est une clé primaire \
personne_ID référence personne.U_ID \
groupe_ID référence groupe.U_ID \
groupe_ID peut être NULL

`spectateur(personne_ID, email, siege)` \
personne_ID est une clé primaire \
personne_ID référence personne.U_ID

`intervenant(personne_ID, role, num_tel, cout)` \
personne_ID est une clé primaire \
personne_ID référence personne.U_ID

`siege(concert_ID, place, categorie, prix)` \
(concert_ID, place) forment la clé primaire \
concert_ID référence concert.U_ID

`billet(evenement_ID, prix, concert_ID, place, spectateur_ID)` \
(concert_ID, place, spectateur_ID) forment la clé primaire \
evenement_ID référence evenement.U_ID \
concert_ID référence siege.concert_ID \
place référence siege.place \
spectateur_ID référence specateur.U_ID