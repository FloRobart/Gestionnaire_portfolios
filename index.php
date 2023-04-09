<?php 
ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_DEPRECATED);


require_once("include/DB.inc.php");
require_once( "Twig/lib/Twig/Autoloader.php" );


Twig_Autoloader::register();
$twig = new Twig_Environment( new Twig_Loader_Filesystem("./templates"));

$tpl = $twig->loadTemplate( "accueil.tpl" );

$username = "Connexion";
$connectpath = "href=connexion.php";

$conn = DB::getInstance();


$portfolios = $conn->getLatestPortfolios();


for ($cpt = 0; $portfolios != null && $cpt < sizeof($portfolios); $cpt++) {
    $portfolios[$cpt]->descr = substr($portfolios[$cpt]->descr, 0, 40) . "...";
}

if (!isset($_COOKIE["connexionToken"])) {
    pageRender($tpl, $username, $connectpath, $portfolios);
    return;
}

$username = $conn->getUsernameFromToken($_COOKIE["connexionToken"]);
$connectpath = "";



pageRender($tpl, $username, $connectpath, $portfolios);
return;


function pageRender($tpl, $username, $connectpath, $portfolios) {
    echo $tpl->render(array("username"=>$username, "connectPath"=>$connectpath, "portfolios"=>$portfolios));
}
?>