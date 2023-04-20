<?php
include ("operator-backend.php")
?>
<!DOCTYPE html>
<html lang="pl-PL">

<head>
    <title>Operator</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../stylesheets/operator.css">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <nav>
        <h1>INF 02 Widok operatora</h1>
    </nav>
    <main>
        <p>Strona dla uczniów: [adresip]/examinee</p>
        <section id="tasks-questions">
            <?= printTasks($con) ?>
        </section>
    </main>
    <script src="ajax.js"></script>
</body>

</html>