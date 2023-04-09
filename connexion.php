<?php
ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_DEPRECATED);


require_once("include/DB.inc.php");
require_once( "Twig/lib/Twig/Autoloader.php" );


Twig_Autoloader::register();
$twig = new Twig_Environment( new Twig_Loader_Filesystem("./templates"));

$tpl = $twig->loadTemplate( "connexion.tpl" );

$conn = DB::getInstance();

if (isset($_COOKIE["connexionToken"])) {header("Location: index.php"); return;}

if (!checkPostRequest()) {pageRender($tpl, "", "display: none;"); return;}

if (!$conn->checkAccount($_POST["nomUtilisateur"], $_POST["password"])) {pageRender($tpl, "Informations de connexion invalides !", ""); return;}

//create token
$token = bin2hex(random_bytes(32));
$conn->createToken($_POST["nomUtilisateur"], $token);

//create cookie with token id
setcookie("connexionToken", $token, time() + 86400);

//Redirect to main page*/
header("Location: index.php");
return;

function checkPostRequest() {
    return isset($_POST["nomUtilisateur"]) && isset($_POST["password"]);
}

function pageRender($tpl, $errorMessage, $errorDisplay) {
    echo $tpl->render(array("errorMessage"=>$errorMessage, "errorDisplay"=>$errorDisplay));
}
?>