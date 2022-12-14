<?php
// require "../App/Controllers/Controller.php";

// // $conn = new Connexion();
// // $conn->connect();

// $model = new UserModel();
// echo "<pre>";
// var_dump($model->verify('koladeabd@gmail.com'));
// echo "</pre>";
// $controller = new Controller('koladeabd@gmail.com');
// echo $controller->verifyControl();

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire</title>
</head>
<body>
    <form action="../App/Controllers/login.inc.php" method="post">
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="pwd" placeholder="Password" required>
        <button type="submit" name="connexion">Valider</button>
        <p>Vous n'avez pas un compte ? <a href="sign_up.php">Créer un compte!</a></p>
    </form>
</body>
</html>