@import ch.heigvd.dai.model.*

@param Spectator spectator

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spectateur</title>
    @template.styles()
</head>
<body>
<header>
    <button class="back" onclick="window.history.back()">Back</button>
    <h1>${spectator.firstName()} ${spectator.lastName()}</h1>
</header>
<main>
    <table>
        <thead>
        <tr>
            <th>Adresse</th>
            <th>Téléphone</th>
            <th>Email</th>
            <th>Prix du billet</th>
            <th>Numéro de l'événement</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${spectator.address()}</td>
            <td>${spectator.phoneNumber()}</td>
            <td>${spectator.email()}</td>
            <td>${spectator.cost()}</td>
            <td><a href="/events/${spectator.eventId()}">${spectator.eventId()}</a></td>
        </tr>
        </tbody>
    </table>

</main>
<footer>
    &copy; 2025 - Organisation des Evenements by HEIG-VD
</footer>
</body>
</html>
