<!DOCTYPE html>
{#
    Variables :
    username : nom de l'utilisateur connecté
    connectPath : redirection vers la page de connection si l'utilisateur n'est pas connecté
    portfolios : liste des derniers portfolios créés
#}

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Accueil</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-md py-3">
        <div class="container"><a class="navbar-brand d-flex align-items-center" href="#"><span style="font-size: 30px;">FolioEdit</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-2">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"></li>
                    <li class="nav-item"></li>
                    <li class="nav-item"></li>
                </ul><a class="btn btn-primary ms-md-2" role="button" {{connectPath}} style="border-style: none;background: rgba(0,0,0,0);color: rgb(0,0,0);font-size: 20px;text-align: center;">{{username}}<img src="assets/img/connexion.png" style="width: 60px;height: 60px;border-style: none;color: rgb(0,0,0);" width="50" height="50"></a>
            </div>
        </div>
    </nav>
    <section class="py-4 py-xl-5">
        <div class="container h-100">
            <div class="row h-100" style="margin-top: 76px;">
                <div class="col-md-10 col-xl-8 text-center d-flex d-sm-flex d-md-flex justify-content-center align-items-center mx-auto justify-content-md-start align-items-md-center justify-content-xl-center">
                    <div>
                        <h2 class="text-uppercase fw-bold mb-3">CREER SON PORTFOLIO FACILEMENT</h2>
                        {% if username == "Connexion" %}
                            <a href="connexion.php"><button id="btnMonPortfolio">Mon portfolio</button></a>
                        {% else %}
                            <a href="portfolio.php?username={{username}}"><button id="btnMonPortfolio">Mon portfolio</button></a>
                        {% endif %}
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="container py-4 py-xl-5" style="margin-top: 49px;">
        <div class="row mb-5">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h2>Les derniers portfolios</h2>
                <p></p>
            </div>
        </div>
        <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-xl-3">
            {% for folio in portfolios %}
            <!-- Carte -->
            <div class="col-xxl-4">
                <a href="portfolio.php?username={{folio.username}}" style="text-decoration: none; color: inherit;">
                    <div class="card"><img class="card-img-top w-100 d-block fit-cover" style="height: 200px;" src="userdata/{{folio.username}}/{{folio.img}}"> <!-- Banniere -->
                        <div class="card-body p-4">
                            <h4 class="card-title">Portfolio de&nbsp {{folio.username}}</h4>
                            <div class="d-flex">
                                <div>
                                    <p class="fw-bold mb-0">{{folio.nom}}</p>
                                    <p class="text-muted mb-0">{{folio.descr}}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            {% endfor %}
        </div>
        <footer class="text-center" style="margin: 45px;margin-bottom: -39px;margin-top: 79px;">
            <div class="container text-muted py-4 py-lg-5">
                <p class="mb-0">Copyright © 2023 FolioEdit</p>
                <ul class="list-inline">
                    <li class="list-inline-item me-4"></li>
                    <li class="list-inline-item me-4"><a class="link-secondary" href="Mentions_legales.html">Mentions légales</a></li>
                    <li class="list-inline-item"></li>
                </ul>
            </div>
        </footer>
    </div>
    <script src="./assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>