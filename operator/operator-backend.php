<?php
include("../connection.php");
$con = getConnectionToDatabase();
function printClasses($con)
{
    $stmt = $con->prepare("SELECT `class` FROM `classes`;");
    $sstmt = $con->prepare("SELECT current_class FROM current_class;");
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
        for ($i = 0; $i < $stmt->rowCount(); $i++) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC, PDO::FETCH_ORI_NEXT, $i);
            echo "<option>" . $row["class"] . "</option>";
        }
    }
}
function printTasks($con)
{
    $stmt = $con->prepare("SELECT * FROM tasks");
    $stmt->execute();

    for ($i = 1; $i <= $stmt->rowCount(); $i++) {

        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $id = $row["id"];
        $has_file = $row["has_file"];
        $file_name = $row["file_name"];
        $content = $row["content"];
        $answer_1 = $row["answer_1"];
        $answer_2 = $row["answer_2"];
        $answer_3 = $row["answer_3"];
        $answer_4 = $row["answer_4"];
        $c_answer = $row["c_answer"];

        //! GENERATE VIEW SECTION
        echo "<form>";
        echo "<h4>${id}. ${content}</h4>";
        if ($has_file) {
            if (
                str_contains(
                    $file_name,
                    'PNG'
                ) ||
                str_contains(
                    $file_name,
                    'png'
                ) ||
                str_contains(
                    $file_name,
                    'jpg'
                ) ||
                str_contains(
                    $file_name,
                    'JPG'
                )
            ) {
                echo "<img width='320' height='auto' src='/files${file_name}' alt='Błąd wczytywania zdjęcia :)'>";
            } else {
                echo "<video width='320' height='auto' controls><source src='/files${file_name}' type='video/mp4'></video>";
            }
            echo "<br>";
        }

        for ($x = 1; $x <= 4; $x++) {
            $answer = ${"answer_$x"};
            if ($$c_answer == $answer) {
                echo "<input id='${i}${x}' type='radio' name='answer' onclick='updateTask(this.id)' checked>";
                echo $answer;
                echo "</input><br>";
            } else {
                echo "<input id='${i}${x}' type='radio' name='answer' onclick='updateTask(this.id)'>";
                echo $answer;
                echo "</input><br>";
            }

        }
        echo "</form>";
    }
}

function checkIsOperatorLoggedIn() {
    $cookie_name = "logged-in";
    if (!isset($_COOKIE[$cookie_name])) {
        header("Location: login.php");
    }
    // if() {
        // exit;
    // }
}

function login($con) {
    $password = $_POST["password"];
    $query = "CALL VerifyPassword(\"${password}\");";
    $result = $con->query($query);
    if ($result->rowCount() > 0) {
        $row = $result->fetch(PDO::FETCH_ASSOC);
        if ($row["PasswordOK"] == 1) {
            setcookie("logged-in", "true", time()+3600*24);
            header("Location: index.php");
        }
    }
}