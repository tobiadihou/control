<?php
require "UserModel.php";
class Controller {

    /**
     * $usermodel
     */
    public $usermodel;

    public $firstname;
    public $lastname;
    public $email;
    public $password;

    public function __construct($firstname, $lastname, $email, $password) {
        $this->firstname = $firstname;
        $this->lastname = $lastname;
        $this->email = $email;
        $this->password = $password;
        $this->usermodel = new UserModel();
    }
    /**
     * verifyControl()
     */
    public function verifyControl() {
      $res = $this->usermodel->verify($this->email);
      $count = count($res);
       if($count>0) {
        header("Location:../../public/sign_up.php?msg=user_existant");
        exit();
    } else {
        $insert = $this->usermodel->insertUser($this->lastname, $this->firstname, $this->email, $this->password);
        header("Location:../../public/sign_up.php?msg=user_cree");
        exit();
    }
    }
}