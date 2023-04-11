<?php     
    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    require_once("../include/DB.inc.php");
    
    $conn = DB::getInstance();

    if ($conn == null) {echo "no bado ???"; return;}
    
    
    $conn->updateComp($_POST["id"] ,$_POST["newName"], $_POST["newDesc"]);

    echo "c'est bon pour vous ?"


?>