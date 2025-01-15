<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
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
            position: relative;
        }

        main {
            padding: 20px;
        }

        h1 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin-bottom: 20px;
        }

        /* Menu Styling */
        .menu-container {
            position: absolute;
            top: 20px; /* Positionnement plus haut */
            left: 20px;
            z-index: 10;
        }

        .menu-button {
            background-color: white; /* Fond blanc pour ressortir */
            color: #ff5900; /* Texte orange pour correspondre au thème */
            padding: 10px 20px;
            border: 2px solid #ff5900; /* Bordure orange */
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .menu-button:hover {
            background-color: #ff5900; /* Fond orange au survol */
            color: white; /* Texte blanc */
            transform: translateY(-2px);
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            background-color: #ff5900;
            min-width: 200px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            animation: slideDown 0.6s ease; /* Animation plus lente */
        }

        .dropdown-menu a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .dropdown-menu a:hover {
            background-color: #ff4400;
        }

        /* Show menu on hover */
        .menu-container:hover .dropdown-menu {
            display: block;
        }

        /* Animation for dropdown */
        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        footer {
            text-align: center;
            margin-top: 20px;
            padding: 10px 0;
            background-color: #FF4400FF;
            color: white;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<header>
    <h1>Bienvenue sur l'Organisation des Événements</h1>
    <div class="menu-container">
        <button class="menu-button">Menu</button>
        <div class="dropdown-menu">
            <a href="/api/events">🎉 Voir les Événements</a>
            <a href="/api/users">👥 Gestion des Utilisateurs</a>
            <a href="/benefits">🎁 Voir les Avantages</a>
        </div>
    </div>
</header>

<main>
    <h1>Explorez nos fonctionnalités</h1>
    <p>Accédez aux différents modules et explorez les événements, les groupes et bien plus encore.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet justo eu ligula vulputate auctor non vel erat. Ut scelerisque libero nec justo volutpat, nec bibendum orci congue.</p>
</main>

<footer>
    &copy; 2025 - Organisation des Événements by HEIG-VD
</footer>
</body>
</html>
