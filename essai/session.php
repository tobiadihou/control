<?php
require "header.php";

?>
    <main>
    <?php if(isset($_SESSION["firstname"])): ?>
                <p>Bienvenue <?php echo $_SESSION["firstname"] ?></p>
                <?php else: ?>
                <p>Bienvenue</p>
                <?php endif; ?>
    </main>
</body>
</html>