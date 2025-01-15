@import ch.heigvd.dai.model.*
@import ch.heigvd.dai.model.Plat
@import ch.heigvd.dai.model.Restaurateur
@import ch.heigvd.dai.model.Menu
@import java.util.List

@param Restaurateur restaurateur
@param List<Plat> plats
@param List<Boisson> boissons
@param List<Menu> menus

<html>
<head>
    <title>Restaurateur</title>
</head>
<body>
<button onclick="window.history.back()">Back</button>
<h1>${restaurateur.name()}</h1>
<h2>${restaurateur.description()}</h2>
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
        <th>ID de la boisson</th>
        <th>Nom de la boisson</th>
        <th>Contenu de la boisson</th>
        <th>Cout de la boisson</th>
    </tr>
    </thead>
    <tbody>
    @for(Boisson boisson : boissons)
        <tr>
            <td>${boisson.id()}</td>
            <td>${boisson.name()}</td>
            <td>${boisson.content()}</td>
            <td>${boisson.cout()}</td>
        </tr>
    @endfor
    </tbody>
</table>
<h3>Menus</h3>
<table>
    <thead>
    <tr>
        <th>Nom du plat</th>
        <th>Nom de la boisson</th>
        <th>Cout du menu</th>
    </tr>
    </thead>
    <tbody>
    @for(Menu menu : menus)
        <tr>
            <td>${menu.plat().name()}</td>
            <td>${menu.boisson().name()}</td>
            <td>${menu.cout()}</td>
        </tr>
    @endfor
    </tbody>
</table>
</body>
</html>
