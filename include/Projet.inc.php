<?php
class Projet {
    public $id;
    public $nom;
    public $descr;
    public $img;

    public function __construct($id = 0, $nom="", $descr="", $img="") {
        $this->id = $id;
        $this->nom      = $nom;
        $this->descr    = $descr;
        $this->img      = $img;
    }
}


?>