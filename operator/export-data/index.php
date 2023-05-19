<?php
include("../operator-backend.php");
include("../../connection.php");
checkIsOperatorLoggedIn(1);
?>
<?php
$connection = getConnectionToDatabase();
$query = "SELECT id, c_answer FROM tasks;";
$result = $connection->query($query);

?>