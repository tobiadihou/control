<?php
session_start();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="#">Accueil</a></li>
                
                <?php if(isset($_SESSION["firstname"])): ?>
                <li><a href="profil.php">Mon profil</a></li>
                <li><a href="decon.php">Déconnexion</a></li>
                
                <?php else: ?>
                <li><a href="essai.php">Connexion</a></li>
                <?php endif; ?>
            </ul>
        </nav>
    </header>