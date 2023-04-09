<?php     
    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    require_once("../include/DB.inc.php");
    
    $conn = DB::getInstance();

    if ($conn == null) {echo "no bado ???"; return;}
    
    if (!isset($_COOKIE["connexionToken"])) {
        echo "tes pas co"; return;
    }

    $user = $conn->getUsernameFromToken($_COOKIE["connexionToken"]);
    
    $conn->updateFolio($user ,$_POST["newName"], $_POST["newDesc"], $_POST["newEmail"], $_POST["newPhone"]);

    echo "c'est bon pour vous ?"


?>