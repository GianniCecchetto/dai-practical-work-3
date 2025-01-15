# Cahier des charges
### **Gestion d’événements musicaux**
## Introduction
Notre application permet aux organisateurs d’un événement musical de pouvoir créer, visualiser et modifier les différents concerts en mettant à disposition des filtres par scène, artiste, horaire, genre musical.  
Notre application permettra aux organisateurs de voir les dépenses ainsi que les gains des événements organisés. Ce qui les aidera à réaliser leur comptabilité.  

## Description
Un événement a un nom, une description, une date, un lieu et un prix d'entrée.  
Une scène se trouve sur un lieu, possède une capacité maximale, est en plein air ou non et un prix.  
Un concert associe une scène, un groupe et un horaire.  
Une personne possède un nom, un prénom, une adresse. Elle peut être un artiste, un spectateur, un intervenant.  
Un artiste a un coût.  
Un groupe a un nom, un genre musical et rassemble un ou plusieurs artistes.  
Un intervenant a un rôle, un numéro de téléphone et travaille pour des concerts. Il peut travailler sur un seul concert à une date donnée.  
Un spectateur a une adresse email, un siège.  
Le matériel a un nom et un prix.  

## Fonctionnalités
Notre application est découpée en une partie administrative et une client.  
Les clients peuvent acheter des billets pour un événement.  
Les organisateurs pourront connaître le coût de l’événement (matériel utilisé, scènes,  artistes).  
Les organisateurs pourront aussi voir les revenu de l’événement (coût * nombre entré).  
