<?php 
class User {
    public $nom;
    public $hashmdp;

    public function __construct($pNom="", $pHash="") {
        $this->nom     = $pNom;
        $this->hashmdp = $pHash;
    }
}

?>