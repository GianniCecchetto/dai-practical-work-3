<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
    <style>
        /* Styles généraux */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #ff5900;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            margin: 0;
            font-size: 24px;
        }

        /* Menu déroulant */
        .menu-container {
            position: relative;
        }

        .menu-button {
            background-color: white;
            color: #ff5900;
            padding: 10px 40px;
            border: 2px solid #ff5900;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 200px; /* Largeur ajustée pour l'icône */
            height: 40px; /* Hauteur ajustée */
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .menu-button:hover {
            background-color: #ff5900;
            color: white;
        }

        .menu-button::before {
            content: "☰"; /* Icône menu (trois barres) */
            font-size: 24px;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            left: 0;
            top: 100%;
            background-color: #cc4800; /* Fond plus foncé */
            width: 100%; /* Même largeur que le bouton */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Ombre renforcée */
            z-index: 100;
        }

        .menu-container:hover .dropdown-menu {
            display: block;
        }

        .dropdown-menu a {
            color: white;
            text-decoration: none;
            padding: 8px 10px;
            display: block;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .dropdown-menu a:hover {
            background-color: #ff4400;
        }

        /* Contenu principal */
        main {
            flex: 1;
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            background: white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        main h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #ff5900;
        }

        main p {
            font-size: 18px;
            margin-bottom: 20px;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 10px 0;
            background-color: #FF4400FF;
            color: white;
        }
    </style>
</head>
<body>
<header>
    <h1>Organisation des Événements</h1>
    <div class="menu-container">
        <button class="menu-button"></button>
        <div class="dropdown-menu">
            <a href="/events">🎉 Voir les Événements</a>
            <a href="/users">👥 Gestion des Utilisateurs</a>
            <a href="/benefits">🎁 Voir les Avantages</a>
        </div>
    </div>
</header>

<main>
    <h1>Explorez nos fonctionnalités</h1>
    <p>
        Bienvenue sur notre plateforme ! Découvrez des événements passionnants, gérez vos utilisateurs, et accédez à
        des avantages exclusifs. Naviguez à travers nos différentes sections pour en savoir plus.
    </p>
    <p>
        Nous proposons une interface intuitive et des fonctionnalités enrichies pour faciliter votre gestion des
        événements. Profitez dès maintenant de notre expérience unique !
    </p>
</main>

<footer>
    &copy; 2025 - Organisation des Événements by HEIG-VD
</footer>
</body>
</html>
