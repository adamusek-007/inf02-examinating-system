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
                echo "<input id='${i}${x}' type='radio' name='answer' onclick='someAjax(this.id)' checked>";
                echo $answer;
                echo "</input><br>";
            } else {
                echo "<input id='${i}${x}' type='radio' name='answer' onclick='someAjax(this.id)'>";
                echo $answer;
                echo "</input><br>";
            }

        }
        echo "</form>";
    }
}
?>
<!DOCTYPE html>
<html lang="pl-PL">

<head>
    <title>Operator</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../stylesheets/operator.css">
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