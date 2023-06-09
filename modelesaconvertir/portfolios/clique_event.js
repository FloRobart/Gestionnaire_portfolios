var ancienElement = null;
var bodyOrig = document.getElementsByTagName('body')[0].outerHTML;

window.addEventListener('load', initEvents, false);
function initEvents()
{
    var elementsModifiable = document.getElementsByClassName('modifiable');
    var imagesModifiable = document.getElementsByClassName('imgModifiable');
    var elementsAjouter = document.getElementsByClassName('btnAjouter');
    var btnAnnuler = document.getElementsByClassName('btnAnnuler')[0];
    var btnSave = document.getElementsByClassName('btnSave');

    /* Ajout des événements sur les éléments modifiables */
    for (var i = 0; i < elementsModifiable.length; i++)
        elementsModifiable[i].addEventListener('click', cliqueModif, false);

    /* Ajout des événements sur les images modifiables */
    for (var i = 0; i < imagesModifiable.length; i++)
        imagesModifiable[i].addEventListener('click', cliqueImgModif, false);

    /* Ajout des événements sur les éléments ajoutables */
    for (var i = 0; i < elementsAjouter.length; i++)
        elementsAjouter[i].addEventListener('click', cliqueAjout, false);

    /* Ajout de l'événement sur les boutons sauvegarder */
    for (var i = 0; i < btnSave.length; i++)
        btnSave[i].addEventListener('click', cliqueSave, false);

    /* Ajout de l'événement sur le bouton annuler */
    btnAnnuler.addEventListener('click', cliqueAnnuler, false);
    btnSave   .addEventListener('click', cliqueSave, false);
}



/*============================================*/
/* Fonction qui permet de modifier un élément */
/*============================================*/
function cliqueModif(elementCliquer)
{
    /* Définition de l'ancien élément */
    ancienElement = elementCliquer.target;

    /* Création du nouvel élément (input) */
    var input = document.createElement('input');
    input.setAttribute('class', ancienElement.getAttribute('class'));
    input.setAttribute('id'   , ancienElement.getAttribute('id'));
    input.setAttribute('style', ancienElement.getAttribute('style'));
    input.setAttribute('value', ancienElement.innerHTML);
    if (ancienElement.getAttribute('id') == 'userName')
        input.setAttribute('onkeyup', 'this.value = this.value.toUpperCase();');

    /* Remplacement de l'ancien élément par le nouvel élément */
    ancienElement.parentNode.replaceChild(input, ancienElement);
    input.focus();
    input.addEventListener('blur', valider, false);
}


/*===========================================================*/
/* Permet d'ajouter un élément (un projet ou une compétence) */
/*===========================================================*/
function cliqueAjout(elementCliquer)
{
    /* Ajout d'une compétence */
    if (elementCliquer.target.getAttribute('class').indexOf('btnAjouterCompetence') != -1)
    {
        var div1 = document.createElement('div');
        div1.setAttribute('class', 'col-xxl-4');
        div1.setAttribute('id', 'competence');

        var div2 = document.createElement('div');
        div2.setAttribute('class', 'card border-white');
        div2.setAttribute('style', 'position: relative;');
        div1.appendChild(div2);

        var div3 = document.createElement('div');
        div3.setAttribute('class', 'border rounded-pill border-dark px-2');
        div3.setAttribute('style', 'width: 100%;height: 100%;');
        div2.appendChild(div3);

        var a = document.createElement('a');
        a.setAttribute('id', 'competence');
        a.setAttribute('href', './Competence.html');
        div3.appendChild(a);

        var p = document.createElement('p');
        p.setAttribute('style', 'text-align: center;margin-bottom: 0px;');
        p.innerHTML = 'Nouvelle compétence';
        a.appendChild(p);

        var lstCompetences = document.getElementById('lstCompetences');
        lstCompetences.appendChild(div1);
    }
    /* Ajout d'un projet */
    else if (elementCliquer.target.getAttribute('class').indexOf('btnAjouterProjet') != -1)
    {
        var div1 = document.createElement('div');
        div1.setAttribute('class', 'col-xxl-4');
        div1.setAttribute('id', 'projet');

        var div2 = document.createElement('div');
        div2.setAttribute('class', 'card border-white');
        div2.setAttribute('style', 'position: relative;');
        div1.appendChild(div2);

        var div3 = document.createElement('div');
        div3.setAttribute('style', 'margin-left: 50%;transform: translate(-50%);width: 100%;height: 100%;max-width: 400px;');
        div2.appendChild(div3);

        var a = document.createElement('a');
        a.setAttribute('id', 'projet');
        a.setAttribute('href', './Projet.html');
        div3.appendChild(a);

        var img = document.createElement('img');
        img.setAttribute('style', 'width: 100%;height: 100%;max-width: 400px;border-radius: 50px;');
        img.setAttribute('src', '../../assets/img/vide.png');
        a.appendChild(img);

        var lstProjets = document.getElementById('lstProjets');
        lstProjets.appendChild(div1);
    }
}


/*===========================================*/
/* Fonction qui permet de modifier une image */
/*===========================================*/
function cliqueImgModif(elementCliquer)
{

    var input = document.createElement('input');
    input.type = 'file';

    var file = null;
    input.onchange = e => { file = e.target.files[0]; }


    input.click();
    console.log(file);
}


/*====================================*/
/* Permet d'annuler les modifications */
/*====================================*/
function cliqueAnnuler(elementCliquer)
{
    var body = document.getElementsByTagName('body')[0]
    deleteChild(body);
    body.innerHTML = bodyOrig;
    // temporaire
    document.location.reload();
}


/*=========================================*/
/* Permet de sauvegarder les modifications */
/*=========================================*/
function cliqueSave(elementCliquer)
{
    bodyOrig = document.getElementsByTagName('body')[0].outerHTML;
}



/*================================================*/
/* Permet de valider la modification d'un élément */
/*================================================*/
function valider(elementValider)
{
    var input = elementValider.target;

    /* Création du nouvel élément (même balise que l'élément avant d'être remplacer par l'input) */
    var nouveauElement = document.createElement(ancienElement.nodeName);
    nouveauElement.setAttribute('class', ancienElement.getAttribute('class'));
    nouveauElement.setAttribute('id'   , ancienElement.getAttribute('id'));
    nouveauElement.setAttribute('style', ancienElement.getAttribute('style'));
    nouveauElement.innerHTML = input.value;

    /* Remplacement de l'input par le nouvel élément */
    input.parentNode.replaceChild(nouveauElement, input);
    nouveauElement.addEventListener('click', cliqueModif, false);
}


/*===================================================*/
/* Permet de supprimer tous les enfants d'un élément */
/*===================================================*/
function deleteChild(parent)
{
    var child = parent.lastElementChild; 
    while (child)
    {
        parent.removeChild(child);
        child = parent.lastElementChild;
    }
}