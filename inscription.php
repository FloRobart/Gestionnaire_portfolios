<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);


require_once("include/DB.inc.php");
require_once( "Twig/lib/Twig/Autoloader.php" );


Twig_Autoloader::register();
$twig = new Twig_Environment( new Twig_Loader_Filesystem("./templates"));

$tpl = $twig->loadTemplate( "inscription.tpl" );

//Check if POST request
if (!checkPostRequest()) {
    pageRender($tpl, "", "display:none;");
    return;
}

//Password confirmation
if ($_POST["password"] != $_POST["password-repeat"]) {
    pageRender($tpl, "Les mots de passe ne correspondent pas !", "");
    return;
}

$username = trim($_POST["nomUtilisateur"]);

$conn = DB::getInstance();

if (!$conn->checkUsername($username)) {
    pageRender($tpl, "Cet utilisateur existe déjà !", "");
    return;
}

$conn->createUser($username, $_POST["password"]);
echo "c'est la merguez bleue ! LA MERGUEZ BLEUE !";





function checkPostRequest() {
    return isset($_POST["nomUtilisateur"]) && isset($_POST["password"]) && isset($_POST["password-repeat"]);
}

function pageRender($tpl, $errorMessage, $errorDisplay) {
    echo $tpl->render(array("errorMessage"=>$errorMessage, "errorDisplay"=>$errorDisplay));
}
?>