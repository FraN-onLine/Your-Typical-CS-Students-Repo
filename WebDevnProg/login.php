<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
</head>
<body>
    <h2>Activity 1. Login Form</h2>
    <form method="POST">
        Username: <input type="text" name="username" required><br><br>
        Password: <input type="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>

    <?php
    #set the credentials to match
    $validusername = "DCS_MMSU";
    $validpassword = "MMSU1";

    if ($_SERVER["REQUEST_METHOD"] == "POST") { #if method was through post, check credebtials
        $user = $_POST["username"];
        $pass = $_POST["password"];

        if ($user == $validusername && $pass == $validpassword) {
            echo "<p style='color:green;'>Login successful! Welcome, $user.</p>";
        } else {
            echo "<p style='color:red;'>Login denied. Invalid credentials.</p>";
        }
    }
    ?>
</body>
</html>
