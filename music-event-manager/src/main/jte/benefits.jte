@import ch.heigvd.dai.model.Benefit
@import java.util.List
@param List<Benefit> benefits

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recettes des Evenements</title>
    @template.styles()
</head>
<header>
    <button class="back" onclick="window.history.back()">Back</button>
    <h1>Recettes des Evenements</h1>
</header>
<body>
<main>
<table>
    <thead>
    <tr>
        <th>ID de l'evenement</th>
        <th>Nom de l'evenement</th>
        <th>Recettes des stands</th>
        <th>Recettes des billets</th>
    </tr>
    </thead>
    <tbody>
    @for(Benefit benefit : benefits)
    <tr>
        <td>
            <a href="/events/${benefit.id()}/benefits">${benefit.id()}</a>
        </td>
        <td>${benefit.name()}</td>
        <td>${benefit.benefitStand()}</td>
        <td>${benefit.benefitsTickets()}</td>
    </tr>
    @endfor
    </tbody>
</table>
</main>
</body>
</html>
