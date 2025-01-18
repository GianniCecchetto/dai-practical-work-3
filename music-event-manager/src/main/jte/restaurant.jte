@import ch.heigvd.dai.model.*
@import java.util.List

@param Restaurant restaurant
@param List<Plate> plates
@param List<Soda> sodas
@param List<Menu> menus

<html>
<head>
    <title>Restaurant</title>
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

        .back {
            position: absolute;
            left: 10px;
            top: 10px;
        }

        button {
            padding: 10px 15px;
            background-color: #ea710c;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
<header>
    <button class="back" onclick="window.history.back()">Back</button>
    <h1>${restaurant.name()}</h1>
    <h2>${restaurant.description()}</h2>
</header>
<main>
<h3>Plats</h3>
<table>
    <thead>
    <tr>
        <th>Nom</th>
        <th>Description</th>
        <th>Cout</th>
    </tr>
    </thead>
    <tbody>
    @for(Plate plate : plates)
        <tr>
            <td>${plate.name()}</td>
            <td>${plate.description()}</td>
            <td>${plate.cost()}</td>
        </tr>
    @endfor
    </tbody>
</table>
<h3>Boissons</h3>
<table>
    <thead>
    <tr>
        <th>Nom</th>
        <th>Taille (ml)</th>
        <th>Cout</th>
    </tr>
    </thead>
    <tbody>
    @for(Soda soda : sodas)
        <tr>
            <td>${soda.name()}</td>
            <td>${soda.content()}</td>
            <td>${soda.cost()}</td>
        </tr>
    @endfor
    </tbody>
</table>
<h3>Menus</h3>
<table>
    <thead>
    <tr>
        <th>Plat</th>
        <th>Boisson</th>
        <th>Cout</th>
    </tr>
    </thead>
    <tbody>
    @for(Menu menu : menus)
        <tr>
            <td>${menu.plate().name()}</td>
            <td>${menu.soda().name()}</td>
            <td>${menu.cost()}</td>
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
