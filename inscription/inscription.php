<?php 



$dbuser = '';
$dbpass = '';

$conn = new mysqli("localhost", $dbuser, $dbpass, "forum");

if (! $conn) {
  echo "SHEEESH SA MARCHE PAS PD";
  exit();
}

//Infos Formulaire
$pseudoSaisi = $_POST["NomUtilisateur"];
$mdpSaisi    = $_POST["password"];
$mdpSaisi2   = $_POST["password-repeat"];	

echo $pseudoSaisi;
echo $mdpSaisi;
echo $mdpSaisi2;



$hash = password_hash($mdpSaisi, PASSWORD_BCRYPT);
$query = "INSERT INTO Users(pseudo, hashMdp) VALUES ('" . $pseudoSaisi . "','" . $hash . "');";


if (! $conn->query($query)) {
    echo "Erreur : " . $conn->error;
}
//Les login de la bado
?>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <title>test</title>
    </head>
    <body>
        <h2>Inscription <?php  echo "t pd " ?></h2>
        <p>Vous êtes inscrit !</p>
    </body>
</html>