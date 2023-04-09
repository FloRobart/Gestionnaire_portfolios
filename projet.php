<?php 
ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_DEPRECATED);

require_once("include/DB.inc.php");
require_once( "Twig/lib/Twig/Autoloader.php" );

if (!isset($_GET["id"])) {echo "404"; return;}

echo ".";

Twig_Autoloader::register();
$twig = new Twig_Environment( new Twig_Loader_Filesystem("./templates"));

$tpl = $twig->loadTemplate( "projet.tpl" );

$conn = DB::getInstance();

$projet = $conn->getProjet($_GET["id"]);
$portfolio = $conn->getPortfolioWithId($projet->folio);

$editorMode = isset($_COOKIE["connexionToken"]) && $conn->getUsernameFromToken($_COOKIE["connexionToken"]) == $portfolio->username;


pageRender($tpl, $portfolio, $projet, $editorMode);
return;


function pageRender($tpl, $portfolio, $projet, $editorMode=false) {
    echo $tpl->render(array("portfolio"=>$portfolio, "projet"=>$projet, "editorMode"=>$editorMode));
}
?>