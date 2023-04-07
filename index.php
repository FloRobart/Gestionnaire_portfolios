<?php 
ini_set('display_errors', 1);
error_reporting(E_ALL);


require_once("include/DB.inc.php");
require_once( "Twig/lib/Twig/Autoloader.php" );


Twig_Autoloader::register();
$twig = new Twig_Environment( new Twig_Loader_Filesystem("./templates"));

$tpl = $twig->loadTemplate( "accueil.tpl" );

$username = "Connexion";
$connectpath = "href='connexion.php'";

if (!isset($_COOKIE["connexionToken"])) {
    pageRender($tpl, $username, $connectpath);
    return;
}

$conn = DB::getInstance();

$username = $conn->getUsernameFromToken($_COOKIE["connexionToken"]);
$connectpath = "";

pageRender($tpl, $username, $connectpath);
return;


function pageRender($tpl, $username, $connectpath) {
    echo $tpl->render(array("username"=>$username, "connectPath"=>$connectpath));
}
?>