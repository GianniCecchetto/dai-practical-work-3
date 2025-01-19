@import ch.heigvd.dai.model.Scene
@import ch.heigvd.dai.model.Equipement
@import java.util.List
@param List<Equipement> equipements
@param Scene scene

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste de l'équipement</title>
    @template.styles()
</head>
<body>
<header>
    <h1>Détails de la Scène : ${scene.id()}</h1>
</header>
<main>
    <h2>Équipements associés à la scène</h2>
    <ul>
        @for (Equipement equipement : equipements)
            <li>
                <strong>${equipement.name()}</strong> : ${equipement.description()} - Coût : ${equipement.cost()}
            </li>
        @endfor
    </ul>
</main>
<footer>
    &copy; 2025 - Organisation des Événements by HEIG-VD
</footer>
</body>
</html>
