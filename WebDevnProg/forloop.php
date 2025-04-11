<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For Loop</title>
</head>
<body>
    <h2 style="font-family: Serif">Activity 2A. Using For Loop in PHP</h2>
    <form method="POST">
        Enter a word: <input type="text" name="text" required><br><br>
        Number of iterations: <input type="number" name="num" required><br><br>
        <input type="submit" value="Repeat">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $text = $_POST["text"];
        $num = $_POST["num"];

        if($num <= 0){
            echo "<p style='color:red;'>Invalid Input, Please Enter a Natural Number.</p>";
        } else {
        echo "<h3>Output:</h3>";
        for ($i = 1; $i <= $num; $i++) { #starting from 1; loop til it surpasses number of iterations
            echo "$i. $text<br>";
        }
         }
    }
    ?>
</body>
</html>
