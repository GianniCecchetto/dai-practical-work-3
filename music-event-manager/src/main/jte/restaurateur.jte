@import ch.heigvd.dai.model.*
@import ch.heigvd.dai.model.Plat
@import ch.heigvd.dai.model.Restaurant
@import ch.heigvd.dai.model.Menu
@import java.util.List

@param Restaurant restaurant
@param List<Plat> plats
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
        <th>ID du plat</th>
        <th>Nom du plat</th>
        <th>Description du plat</th>
        <th>Cout du plat</th>
    </tr>
    </thead>
    <tbody>
    @for(Plat plat : plats)
        <tr>
            <td>${plat.id()}</td>
            <td>${plat.name()}</td>
            <td>${plat.description()}</td>
            <td>${plat.cout()}</td>
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
        <th>Nom du plat</th>
        <th>Nom de la soda</th>
        <th>Cout du menu</th>
    </tr>
    </thead>
    <tbody>
    @for(Menu menu : menus)
        <tr>
            <td>${menu.plat().name()}</td>
            <td>${menu.soda().name()}</td>
            <td>${menu.cout()}</td>
        </tr>
    @endfor
    </tbody>
</table>
</body>
</html>
