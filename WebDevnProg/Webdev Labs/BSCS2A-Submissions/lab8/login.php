
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <h2>Login Form</h2>
    <form method="POST">
        Username: <input type="text" name="username" required><br><br>
        Password: <input type="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>

    <?php

    if (session_status() == PHP_SESSION_ACTIVE){
        session_destroy();
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") { #if method was through post, check credebtials
        $user = trim($_POST["username"]);
        $pass = trim($_POST["password"]);

        $filename = 'credentials.txt';

    if (file_exists($filename)) {
        $file = fopen($filename, "r");
         $validusername = trim(fgets($file));
         $validpassword = trim(fgets($file));
        
    } else {
          echo "File does not exist.";
        }

    if ($user == $validusername && $pass == $validpassword) {
           setcookie("username", $user, time() + 3600);
           session_start();
           $_SESSION["user"] = $user;
           header("Location: dashboard.php");
     } else {
             echo "<p style='color:red;'>Login denied. Invalid credentials.</p>";
     }

     fclose($file);
    }
?>
    <div class="links">
    <a href="signup.php" target="blank"> Signup </a>
    </div>
    
</body>
</html>

    