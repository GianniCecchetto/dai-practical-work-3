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

        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            margin: auto;
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input[type="number"],
        select,
        input[type="checkbox"] {
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="checkbox"] {
            width: auto;
            margin-top: 0;
        }

        button {
            padding: 10px 15px;
            background-color: #ff5900;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
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

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .form-group.checkbox {
            flex-direction: row;
            align-items: center;
        }

        .form-group.checkbox label {
            margin-right: 10px;
        }

        .form-group select {
            width: 100%;
        }
    </style>
</head>
<body>

<header>
    <h1>Créer une nouvelle scène</h1>
</header>

<div class="container">
    <form action="/scenes/insert" method="post">
        <div class="form-group">
            <label for="maxCapacity">Capacité maximale :</label>
            <input type="number" id="maxCapacity" name="maxCapacity" required>
        </div>

        <div class="form-group checkbox">
            <label for="openAir">Plein air :</label>
            <input type="checkbox" id="openAir" name="openAir">
        </div>

        <div class="form-group">
            <label for="cost">Coût :</label>
            <input type="number" step="0.01" id="cost" name="cost" required>
        </div>

        <div class="form-group">
            <label for="eventId">Événement :</label>
            <select id="eventId" name="eventId" required>
                <option value="">-- Sélectionnez un événement --</option>
                @for(Event event : events)
                    <option value="${event.id()}">${event.name()}</option>
                @endfor
            </select>
        </div>

        <button type="submit">Créer</button>
    </form>
</div>

</body>
</html>
