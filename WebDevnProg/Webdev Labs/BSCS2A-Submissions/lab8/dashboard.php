<?php 

if (isset($_COOKIE["username"])) {
    echo "<h1> Welcome " . $_COOKIE["username"] . "</h1>";
}
?>
<a href="login.php" target="blank"> Back to Login </a>
