<?php
include ("bootstrap.php");
if(isset($_POST["password"])) {
    $connection = getConnectionToDatabase();
    login($connection);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zaloguj się</title>
    <link href="../fontawesome/css/fontawesome.css" rel="stylesheet">
    <link href="../fontawesome/css/brands.css" rel="stylesheet">
    <link href="../fontawesome/css/solid.css" rel="stylesheet">
    <link href="./assets/stylesheets/login-style.css" rel="stylesheet">
</head>

<body>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
        <h1>Wprowadź hasło:</h1>
        <div class="line">
            <div id="lock-background">
                <i class="fas fa-lock"></i>
            </div>
            <input type="password" name="password">
        </div>
        <input type="submit" value="Zaloguj się">
    </form>
</body>

</html>