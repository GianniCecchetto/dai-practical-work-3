@import ch.heigvd.dai.model.Benefit
@import ch.heigvd.dai.model.Group
@import java.util.List
@param List<Group> groups


<html>
<head>
    <title>Groupes des Evenements</title>
</head>
<body>
    <h1>Liste des groupes des Evenements</h1>
    <table>
        <thead>
            <tr>
                <th>ID de l'evenement</th>
                <th>Nom du groupe</th>
                <th>Genre de musique</th>
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
</body>
</html>
