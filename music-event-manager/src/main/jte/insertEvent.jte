@import ch.heigvd.dai.model.Location
@import java.util.List

@param List<Location> locations

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Événement</title>
    @template.styles()
</head>
<body>
<header>
    <h1>Ajouter un Événement</h1>
</header>
<main>
    <form action="/events/insert" method="post">
        <label for="name">Nom de l'Événement :</label>
        <input type="text" id="name" name="name" placeholder="Nom de l'événement" required>

        <label for="description">Description :</label>
        <textarea id="description" name="description"></textarea>

        <label for="entryPrice">Prix d'Entrée (CHF) :</label>
        <input type="number" id="entryPrice" name="entryPrice" step="0.01" required>

        <label for="beginning">Date de Début :</label>
        <input type="date" id="beginning" name="beginning" required>

        <label for="end">Date de Fin :</label>
        <input type="date" id="end" name="end" required>

        <label for="locationId">Lieu :</label>
        <select id="locationId" name="locationId">
            @for(Location location : locations)
                <option value="${location.id()}">${location.toString()}</option>
            @endfor
        </select>
        <button type="submit">Créer</button>
    </form>
</main>
</body>
</html>
