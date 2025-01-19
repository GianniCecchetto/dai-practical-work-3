@import ch.heigvd.dai.model.Event
@import java.util.List
@param List<Event> events

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groupes des Événements</title>
    @template.styles()
</head>
<body>
<header>
    <h1>Liste des Événements</h1>
</header>
<main>
    <div class="actions">
        <button onclick="redirectToAddEvent()">➕ Ajouter un événement</button>
    </div>
    <table>
        <thead>
        <tr>
            <th>Nom de l'Événement</th>
            <th>Dates</th>
            <th>Détails</th>
        </tr>
        </thead>
        <tbody>
        @for(Event event : events)
            <tr>
                <td>${event.name()}</td>
                <td>${event.beginning().toString()} - ${event.end().toString()}</td>
                <td> <button onclick="redirectToDetails(${event.id()})">Détails</button></td>
            </tr>
        @endfor
        </tbody>
    </table>
</main>
<footer>
    &copy; 2025 - Organisation des Événements by HEIG-VD
</footer>

<script>
    function redirectToDetails(eventId) {
        const baseUrl = '/events/';
        window.location.href = baseUrl + eventId;
    }

    function redirectToAddEvent() {
        const addEventUrl = '/events/insert';
        window.location.href = addEventUrl;
    }
</script>
</body>
</html>
