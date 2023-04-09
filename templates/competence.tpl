<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Compétence</title>
    <link rel="stylesheet" href="../../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/Hero-Clean-Reverse-images.css">
    <link rel="stylesheet" href="../../assets/css/styles.css">
</head>

<body>
    <p hidden id="compId">{{competence.id}}</p>
    {% if editorMode == true %}
        <nav class="navbar navbar-light navbar-expand-md py-3">
            <div class="container"><a class="btn btnAnnuler" role="button" id="btnSimple" href="#">Annuler et revenir à l'accueil</a>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="navbar-nav ms-auto"></ul><a class="btn btnSave" role="button" id="btnSaveFolio" href="#">Sauvegarder</a><!-- Metttre la fonction pour tous enregistrer dans la bado ici -->
                </div>
            </div>
        </nav>
        {% endif %}
    <nav class="navbar navbar-light navbar-expand-md mb-3">
        <div class="container"><span class="modifiable" id="userName" style="border: solid 2px black;border-radius: 10px;padding: 2px;">{{portfolio.nom}}</span>
            <div class="collapse navbar-collapse" id="navcol-2">
                <ul class="navbar-nav ms-auto">
                    <li id="btnSimple" class="nav-item">     <a href="#Projets">Projets</a></li>
                    <li id="btnSimple" class="nav-item mx-3"><a href="#Competences">Compétences</a></li>
                    <li id="btnSimple" class="nav-item">     <a href="./Contact.html">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container py-4">
        <div class="row gy-4 gy-md-0">
            <div class="col">
                <div style="max-width: 100%;">
                    <h2 class="text-uppercase fw-bold modifiable">{{competence.nom}}</h2>
                    <p class="my-3 modifiable">{{competence.descr}}</p>
                </div>
            </div>
        </div>
    </div>
    {% if projets %}
    <hr style="height: 3px;background: #000;"><span class="h3 mx-2">Projets liés</span>
    <div class="row gy-4 row-cols-md-2 row-cols-xl-3" id="lstProjets" style="margin-top: 0px;margin-right: 0px;margin-left: 0px;">
        <div class="col-xxl-4" id="projet-1">
            <div class="card border-white" style="position: relative;">
                <div style="margin-left: 50%;transform: translate(-50%);width: 100%;height: 100%;max-width: 400px;"><a href="./Projet.html"><span style="width: 100%;height: 100%;max-width: 400px;border-radius: 50px;">nom de la compétence ???</span></a></div>
            </div>
        </div>
    </div>
    <div class="row mt-4" id="btnAjouterProjet">
        <div class="col-md-8 col-xl-6 text-center mx-auto"><button class="btn btnAjouter btnAjouterProjet" id="btnSimple" type="button" style="width: 100%;">Ajouter un projet</button></div>
    </div>
    {% endif %}

    <hr style="height: 3px;background: #000;">
    <div class="container text-muted" style="text-align: center;"><a class="link-secondary" href="#">Mentions légales</a>
        <p>Copyright © 2023 FolioEdit</p>
    </div>
    <script src="./clique_event.js"></script>
</body>

</html>