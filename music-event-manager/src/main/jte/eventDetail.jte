@import ch.heigvd.dai.model.Event
@import ch.heigvd.dai.model.Location
@param Event event
@param Location location

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails de l'Événement</title>
    @template.styles()
</head>
<body>
<header>
    <h1>Détails de l'Événement</h1>
</header>
<main>
    <h2>${event.name()}</h2>
    <table>
        <tr>
            <th>Date de Début</th>
            <td>${event.beginning().toString()}</td>
        </tr>
        <tr>
            <th>Date de Fin</th>
            <td>${event.end().toString()}</td>
        </tr>
        <tr>
            <th>Prix d'Entrée</th>
            <td>${event.entryPrice()} CHF</td>
        </tr>
        <tr>
            <th>Lieu</th>
            <td>${location.name()}</td>
        </tr>
        <tr>
            <th>Adresse</th>
            <td>${location.address()}</td>
        </tr>
        <tr>
            <th>NPA</th>
            <td>${location.npa()}</td>
        </tr>
    </table>
    <table>
        <tr>
            <td><a href="/events/${event.id()}/scenes" class="button">Scenes</a></td>
            <td><a href="/events/${event.id()}/benefits" class="button">Benefits</a></td>
            <td><a href="/events/${event.id()}/spectators" class="button">Spectators</a></td>
            <td><a href="/events/${event.id()}/helpers" class="button">Helpers</a></td>
            <td><a href="/events/${event.id()}/stands" class="button">Stands</a></td>
        </tr>
    </table>
</main>
<footer>
    &copy; 2025 - Organisation des Événements by HEIG-VD
</footer>
</body>
</html>
