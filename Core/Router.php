<?php
class Router {
    protected $routes = [];
    protected $parametres = [];

    public function add($url, $param = []) {
        $route = preg_replace("/\//", "\/", $url);
        $route = preg_replace("/\{([a-z-]+)\}/", "(?'\\1'[a-z-]+)", $route);
        $route = preg_replace("/\{([a-z-]+):([^\}]+)\}/", "(?'\\1'\\2)", $route);

        $route = "/^" . $route . "\$/i";

        $this->routes[$route] = $param;
    }

    public function match($url) {
        foreach ($this->routes as $route => $params) {
            if(preg_match($route, $url, $matches)) {
                foreach ($matches as $key => $match) {
                    if(is_string($key)) {
                        $params[$key] = $match;
                    }
                }
                $this->parametres = $params;
                return true;
            }
        }
        return false;
    }

    public function convertToPascalCase($url) {
        return preg_replace("/-/", "", ucwords($url, "-"));
    }
    public function convertToCamelCase($url) {
        return lcfirst($this->convertToPascalCase($url));
    }

    public function autoload($classname) {
        return spl_autoload_register(function($classname) {
            require ("../App/Controllers/" . $classname . ".php");
        } 
        );
    }

    // public function verify($verify) {
    //     if($this->autoload($verify)) {
    //         var_dump( $this->autoload($verify) );
    //     } else {
    //         echo 'mauvais';
    //         header("Location:../public/index.php");
    //     }
    // }

    public function dispatch($url) {
        if($this->match($url)) {
            $controller = $this->parametres["controller"];
            $controller = $this->convertToPascalCase($controller);
            if($this->autoload($controller)) {
                $controller_object = new $controller();
                $action = $this->parametres["action"];
                $action = $this->convertToCamelCase($action);
                
                if(method_exists($controller, $action)) {
                    $controller_object->$action();
                } else {
                    echo "Cette méthode \"$action\" n'existe pas dans cette classe.";
                }
            } else {
                echo "Cette \"$controller\" n'existe pas !!!";
            }
        } else {
            echo "Cette route \"$url\" ne passe pas.";
        }
    }

    public function getadd() {
        return $this->routes;
    }

    public function getmatch() {
        return $this->parametres;
    }
}

?>