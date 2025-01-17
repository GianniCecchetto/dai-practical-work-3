@import ch.heigvd.dai.model.Event
@import java.util.List
@param List<Event> events

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

        .actions {
            display: flex;
            justify-content: flex-end;
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

        button {
            padding: 10px 15px;
            background-color: #ff5900;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #ff4400;
            transform: translateY(-2px);
        }

        button:active {
            background-color: #e63900;
            transform: translateY(0);
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
    <h1>Liste des Événements</h1>
</header>
<main>
    <div class="actions">
        <button onclick="redirectToAddEvent()">➕ Ajouter un événement</button>
    </div>
    <table>
        <thead>
        <tr>
            <th>Nom de l'Événement</th>
            <th>Dates</th>
            <th>Détails</th>
        </tr>
        </thead>
        <tbody>
        @for(Event event : events)
            <tr>
                <td>${event.name()}</td>
                <td>${event.beginning().toString()} - ${event.end().toString()}</td>
                <td> <button onclick="redirectToDetails(${event.id()})">Détails</button></td>
            </tr>
        @endfor
        </tbody>
    </table>
</main>
<footer>
    &copy; 2025 - Organisation des Événements by HEIG-VD
</footer>

<script>
    function redirectToDetails(eventId) {
        const baseUrl = '/events/';
        window.location.href = baseUrl + eventId;
    }

    function redirectToAddEvent() {
        const addEventUrl = '/insertEvent';
        window.location.href = addEventUrl;
    }
</script>
</body>
</html>
