@import ch.heigvd.dai.model.Stand
@import java.util.List
@param List<Stand> stands

<html>
<head>
    <title>Stands</title>
</head>
<body>
<button onclick="window.history.back()">Back</button>
<h1>Liste des stands de l'évenement</h1>
<table>
    <thead>
    <tr>
        <th>Numéro du stand</th>
        <th>Taille du stand</th>
        <th>Nom du restaurant</th>
    </tr>
    </thead>
    <tbody>
    @for(Stand stand : stands)
        <tr>
            <td>${stand.id()}</td>
            <td>${stand.size()}</td>
            <td><a href="/restaurants/${stand.restaurant().id()}">${stand.restaurant().name()}</a></td>
        </tr>
    @endfor
    </tbody>
</table>
</body>
</html>
