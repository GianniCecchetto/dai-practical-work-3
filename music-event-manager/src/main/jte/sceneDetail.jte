@import ch.heigvd.dai.model.Scene
@param Scene scene


<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails de la Scène</title>
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

        a.button {
            padding: 1px 6px;
            border: 1px outset buttonborder;
            color: buttontext;
            background-color: #FF4400FF;
            text-decoration: none;
        }
    </style>
</head>
<body>
<header>
    <h1>Détails de la Scène</h1>
</header>
<main>
    <h2>${scene.id()}</h2>
    <table>
        <tr>
            <th>Capacité Maximale</th>
            <td>${scene.maxCapacity()}</td>
        </tr>
        <tr>
            <th>Plein Air</th>
            <td>${scene.openAir() ? "Oui" : "Non"}</td>
        </tr>
        <tr>
            <th>Événement Associé</th>
            <td>${scene.eventId()}</td>
        </tr>
        <tr>
            <th>coût</th>
            <td>${scene.cost()}</td>
        </tr>
    </table>
    <table>
        <tr>
            <td><a href="/events" class="button">Retour aux Événements</a></td>
            <td><a href="/scenes/${scene.id()}/modify" class="button">Modifier la Scène</a></td>
            <td><a href="/scenes/${scene.id()}/delete" class="button">Supprimer la Scène</a></td>
            <td><a href="/events/${scene.eventId()}/scenes/${scene.id()}/equipement" class="button">Equipement</a></td>
        </tr>
    </table>
</main>
<footer>
    &copy; 2025 - Organisation des Événements by HEIG-VD
</footer>
</body>
</html>
