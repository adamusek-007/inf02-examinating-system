<?php
include("connection.php");
$con = getConnectionToDatabase();
$stmt = $con->prepare("SELECT * FROM `current_class`;");
$stmt->execute();
$curr_class_row = $stmt->fetch(PDO::FETCH_ASSOC, PDO::FETCH_ORI_NEXT, 0);
$curr_class = $curr_class_row["current_class"];
if ($curr_class == "Wybierz klasę") {
    echo "<p>Poproś nauczyciela o wybranie klasy</p>";
    exit();
} else {
    header("Location: ${_SERVER['REMOTE-ADDR']}/examinee/");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System nauki</title>
</head>

<body>
    <form action="examinee/index.php" method="POST" id="form">
        <label>Wprowadź swój numer po którym będą identyfikowane twoje odpowiedzi</label>
        <input type="number" name="number" required min="1" max="64">
        <input type="submit">
        <p id="txtResp"></p>
    </form>
</body>
<script src="ajax.js"></script>

</html>