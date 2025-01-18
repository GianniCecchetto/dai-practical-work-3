@import ch.heigvd.dai.model.*
@import java.util.List

@param Restaurant restaurant
@param List<Plate> plates
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
            <td>${plate.cout()}</td>
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
            <td>${soda.cout()}</td>
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
            <td>${menu.cout()}</td>
        </tr>
    @endfor
    </tbody>
</table>
</body>
</html>
