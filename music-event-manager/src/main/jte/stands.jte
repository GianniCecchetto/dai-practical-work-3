@import ch.heigvd.dai.model.Stand
@import java.util.List
@param List<Stand> stands

<html>
<head>
    <title>Stands</title>
</head>
<body>
<button onclick="window.history.back()">Back</button>
<h1>Liste des Stands de l'evenement</h1>
<table>
    <thead>
    <tr>
        <th>ID du stand</th>
        <th>Taille du stand</th>
        <th>Cout du stand</th>
        <th>ID du restaurateur</th>
    </tr>
    </thead>
    <tbody>
    @for(Stand stand : stands)
        <tr>
            <td>${stand.id()}</td>
            <td>${stand.size()}</td>
            <td>${stand.cout()}</td>
            <td>
                <a href="/restaurateurs/${stand.restaurateurId()}">${stand.restaurateurId()}</a>
            </td>
        </tr>
    @endfor
    </tbody>
</table>
</body>
</html>
