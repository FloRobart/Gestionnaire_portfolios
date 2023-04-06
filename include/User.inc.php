<?php 
class User {
    private $nom;
    private $hashMdp;

    public function __construct($pNom="", $pHash="") {
        $this->nom     = $pNom;
        $this->hashMdp = $pHash;
    }
}

?>