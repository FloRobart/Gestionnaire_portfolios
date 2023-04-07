<!DOCTYPE html>
{# Variables :
    errorMessage : le message d'erreur
    errorDisplay : le style css a appliquer en cas d'erreur
 #}
<html class="text-dark" lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Connecter</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Ludens-Users---2-Register.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body class="text-dark bg-dark">
    <section class="text-center text-dark d-xl-flex align-items-xl-center register-photo" style="background-color: transparent;">
        <div style="margin-left: auto;margin-right: auto;">
            <form method="post" action="connexion.php" style="border-radius: 30px;">
                <h2 class="text-center"><strong>Se Connecter</strong></h2>
                <div class="form-group mb-3"><input class="border rounded border-dark form-control" type="text" name="nomUtilisateur" placeholder="Nom d’utilisateur" style="margin-top: 54px;"></div>
                <div class="form-group mb-3"><input class="border rounded border-dark form-control" type="password" id="password" name="password" placeholder="Mot de passe" style="margin-top: 32px;"></div>
                <div id="passwordsError" style="{{errorDisplay}}margin-bottom: 16.5px;"><span id="errorMessage" class="text-danger" style="font-size: 13px;">{{errorMessage}}</span></div>
                <div class="form-group mb-3"><a href="accueil/Accueil.html"><input class="btnCompte" type="button" value="Annuler" style="margin-right: 60px;"></input></a><button class="btnCompte" id="submitButton" type="submit">Connexion</button></div>
            </form><a class="already" href="inscription.php" style="text-decoration: none; color:white;">Pas de compte ?</a>
        </div>
    </section>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
</body>

</html>