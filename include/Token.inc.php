<?php 
class Token {
    
    public $tokenid;        
    public $username;        
    public $expiration_date; 

    public function __construct($ptokenid="", $puname="", $pexpdate="") {
        $this->tokenid = $ptokenid;
        $this->username = $puname;
        $this->expiration_date = $pexpdate;
    }
}

?>