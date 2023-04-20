<?php
include("../connection.php");
$taskId = $_REQUEST["par1"];
$answerId = $_REQUEST["par2"];
$con = getConnectionToDatabase();
$stmt = $con->prepare("UPDATE tasks SET `c_answer`='answer_${answerId}' WHERE id = ${taskId}");
$stmt->execute();