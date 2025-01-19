@import ch.heigvd.dai.model.Scene
@param Scene scene


<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails de la Scène</title>
    @template.styles()
</head>
<body>
<header>
    <h1>Détails de la Scène</h1>
</header>
<main>
    <h2>${scene.id()}</h2>
    <table>
        <tr>
            <th>Capacité Maximale</th>
            <td>${scene.maxCapacity()}</td>
        </tr>
        <tr>
            <th>Plein Air</th>
            <td>${scene.openAir() ? "Oui" : "Non"}</td>
        </tr>
        <tr>
            <th>Événement Associé</th>
            <td>${scene.eventId()}</td>
        </tr>
        <tr>
            <th>coût</th>
            <td>${scene.cost()}</td>
        </tr>
    </table>
    <table>
        <tr>
            <td><a href="/events" class="button">Retour aux Événements</a></td>
            <td><a href="/scenes/${scene.id()}/modify" class="button">Modifier la Scène</a></td>
            <td><a href="/scenes/${scene.id()}/delete" class="button">Supprimer la Scène</a></td>
            <td><a href="/events/${scene.eventId()}/scenes/${scene.id()}/equipement" class="button">Equipement</a></td>
        </tr>
    </table>
</main>
<footer>
    &copy; 2025 - Organisation des Événements by HEIG-VD
</footer>
</body>
</html>
