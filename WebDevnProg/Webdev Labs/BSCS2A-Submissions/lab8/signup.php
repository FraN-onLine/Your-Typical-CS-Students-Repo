
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="styles.css" rel="stylesheet">
    <title>Signup Page</title>
</head>
<body>
    <h2>Signup Form</h2>
    <form method="POST">
        Username: <input type="text" name="username" required><br><br>
        Password: <input type="password" name="password" required><br><br>
        <input type="submit" value="signup">
    </form>

    <?php

    

    if ($_SERVER["REQUEST_METHOD"] == "POST") { #if method was through post, check credebtials
        $user = $_POST["username"];
        $pass = $_POST["password"];
        $filename = "credentials.txt";
        $file = fopen($filename, "w");
        fwrite($file, $user . "\n");
        fwrite($file, $pass);
        echo "<p style='color:green;'>Signup successful!</p>";
        fclose($file);
    }
    ?>
    <div class="links">
    <a href="login.php" target="blank"> Login </a>
    </div>
</body>
</html>