
@import ch.heigvd.dai.model.Group
@import java.util.List
@param List<Group> groups


<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groupes des Événements</title>
    @template.styles()
</head>
<body>
<header>
    <h1>Liste des Groupes des Événements</h1>
</header>
<main>
    <table>
        <thead>
        <tr>
            <th>ID de l'Événement</th>
            <th>Nom du Groupe</th>
            <th>Genre de Musique</th>
        </tr>
        </thead>
        <tbody>
        @for(Group group : groups)
            <tr>
                <td>${group.id()}</td>
                <td>${group.name()}</td>
                <td>${group.genre()}</td>
            </tr>
        @endfor
        </tbody>
    </table>
</main>
<footer>
    &copy; 2025 - Organisation des Événements by HEIG-VD
</footer>
</body>
</html>
