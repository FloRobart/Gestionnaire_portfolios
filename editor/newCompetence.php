<?php     
    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    require_once("../include/DB.inc.php");
    
    $conn = DB::getInstance();

    if ($conn == null) {echo "no bado ???"; return;}
    
    if (!isset($_COOKIE["connexionToken"])) {
        echo "tes pas co"; return;
    }

    $folio = $conn->getPortfolio($conn->getUsernameFromToken($_COOKIE["connexionToken"]));

    $conn->newCompetence($folio->id);

    echo $conn->getLatestCompetence()[0]->id;


?>