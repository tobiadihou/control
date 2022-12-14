<?php
require "../Core/Router.php";
// require "../App/Controllers/Posts.php";
$url = $_SERVER["QUERY_STRING"];
// echo $url;

$router = new Router();
$router->add("{controller}/{action}");
$router->add("admin/{controller}/{action}");
$router->add("{controller}/{id:\d+}/{action}");
$router->match($url);
echo $router->convertToPascalCase("ok-ok");
// echo "La classe de \$router\" " . "est " . get_class($router);
echo "<pre>";
print_r($router->getadd());
echo "</pre>";
echo "<pre>";
print_r($router->getmatch());
echo "</pre>";
echo "<pre>";
print_r($router->dispatch($url));
// print_r($router->verify("Posts"));
echo "</pre>";

// spl_autoload_register(function($classname) {
//     require ("../App/Controllers/" . $classname . ".php");
// } 
// );
// $p = new Posts();
// $p->indexPosts();
?>