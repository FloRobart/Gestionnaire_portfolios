<?php
class Competence {
    public $id;
    public $nom;
    public $descr;

    public function __construct($id = 0, $nom="", $descr="") {
        $this->id = $id;
        $this->nom      = $nom;
        $this->descr    = $descr;
    }
}


?>