<?php
    class model {
        public function getname($nom) {
            return $this->name = $nom;
        }
        public function getage($age) {
             $this->age = $age + 15;
             return $this->age;
        }
    }

?>