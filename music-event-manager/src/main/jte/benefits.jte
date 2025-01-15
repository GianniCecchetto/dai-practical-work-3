@import ch.heigvd.dai.model.Benefit
@import java.util.List
@param List<Benefit> benefits

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groupes des Événements</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        header {
            background-color: #ea710c;
            color: white;
            padding: 20px;
            text-align: center;
        }

        main {
            padding: 20px;
            max-width: 900px;
            margin: auto;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #ea710c;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        footer {
            text-align: center;
            margin-top: 20px;
            padding: 10px 0;
            background-color: #ea710c;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
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
