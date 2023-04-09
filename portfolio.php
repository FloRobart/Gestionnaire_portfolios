<?php 
ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_DEPRECATED);

require_once("include/DB.inc.php");
require_once( "Twig/lib/Twig/Autoloader.php" );

if (!isset($_GET["username"])) {echo "404"; return;}

echo ".";

Twig_Autoloader::register();
$twig = new Twig_Environment( new Twig_Loader_Filesystem("./templates"));

$tpl = $twig->loadTemplate( "templatePortfolio1.tpl" );

$conn = DB::getInstance();

$portfolio = $conn->getPortfolio($_GET["username"]);


$projets = $conn->getProjets($portfolio->id);
$competences = $conn->getCompetences($portfolio->id);

$editorMode = isset($_COOKIE["connexionToken"]) && $conn->getUsernameFromToken($_COOKIE["connexionToken"]) == $_GET["username"];

if ($portfolio == null && $editorMode) {
    $portfolio = $conn->createPortfolio($_GET["username"]);
}


pageRender($tpl, $portfolio, $projets, $competences, $editorMode);
return;


function pageRender($tpl, $portfolio, $projets, $competences, $editorMode=false) {
    echo $tpl->render(array("portfolio"=>$portfolio, "projets"=>$projets, "competences"=>$competences, "editorMode"=>$editorMode));
}