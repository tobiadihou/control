<?php
require "loginController.php";

if($_SERVER["REQUEST_METHOD"] === "POST" & isset($_POST["connexion"])) {
    $email = $_POST["email"];
    $pwd = $_POST["pwd"];

    echo "$email $pwd";

// $conn = new Connexion();
// $conn->connect();

// $model = new UserModel();
// echo "<pre>";
// var_dump($model->verify($email));
// echo "</pre>";
$logincontroller = new LoginController($email, $pwd);
$logincontroller->verifyLoginControl();
} else {
    header("Location:../../public/index.php?msg=error");
    exit();
}