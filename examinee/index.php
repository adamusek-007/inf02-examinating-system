<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Odpowiadaj se</title>
    <style>
        * {
            font-family: Helvetica;
            font-size: 25px;
            color: white;
        }

        body {
            background-color: #212529;
        }

        form {
            display: flex;
            flex-direction: column;
            margin-left: auto;
            margin-right: auto;
            flex-wrap: wrap;
            width: 80%;
            max-width: 100%;
        }

        legend {
            text-align: center;
        }

        label {
            margin-top: 20px;
            padding-top: 15px;
            padding-bottom: 15px;
            text-align: center;
            background-color: #17181a;
            /* white-space: pre-wrap; */
        }

        input[type="submit"], input[type="radio"] {
            margin-bottom: 10px;
            height: fit-content;
            padding: 15px;
            background-color: #17181a;
            border: none;
            width: 100%;
            white-space: pre-wrap;
            text-align: left;
        }

        input[type="submit"]:hover {
            background-color: #121212;
        }

        img {
            width: 60%;
            height: auto;
            align-self: center;
        }

        details {
            margin-left: auto;
            margin-right: auto;
            width: fit-content;
            display: block;
        }

        .opacity {
            opacity: 0.35;
        }

        .display-none {
            display: none;
        }

        @media only screen and (max-width: 600px) {
            * {
                font-size: medium;
            }

            body {
                margin: 0;
            }

            form {
                width: 100%;
            }

            img {
                width: 100%;
            }

            label[for="user-answer"] {
                padding-left: 5px;
                padding-right: 5px;
            }
        }

        #c-answers-streak {
            color: chartreuse;
        }
    </style>
</head>

<body>
    <form method="POST" id="form">
        <?php
        include("../examinee-conn.php");
        $con = getConnectionToDatabase();
        $stmt = $con->prepare("SELECT * FROM `tasks` ORDER BY RAND() LIMIT 1;");
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $c_answererrererer = $row["c_answer"];
        ?>
        <label>
            <?= $row["content"] ?>
        </label>
            <?php
            $has_file = $row["has_file"];
            $file_name = $row["file_name"];
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
            ?>
        <div>
        <fieldset id="user-answer">
            <legend>Wybierz odpowiedź</legend>
            <input type="submit" name="answer_1" <?php if (isset($answer) && $answer == "1")
                echo "checked"; ?>
                value="<?= $row["answer_1"] ?>" onclick='elemele(this)'><label>
                
            </label><br>
            <input type="submit" name="answer_2" <?php if (isset($answer) && $answer == "2")
                echo "checked"; ?>
                value="<?= $row["answer_2"] ?>" onclick='elemele(this)'><label>
                
            </label><br>
            <input type="submit" name="answer_3" <?php if (isset($answer) && $answer == "3")
                echo "checked"; ?>
                value="<?= $row["answer_3"] ?>" onclick='elemele(this)'><label>
                
            </label><br>
            <input type="submit" name="answer_4" <?php if (isset($answer) && $answer == "4")
                echo "checked"; ?>
                value="<?= $row["answer_4"] ?>" onclick='elemele(this)'><label>
                
            </label><br>
        </fieldset>
        </div>
    </form>
</body>
<script src="javascript.js"></script>
</html>