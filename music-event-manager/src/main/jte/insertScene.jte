@import ch.heigvd.dai.model.Event
@import java.util.List
@param List<Event> events

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Créer une nouvelle scène</title>
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
            max-width: 600px;
            margin: auto;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            font-weight: bold;
        }

        input, select, button {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        select {
            width: 100%;
        }

        input[type="checkbox"] {
            width: auto;
        }

        button {
            background-color: #ff5900;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #ff4400;
        }

        button:active {
            background-color: #e63900;
        }
    </style>
</head>
<body>
<header>
    <h1>Créer une nouvelle scène</h1>
</header>

<main>
    <form action="/scenes/insert" method="post">
        <label for="maxCapacity">Capacité maximale :</label>
        <input type="number" id="maxCapacity" name="maxCapacity" required>

        <label for="openAir">Plein air :</label>
        <input type="checkbox" id="openAir" name="openAir">

        <label for="cost">Coût :</label>
        <input type="number" step="0.01" id="cost" name="cost" required>

        <label for="eventId">Événement :</label>
        <select id="eventId" name="eventId" required>
            <option value="">-- Sélectionnez un événement --</option>
            @for(Event event : events)
                <option value="${event.id()}">${event.name()}</option>
            @endfor
        </select>
        <button type="submit">Créer</button>
    </form>
</main>

</body>
</html>
