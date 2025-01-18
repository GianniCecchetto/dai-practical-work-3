@import ch.heigvd.dai.model.*
@import java.util.List

@param List<Spectator> spectators

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spectateurs</title>
    @template.styles()
</head>
<body>
<header>
    <button class="back" onclick="window.history.back()">Back</button>
    <h1>Spectateurs</h1>
</header>
<main>
    <table>
        <thead>
        <tr>
            <th>Prénom</th>
            <th>Nom</th>
            <th>Détails</th>
        </tr>
        </thead>
        <tbody>
        @for(Spectator spectator : spectators)
            <tr>
                <td>${spectator.firstName()}</td>
                <td>${spectator.lastName()}</td>
                <td><button><a href="/spectators/${spectator.eventId()}/${spectator.id()}">Details</a></button></td>
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
