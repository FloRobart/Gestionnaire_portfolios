var ancienElement = null;
window.addEventListener('load', initEvents, false);

function initEvents()
{
    var elementsModifiable = document.getElementsByClassName('modifiable');
    var elementsAjouter = document.getElementsByClassName('btnAjouter');

    for (var i = 0; i < elementsModifiable.length; i++)
        elementsModifiable[i].addEventListener('click', cliqueModif, false);

    for (var i = 0; i < elementsAjouter.length; i++)
        elementsAjouter[i].addEventListener('click', cliqueAjout, false);
}


/* Fonction qui permet de modifier un élément */
function cliqueModif(elementCliquer)
{
    /* Définition de l'ancien élément */
    ancienElement = elementCliquer.target;

    /* Création du nouvel élément (input) */
    var input = document.createElement('input');
    input.setAttribute('class', ancienElement.getAttribute('class'));
    input.setAttribute('id'   , ancienElement.getAttribute('id'));
    input.setAttribute('style', ancienElement.getAttribute('style') + 'width: 100%;height: 100%;');
    input.setAttribute('value', ancienElement.innerHTML);
    if (ancienElement.getAttribute('id') == 'userName')
        input.setAttribute('onkeyup', 'this.value = this.value.toUpperCase();');

    /* Remplacement de l'ancien élément par le nouvel élément */
    ancienElement.parentNode.replaceChild(input, ancienElement);
    input.focus();
    input.addEventListener('blur', valider, false);
}

/* Fonction qui permet de valider la modification d'un élément */
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


function cliqueAjout(elementCliquer)
{
    console.log(elementCliquer.target);
    var div1 = document.createElement('div');
    div1.setAttribute('class', 'col-xxl-4');
    div1.setAttribute('id', 'competence');

    var div2 = document.createElement('div');
    div2.setAttribute('class', 'card border-white');
    div2.setAttribute('style', 'position: relative;');
    div1.appendChild(div2);

    var div3 = document.createElement('div');
    div3.setAttribute('class', 'border rounded-pill border-dark');
    div3.setAttribute('style', 'width: 100%;height: 100%;');
    div2.appendChild(div3);

    var p = document.createElement('p');
    p.setAttribute('class', 'modifiable');
    p.setAttribute('style', 'text-align: center;margin-bottom: 0px;');
    p.innerHTML = 'Nouvelle compétence';
    p.addEventListener('click', cliqueModif, false);
    div3.appendChild(p);

    var lstCompetences = document.getElementById('lstCompetences');
    lstCompetences.appendChild(div1);
}