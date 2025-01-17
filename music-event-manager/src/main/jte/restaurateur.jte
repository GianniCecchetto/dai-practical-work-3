@import ch.heigvd.dai.model.*
@import ch.heigvd.dai.model.Plate
@import ch.heigvd.dai.model.Restaurant
@import ch.heigvd.dai.model.Menu
@import java.util.List

@param Restaurant restaurant
@param List<ch.heigvd.dai.model.Plate> plates
@param List<Soda> sodas
@param List<Menu> menus

<html>
<head>
    <title>Restaurateur</title>
</head>
<body>
<button onclick="window.history.back()">Back</button>
<h1>${restaurant.name()}</h1>
<h2>${restaurant.description()}</h2>
<h3>Plats</h3>
<table>
    <thead>
    <tr>
        <th>ID du plate</th>
        <th>Nom du plate</th>
        <th>Description du plate</th>
        <th>Cout du plate</th>
    </tr>
    </thead>
    <tbody>
    @for(Plate plate : plates)
        <tr>
            <td>${plate.id()}</td>
            <td>${plate.name()}</td>
            <td>${plate.description()}</td>
            <td>${plate.cout()}</td>
        </tr>
    @endfor
    </tbody>
</table>
<h3>Boissons</h3>
<table>
    <thead>
    <tr>
        <th>ID de la soda</th>
        <th>Nom de la soda</th>
        <th>Contenu de la soda</th>
        <th>Cout de la soda</th>
    </tr>
    </thead>
    <tbody>
    @for(ch.heigvd.dai.model.Soda soda : sodas)
        <tr>
            <td>${soda.id()}</td>
            <td>${soda.name()}</td>
            <td>${soda.content()}</td>
            <td>${soda.cout()}</td>
        </tr>
    @endfor
    </tbody>
</table>
<h3>Menus</h3>
<table>
    <thead>
    <tr>
        <th>Nom du plate</th>
        <th>Nom de la soda</th>
        <th>Cout du menu</th>
    </tr>
    </thead>
    <tbody>
    @for(Menu menu : menus)
        <tr>
            <td>${menu.plate().name()}</td>
            <td>${menu.soda().name()}</td>
            <td>${menu.cout()}</td>
        </tr>
    @endfor
    </tbody>
</table>
</body>
</html>
