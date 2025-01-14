@import ch.heigvd.dai.model.Benefit
@param Benefit recette


<html>
<head>
    <title>Recettes des Evenements</title>
</head>
<body>
    <h1>Liste des Recettes des Evenements</h1>
    <table border="1">
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
                <td>recette.id</td>
                <td>recette.name</td>
                <td>recette.benefitStand</td>
                <td>recette.benefitsTickets</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
