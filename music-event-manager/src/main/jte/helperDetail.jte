@import ch.heigvd.dai.model.*

@param Helper helper

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Intervenant</title>
    @template.styles()
</head>
<body>
<header>
    <h1>${helper.firstName()} ${helper.lastName()}</h1>
</header>
<main>
    <table>
        <thead>
        <tr>
            <th>Adresse</th>
            <th>Téléphone</th>
            <th>Email</th>
            <th>Role</th>
            <th>Salaire</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${helper.address()}</td>
            <td>${helper.phoneNumber()}</td>
            <td>${helper.email()}</td>
            <td>${helper.role()}</td>
            <td>${helper.salary()}</td>
        </tr>
        </tbody>
    </table>

</main>
<footer>
    &copy; 2025 - Organisation des Evenements by HEIG-VD
</footer>
</body>
</html>
