<!DOCTYPE html>
{#
    Variables:
    
    portfolio : contenu du portfolio
    projets : liste des projets 
    competences : liste des compétences

    editorMode : si le mode éditeur est actif
#}
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>{{portfolio.nom}}</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Navbar-Right-Links-icons.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
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
            <div class="container"><a class="navbar-brand d-flex align-items-center" href="#"><span class="modifiable" id="userName" style="border: solid 2px black;border-radius: 10px;padding: 2px;">{{portfolio.nom}}</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-2">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item" style="border: solid 2px black;border-radius: 10px;padding: 2px;"><a class="nav-link active" href="#">Projets</a></li>
                        <li class="nav-item mx-3" style="border: solid 2px black;border-radius: 10px;padding: 2px;"><a class="nav-link active" href="#">Compétences</a></li>
                        <li class="nav-item" style="border: solid 2px black;border-radius: 10px;padding: 2px;"><a class="nav-link active" href="#">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container my-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="border rounded-pill border-2 border-dark p-4 mx-4">
                        <p class="modifiable" id="description">{{portfolio.descr}}</p>
                    </div>
                </div>
                <div class="col-md-6"><img class="rounded border rounded-circle" style="max-width: 350px;max-height: 350px;margin-left: 50%;transform: translateX(-50%);" src="userdata/{{portfolio.username}}/{{portfolio.img}}"></div>
            </div>
        </div>
        
        <hr style="border-width: 3px;">
        <div id="Projets">
            <div class="row gy-4 row-cols-md-2 row-cols-xl-3" id="lstProjets">
                {% if projets %}
                {% for projet in projets %}
                <div class="col-xxl-4" id="projet">
                    <div class="card border-white" style="position: relative;">
                        <div style="margin-left: 50%;transform: translate(-50%);width: 100%;height: 100%;max-width: 400px;"><a id="projet" href="./projet.php?id={{projet.id}}"><img style="width: 100%;height: 100%;max-width: 400px; max-height: 250px;border-radius: 50px; object-fit: cover;" src="userdata/{{portfolio.username}}/{{projet.img}}"></a></div>
                    </div>
                </div>
                {% endfor %}
                {% endif %}
            </div>
            {% if editorMode == true %}
            <div class="row mt-4" id="btnAjouterProjet">
                <div class="col-md-8 col-xl-6 text-center mx-auto"><button class="btn btnAjouter btnAjouterProjet" id="btnSimple" type="button" style="width: 100%;"> + Ajouter un projet</button></div>
            </div>
            {% endif %}
        
        </div>
        

        
        <hr style="border-width: 3px;">
        <div id="Competences">
            
            <div class="row gy-4 row-cols-md-2 row-cols-xl-3" id="lstCompetences">
                {% if competences %}
                {% for comp in competences %}
                <div class="col-xxl-4" id="competence">
                    <div class="card border-white" style="position: relative;">
                        <div class="border rounded-pill border-dark" style="width: 100%; padding-top: 20px; padding-bottom: 20px;">
                            <a id="competence" href="./competence.php?id={{competence.id}}"><p style="text-align: center;margin-bottom: 0px;">{{comp.nom}}</p></a>
                        </div>
                    </div>
                </div>
                {% endfor %}
                {% endif %}
            </div>
            {% if editorMode == true %}
            <div class="row mt-4" id="btnAjouterCompetence">
                <div class="col-md-8 col-xl-6 text-center mx-auto"><button class="btn btnAjouter btnAjouterCompetence" id="btnSimple" type="button" style="width: 100%;"> + Ajouter une compétences</button></div>
            </div>
            {% endif %}
        </div>
        
        <hr style="border-width: 3px;">
        <div class="container text-muted" style="text-align: center;">
            <p>{{portfolio.nom}}</p>
            <p>Mail :&nbsp<span class="modifiable" id="email">{{portfolio.email}}</span></p>
            <p>Tel :&nbsp<span class="modifiable" id="phone">{{portfolio.phone}}</span></p>
        </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    {% if editorMode == true %}
    <script type="text/javascript" src="scripts/clique_event.js"></script>
    {% endif %}
</body>

</html>