<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Événement</title>
    @template.styles()
</head>
<body>
<header>
    <h1>Ajouter un Événement</h1>
</header>
<main>
    <h1>Formulaire d'Ajout</h1>
    <form action="/api/event" method="POST">
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
