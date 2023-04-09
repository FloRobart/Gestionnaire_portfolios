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
                    <h2 class="text-uppercase fw-bold modifiable" id="nom">{{competence.nom}}</h2>
                    <p class="my-3 modifiable" id="description">{{competence.descr}}</p>
                </div>
            </div>
        </div>
    </div>
    
    <hr style="height: 3px;background: #000;">
    <div class="container text-muted" style="text-align: center;"><a class="link-secondary" href="#">Mentions légales</a>
        <p>Copyright © 2023 FolioEdit</p>
    </div>
    {% if editorMode == true %}
    <script src="./scripts/clique_event.js"></script>
    {% endif %}
</body>

</html>