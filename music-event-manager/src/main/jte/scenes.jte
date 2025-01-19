@import ch.heigvd.dai.model.Scene
@import ch.heigvd.dai.model.Event
@import java.util.List
@param List<Scene> scenes
@param Event event

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Scènes</title>
    @template.styles()
</head>
<body>
<header>
    <h1>Liste des Scènes de l'événement ${event.name()}</h1>
</header>
<main>
    <div class="actions">
        <button onclick="redirectToAddScene()">➕ Ajouter une scène</button>
    </div>
    <table>
        <thead>
        <tr>
            <th>Nom de l'Événement</th>
            <th>Capacité Maximale</th>
            <th>En Plein Air</th>
            <th>Détails</th>
        </tr>
        </thead>
        <tbody>
        @for(Scene scene : scenes)
            <tr>
                <td>${event.name()}</td>
                <td>${scene.maxCapacity()}</td>
                <td>${scene.openAir() ? "Oui" : "Non"}</td>
                <td><button onclick="redirectToDetails(${scene.id()})">Détails</button></td>
            </tr>
        @endfor
        </tbody>
    </table>
</main>
<footer>
    &copy; 2025 - Organisation des Scènes by HEIG-VD
</footer>

<script>
    function redirectToDetails(sceneId) {
        const baseUrl = '/events/${event.id()}/scenes/';
        window.location.href = baseUrl + sceneId;
    }

    function redirectToAddScene() {
        const addSceneUrl = '/events/${event.id()}/scenes/insert';
        window.location.href = addSceneUrl;
    }
</script>
</body>
</html>
