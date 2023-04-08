<?php
class Portfolio {
    public $id;
    public $username;
    public $nom;
    public $descr;
    public $email;
    public $phone;
    public $img;

    public function __construct($id = 0, $username="", $nom="", $descr="", $email="", $phone="", $img="") {
        $this->id = $id;
        $this->username = $username;
        $this->nom      = $nom;
        $this->descr    = $descr;
        $this->email    = $email;
        $this->phone    = $phone;
        $this->img      = $img;
    }
}


?>