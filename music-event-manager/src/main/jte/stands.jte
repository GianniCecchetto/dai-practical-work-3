@import ch.heigvd.dai.model.Stand
@import java.util.List
@param List<Stand> stands

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stands</title>
    @template.styles()
</head>
<body>
<header>
    <h1>Liste des stands de l'evenement</h1>
</header>
<main>
<table>
    <thead>
    <tr>
        <th>Numero du stand</th>
        <th>Taille du stand (m2)</th>
        <th>Nom du restaurant</th>
    </tr>
    </thead>
    <tbody>
    @for(Stand stand : stands)
        <tr>
            <td>${stand.id()}</td>
            <td>${stand.size()}</td>
            <td><button><a href="/restaurants/${stand.restaurant().id()}">${stand.restaurant().name()}</a></button></td>
        </tr>
    @endfor
    </tbody>
</table>
</main>
<footer>
    &copy; 2025 - Organisation des Evenements by HEIG-VD
</footer>
</body>
</html>
