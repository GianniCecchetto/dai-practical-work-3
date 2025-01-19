@import ch.heigvd.dai.model.Benefit
@import java.util.List
@param List<Benefit> benefits

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groupes des Événements</title>
    @template.styles()
</head>
<head>
    <title>Recettes des Evenements</title>
</head>
<body>
<button onclick="window.history.back()">Back</button>
<h1>Liste des Recettes des Evenements</h1>
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
            <a href="/benefits/${benefit.id()}">${benefit.id()}</a>
        </td>
        <td>${benefit.name()}</td>
        <td>${benefit.benefitStand()}</td>
        <td>${benefit.benefitsTickets()}</td>
    </tr>
    @endfor
    </tbody>
</table>
</body>
</html>
