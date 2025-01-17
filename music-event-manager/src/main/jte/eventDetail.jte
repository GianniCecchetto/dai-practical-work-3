@import ch.heigvd.dai.model.Event
@param Event event


<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails de l'Événement</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        header {
            background-color: #ff5900;
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
            background-color: #FF4400FF;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        footer {
            text-align: center;
            margin-top: 20px;
            padding: 10px 0;
            background-color: #FF4400FF;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<header>
    <h1>Détails de l'Événement</h1>
</header>
<main>
    <h2>${eventDetail.name()}</h2>
    <table>
        <tr>
            <th>Date de Début</th>
            <td>${eventDetail.beginning().toString()}</td>
        </tr>
        <tr>
            <th>Date de Fin</th>
            <td>${eventDetail.end().toString()}</td>
        </tr>
        <tr>
            <th>Prix d'Entrée</th>
            <td>${eventDetail.entryPrice()} CHF</td>
        </tr>
        <tr>
            <th>Lieu</th>
            <td>${eventDetail.placeName()}</td>
        </tr>
        <tr>
            <th>Adresse</th>
            <td>${eventDetail.adresse()}</td>
        </tr>
        <tr>
            <th>NPA</th>
            <td>${eventDetail.NPA()}</td>
        </tr>
    </table>
</main>
<footer>
    &copy; 2025 - Organisation des Événements by HEIG-VD
</footer>
</body>
</html>
