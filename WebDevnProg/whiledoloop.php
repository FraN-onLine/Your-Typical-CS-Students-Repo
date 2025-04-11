<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>While-Do Loop</title>
</head>
<body>
<h2 style="font-family: Serif">Activity 2C. Using While-Do Loop in PHP</h2>
    <form method="POST">
        Enter a word: <input type="text" name="text" required><br><br>
        Number of iterations: <input type="number" name="num" required><br><br>
        <input type="submit" value="Repeat">
    </form>

<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $text = $_POST["text"];
        $num = $_POST["num"];
        $i = 1;

        if($num <= 0){
            echo "<p style='color:red;'>Invalid Input, Please Enter a Natural Number.</p>";
        } else {
        echo "<h3>Output:</h3>";
        while ($i <= $num) { #til i goes over n
            echo "$i. $text<br>";
            $i++;
        }
        }
    }
    ?>
</body>
</html>