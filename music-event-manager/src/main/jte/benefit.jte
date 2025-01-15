@import ch.heigvd.dai.model.Benefits
@param ch.heigvd.dai.model.Benefits benefit


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
            <tr>
                <td>${benefit.id()}</td>
                <td>${benefit.name()}</td>
                <td>${benefit.benefitStand()}</td>
                <td>${benefit.benefitsTickets()}</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
