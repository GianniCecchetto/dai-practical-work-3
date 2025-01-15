@import ch.heigvd.dai.model.Benefits
@import java.util.List
@param List<Benefits> benefits


<html>
<head>
    <title>Recettes des Evenements</title>
</head>
<body>
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
    @for(Benefits benefit : benefits)
    <tr>
        <td>${benefit.id()}</td>
        <td>${benefit.name()}</td>
        <td>${benefit.benefitStand()}</td>
        <td>${benefit.benefitsTickets()}</td>
    </tr>
    @endfor
    </tbody>
</table>
</body>
</html>
