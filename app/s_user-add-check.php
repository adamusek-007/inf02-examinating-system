<?php
include("connection.php");
$con = getConnectionToDatabase();

$class = getClass($con);
$ipaddress = getenv("REMOTE_ADDR");
$number = $_POST['number'];

$stmt = $con->prepare("SELECT id_student FROM students_data WHERE id_class = class;");

$stmt = $con->prepare("INSERT INTO students_data (ip_address, number_in_diary, id_class) ;");

function getClass($con) {
    $stmt = $con->prepare("SELECT current_class FROM current_class;");
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    $class = $row['current_class'];
    return $class;
}
