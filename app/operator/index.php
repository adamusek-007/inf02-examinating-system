<?php
include("bootstrap.php");
checkIsOperatorLoggedIn(0);
$con = getConnectionToDatabase();
?>
<!DOCTYPE html>
<html lang="pl-PL">

<head>
    <title>Operator</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/stylesheets/style.css">
    <link rel="stylesheet" href="../../fontawesome/css/fontawesome.css">
    <link rel="stylesheet" href="../../fontawesome/css/solid.css">
    <link rel="stylesheet" href="../../fontawesome/css/brands.css">
</head>

<body>
    <nav>
        <h1>INF.02 Widok nauczyciela</h1>
        <div class="buttons-nav">
            <a href="./change-password/" class="nav-row"><i class="fas fa-lock"></i>
                <p>Zmiana hasła</p>
            </a>
            <a href="./export-data/" class="nav-row">
                <i class="fa-solid fa-file-export"></i>
                <p>Eksport danych</p>
            </a>
            <a href="./import-data/" class="nav-row">
                <i class="fa-solid fa-file-import"></i>
                <p>Import danych</p>
            </a>
        </div>
    </nav>
    <main>
        <p>Strona dla uczniów:
            <a href="/examinee/"><?= $_SERVER['SERVER_ADDR'] ?>/examinee</a>
        </p>
        <p>
            <a href="./manage-exams/" target="_blank">
                Egzaminy
                <i class="fa-solid fa-arrow-up-right-from-square"></i>
            </a>
        </p>
        <section id="tasks-questions">
            <?= printTasks($con) ?>
        </section>
    </main>
    <script src="ajax.js"></script>
</body>

</html>