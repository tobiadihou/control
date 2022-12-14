<?php

require "model.php";
class controller {
    protected $name;
    protected $age;
    protected $model;

    public function __construct($nom, $age) {
        $this->name = $nom;
        $this->age = $age;
        $this->model = new model();
    }

    public function getnom($nom) {
        return $this->model->getname($nom);
    }

    public function getAge($age) {
        $result = $this->model->getage($age);
        if($result>20) {
            return $this->age;
        } else {
            return $this->age . " ans";
        }
    }
}


?>