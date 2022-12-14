<?php
require "Controller.php";

if($_SERVER["REQUEST_METHOD"] === "POST" & isset($_POST["inscription"])) {
    $fname = $_POST["fname"];
    $lname = $_POST["lname"];
    $email = $_POST["email"];
    $pwd = $_POST["pwd"];

    // echo "$fname $lname $email $pwd";

// $conn = new Connexion();
// $conn->connect();

// $model = new UserModel();
// echo "<pre>";
// var_dump($model->verify($email));
// echo "</pre>";
$controller = new Controller($fname, $lname, $email, $pwd);
$controller->verifyControl();
} else {
    header("Location:../../public/index.php?msg=error");
    exit();
}