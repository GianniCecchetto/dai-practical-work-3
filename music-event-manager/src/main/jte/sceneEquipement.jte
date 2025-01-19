@import ch.heigvd.dai.model.Scene
@import ch.heigvd.dai.model.Equipement
@import java.util.List
@param List<Equipement> equipements
@param Scene scene

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste de l'équipement</title>
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

        h2 {
            font-size: 20px;
            margin-top: 20px;
            color: #ff5900;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            background-color: white;
            border: 1px solid #ff5900;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        ul li strong {
            color: #ff5900;
        }

        footer {
            text-align: center;
            margin-top: 20px;
            padding: 10px 0;
            background-color: #ff5900;
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

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
<header>
    <h1>Détails de la Scène : ${scene.id()}</h1>
</header>
<main>
    <h2>Équipements associés à la scène</h2>
    <ul>
        @for (Equipement equipement : equipements)
            <li>
                <strong>${equipement.name()}</strong> : ${equipement.description()} - Coût : ${equipement.cost()}
            </li>
        @endfor
    </ul>
</main>
<footer>
    &copy; 2025 - Organisation des Événements by HEIG-VD
</footer>
</body>
</html>
