<?php
require "control.php";
require "header.php";

// echo get_class($model);

$fname=$lname=$pass="";
if($_SERVER["REQUEST_METHOD"] ===  "POST") {
    $fname = $_POST["fname"];
    $lname = $_POST["lname"];
    $age = $_POST["age"];
    $pass = $_POST["pass"];
    $date = Date("Y m d");
    
    // echo $fname . " " . $lname . " " . $age . " " . $pass;
    $model = new model();
    $controller = new controller($fname, $age);
    // echo $controller->getnom($fname);
    // echo $controller->getAge($age);
    $_SESSION["firstname"] = $fname;
    $_SESSION["lastname"] = $lname;
    $_SESSION["date"] = $date;
    $_SESSION["age"] = $controller->getAge($age);
    
    header("location: session.php");
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Essai</title>
    <style>
        .container {
            max-width: 40%;
            margin: 0 auto;
        }
        form {
            display: flex;
            flex-wrap: wrap;
            gap:1em;
        }
        form input,
        form button {
            flex-basis: 100%;
            padding: 12px 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="essai.php" method="post">
            <input type="text" name="fname" placeholder="Firstname">
            <input type="text" name="lname" placeholder="Lastname">
            <input type="number" name="age" placeholder="Age">
            <input type="password" name="pass" placeholder="Password">
            <button type="submit">Valider</button>
        </form>
    </div>
</body>
</html>