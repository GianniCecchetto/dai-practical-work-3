@import ch.heigvd.dai.model.Benefit
@param Benefit benefit

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recette</title>
    @template.styles()
</head>
<header>
    <h1>Recette</h1>
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
        <tr>
            <td>${benefit.id()}</td>
            <td>${benefit.name()}</td>
            <td>${benefit.benefitStand()}</td>
            <td>${benefit.benefitsTickets()}</td>
        </tr>
    </tbody>
</table>
</main>
</body>
</html>
