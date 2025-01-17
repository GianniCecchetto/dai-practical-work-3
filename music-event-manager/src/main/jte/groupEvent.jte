
@import ch.heigvd.dai.model.Group
@import java.util.List
@param List<Group> groups


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
<body>
<header>
    <h1>Liste des Groupes des Événements</h1>
</header>
<main>
    <table>
        <thead>
        <tr>
            <th>ID de l'Événement</th>
            <th>Nom du Groupe</th>
            <th>Genre de Musique</th>
        </tr>
        </thead>
        <tbody>
        @for(Group group : groups)
            <tr>
                <td>${group.id()}</td>
                <td>${group.name()}</td>
                <td>${group.genre()}</td>
            </tr>
        @endfor
        </tbody>
    </table>
</main>
<footer>
    &copy; 2025 - Organisation des Événements by HEIG-VD
</footer>
</body>
</html>
