<?php
include("../examinee-conn.php");
$con = getConnectionToDatabase();
$stmt = $con->prepare("SELECT * FROM `tasks` ORDER BY RAND() LIMIT 1;");
$stmt->execute();
$row = $stmt->fetch(PDO::FETCH_ASSOC);
$c_answer = $row["c_answer"];
$has_file = $row["has_file"];
$file_name = $row["file_name"];
function videoOrImage($has_file, $file_name) {
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
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Odpowiadaj</title>
    <!-- <link rel="stylesheet" type="text/css" href="style.css" /> -->
</head>

<body>
    <form method="POST" id="form">

        <label>
            <?= $row["content"] ?>
        </label>
        <?php
            videoOrImage($has_file, $file_name);
        ?>
        <div>
            <fieldset id="user-answer">
                <legend>Wybierz odpowiedź</legend>
                <input type="submit" name="answer_1" <?php if (isset($answer) && $answer == "1")
                    echo "checked"; ?>
                    value="<?= $row["answer_1"] ?>" onclick='elemele(this)'><br>
                <input type="submit" name="answer_2" <?php if (isset($answer) && $answer == "2")
                    echo "checked"; ?>
                    value="<?= $row["answer_2"] ?>" onclick='elemele(this)'><br>
                <input type="submit" name="answer_3" <?php if (isset($answer) && $answer == "3")
                    echo "checked"; ?>
                    value="<?= $row["answer_3"] ?>" onclick='elemele(this)'><br>
                <input type="submit" name="answer_4" <?php if (isset($answer) && $answer == "4")
                    echo "checked"; ?>
                    value="<?= $row["answer_4"] ?>" onclick='elemele(this)'><br>
            </fieldset>
        </div>
        <div id="q-id-input" class="display-none"><?php echo $row["id"]; ?></div>
        <div id="correct-answer" class="display-none"><?php echo $c_answer ?></div>
    </form>
</body>
<script src="javascript.js"></script>
</html>