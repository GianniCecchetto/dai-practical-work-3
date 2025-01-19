@import ch.heigvd.dai.model.Event
@import java.util.List
@param List<Event> events

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Créer une nouvelle scène</title>
    @template.styles()
</head>
<body>
<header>
    <h1>Créer une nouvelle scène</h1>
</header>

<main>
    <form action="/scenes/insert" method="post">
        <label for="maxCapacity">Capacité maximale :</label>
        <input type="number" id="maxCapacity" name="maxCapacity" required>

        <label for="openAir">Plein air :</label>
        <input type="checkbox" id="openAir" name="openAir">

        <label for="cost">Coût :</label>
        <input type="number" step="0.01" id="cost" name="cost" required>

        <label for="eventId">Événement :</label>
        <select id="eventId" name="eventId" required>
            <option value="">-- Sélectionnez un événement --</option>
            @for(Event event : events)
                <option value="${event.id()}">${event.name()}</option>
            @endfor
        </select>
        <button type="submit">Créer</button>
    </form>
</main>

</body>
</html>
