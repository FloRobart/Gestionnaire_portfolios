<?php 
ini_set('display_errors', 1);
error_reporting(E_ALL);


require_once("include/DB.inc.php");
require_once( "Twig/lib/Twig/Autoloader.php" );

if (!isset($_GET["username"])) {echo "404"; return;}


Twig_Autoloader::register();
$twig = new Twig_Environment( new Twig_Loader_Filesystem("./templates"));

$tpl = $twig->loadTemplate( "templatePortfolio1.tpl" );

$conn = DB::getInstance();

$portfolio = $conn->getPortfolio($_GET["username"]);
$projets = $conn->getProjets($portfolio->id);
$competences = $conn->getCompetences($portfolio->id);


pageRender($tpl, $portfolio, $projets, $competences);
return;


function pageRender($tpl, $portfolio, $projets, $competences) {
    echo $tpl->render(array("portfolio"=>$portfolio, "projets"=>$projets, "competences"=>$competences, "editorMode"=>false));
}