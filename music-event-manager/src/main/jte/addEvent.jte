<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Événement</title>
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

        input, textarea {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        textarea {
            resize: vertical;
            min-height: 80px;
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
    </style>
</head>
<body>
<header>
    <h1>Ajouter un Événement</h1>
</header>
<main>
    <h1>Formulaire d'Ajout</h1>
    <form action="/api/asdasd" method="POST">
        <label for="name">Nom de l'Événement :</label>
        <input type="text" id="name" name="name" placeholder="Nom de l'événement" required>

        <label for="beginning">Date de Début :</label>
        <input type="datetime-local" id="beginning" name="beginning" required>

        <label for="end">Date de Fin :</label>
        <input type="datetime-local" id="end" name="end" required>

        <label for="entryPrice">Prix d'Entrée (CHF) :</label>
        <input type="number" id="entryPrice" name="entryPrice" step="0.01" required>

        <label for="placeName">Lieu :</label>
        <input type="text" id="placeName" name="placeName" placeholder="Nom du lieu" required>

        <label for="adresse">Adresse :</label>
        <textarea id="adresse" name="adresse" placeholder="Adresse complète" required></textarea>

        <label for="NPA">NPA :</label>
        <input type="text" id="NPA" name="NPA" placeholder="Code postal" required>

        <button type="submit">Ajouter l'Événement</button>
    </form>
</main>
</body>
<script>

</script>
</html>
