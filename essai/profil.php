<?php
require "header.php";

?>
    <main>
    <?php if(isset($_SESSION["firstname"])): ?>
                <p>Nom: <?php echo $_SESSION["lastname"] ?></p>
                <p>Prénoms: <?php echo $_SESSION["firstname"] ?></p>
                <p>Age: <?php echo $_SESSION["age"] ?></p>
                <p>Date de création du compte: <?php echo $_SESSION["date"] ?></p>
                <?php else: ?>
                <p>Vous êtes pas connecté !!</p>
                <?php endif; ?>
    </main>
</body>
</html>