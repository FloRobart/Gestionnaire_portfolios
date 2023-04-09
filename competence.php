<?php 
ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_DEPRECATED);

require_once("include/DB.inc.php");
require_once( "Twig/lib/Twig/Autoloader.php" );

if (!isset($_GET["id"])) {echo "404"; return;}

echo ".";

Twig_Autoloader::register();
$twig = new Twig_Environment( new Twig_Loader_Filesystem("./templates"));

$tpl = $twig->loadTemplate( "competence.tpl" );

$conn = DB::getInstance();

$competence = $conn->getCompetence($_GET["id"]);
$portfolio = $conn->getPortfolioWithId($competence->folio);

$editorMode = isset($_COOKIE["connexionToken"]) && $conn->getUsernameFromToken($_COOKIE["connexionToken"]) == $portfolio->username;


pageRender($tpl, $portfolio, $competence, $editorMode);
return;


function pageRender($tpl, $portfolio, $competence, $editorMode=false) {
    echo $tpl->render(array("portfolio"=>$portfolio, "competence"=>$competence, "editorMode"=>$editorMode));
}
?>