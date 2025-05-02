<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Length Conversion</title>
    <link rel="stylesheet" href="convert.css">

    <?php
    function convert(){

        $inputv = (double) $_POST['input'];
        $conversionv = $_POST['conversion'];
        $result;
        

        if ($conversionv === 'MTKM') {
           $result = $inputv / 1000;
        } else if ($conversionv === 'ITCM') {
            $result = $inputv * 2.54;
        } else if ($conversionv === 'KMTM') {
           $result = $inputv * 1000;
        } else if ($conversionv === 'CMTI') {
            $result = $inputv / 2.54;
        }
        return $result;
    }
    ?>

</head>
<body>

<div class="container">

    <p><b>Length Conversion</b></p>
    <div class="form">
    <form action="convert.php" method="POST">
        <label for="input">From:</label>    
        <input type="number" id="input" name="input" placeholder="Value" step="0.000001">
        <select id="conversion" name="conversion">
            <option value="MTKM">Meters to Kilometers</option>
            <option value="KMTM">Kilometers to Meters</option>
            <option value="ITCM">Inches to Centimeters</option>
            <option value="CMTI">Centimeters to Inches</option>
    </select>
    </div><br><br>
   
    <input type="submit" style= "align-items: center;">
    </form>
    
    <?php
    if($_SERVER["REQUEST_METHOD"] == "POST"){
        echo "<h4>Result: ".convert();
    }
    ?>
    </h4>
   
    <footer>All rights reserved. Copyright © 2025. <br>By Not Lowell Augusteen Gamet Cabie</footer>
</div>

</body>
</html>