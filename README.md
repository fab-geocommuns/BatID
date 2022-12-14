# BatID

Ce projet a pour but d'être un support permettant d'alimenter la reflexion et les échanges concernant 
la mise en place du référentiel national des batiments en France. 

Initié dans le cadre de la cinquième promotion du programme d'état [Entrepreneur d'Intérêt Général](https://eig.etalab.gouv.fr/defis/batid/), (EIG), le projet batID prend aujourd'hui la forme d'une start d'état, incubée à [la fabrique des géocommuns](https://www.ign.fr/institut/la-fabrique-des-geocommuns-incubateur-de-communs-lign), cofinancée apr l'[ADEME](https://www.ademe.fr/), le [CSTB](http://www.cstb.fr/fr/) et l'[IGN](https://www.ign.fr/institut/la-fabrique-des-geocommuns-incubateur-de-communs-lign), dans le but de co-construire le Référentiel National des bâtiments. 


## Sommaire
- [Contexte](#Contexte)
    - [Recherche Utilisateurs](#Recherche-Utilisateurs)
    - [Démarche - Etat d'esprit](#démarche---etat-desprit) 
    - [Démarche - Comment procéder ? ](#démarche---comment-procéder-)
- [Vers une Definition du bâtiment](#Vers-une-Definition-du-bâtiment)
- [Vers une intégration dans les processus - À venir](#Vers-une-intégration-dans-les-processus---À-venir)
- [Vers un modèle de données - À venir](#Vers-un-modèle-de-données---À-venir)
- [Vers un découpage du parc - À venir](#Vers-un-découpage-du-parc---À-venir)
- [Contributions](#Contributions)

## Contexte

#### Recherche Utilisateurs

La première phase de ce projet, à l'initiative de l'[ADEME](https://www.ademe.fr/) et du [CSTB](http://www.cstb.fr/fr/), 
a été de mener une recherche utilisateurs étendue, pour saisir les enjeux autour d'un référentiel du bâtiment. 
Ce rapport est disponible [ici](https://github.com/entrepreneur-interet-general/BatID/blob/99e36173d5143e72426749fb7fd40f438ec56842/docs/Rapport-Phase-1-Bat-ID.pdf), 
et les quelques lignes ci-dessous tentent d'en être un résumé synthétique.
Les cas d'usages de l'information bâtimentaire sont multiples, pour des acteurs publics comme privés, 
les données proviennent de multiples producteurs, la gouvernance de ces données est à ce jour multi-acteurs.
Cependant, aujourd'hui, il n'existe pas de référentiel du bâtiment en France, 
qui faciliterait l'interopérabilité des informations, apporterait une cohérence 
vis à vis des autres concepts liées (adresses, locaux, parcelles cadastrales) ce impose à de 
nombreux acteurs de réaliser les mêmes croisement, parfois très techniques, avec des moyens variables, 
et une maturité variables sur ces compétences de la donnée.

Et surtout, il y a une perte d'information et peu d'historique disponible sur le bâtiment en général, les sources éparses ne sont pas toujours bien documentées ou assez ouvertes, pour faciliter l'accès à l'information. Bref, le besoin est présent.


Ainsi donc un référentiel du bâtiment sera satisfaisant, s'il est exhaustif, conçu de façon transparente, pour durer et dont la gouvernance claire assure sa pérennisation.

#### Démarche - Etat d'esprit

Ici, ouverture, coopération et bienveillance sont maîtres mots avec comme objectif de construire ensemble une démarche utile pour l'intérêt général. Le service public n'ayant pas le monopole de l'intérêt général, ce référentiel se veut accessible et utile à tous les acteurs qui souhaitent s’y investir.

Les éléments partagés ont pour vocation à susciter la réaction, être un support afin de progresser ensemble sur ce sujet. Nous faisons de la coopération un critère clef de réussite. Et à ce titre, nous vous demandons de respecter notre [`code de conduite`](CODE_OF_CONDUCT.md).

#### Démarche - Comment procéder ? 

Commençons par le début, il s'agit de
- Définir le bâtiment 
- Établir un stock : Initialiser la découpe du parc existant au regard de la définition retenue.
- Identifier les flux : les bâtiments étant composés des bâtiments d'aujourd'hui et ceux qui sont à construire.
- Ensuite, gérer les flux, en intégrant ce référentiel dans les processus administratifs afin de créer les boucles de rétroactions permettant de faire vivre le référentiel.

Prise de position à ce jour, un référentiel pertinent, c'est un référentiel vivant, alimenté par le terrain. 

Pour les acteurs de terrains, ce référentiel doit être une opportunité plutôt qu'une contrainte, charge à sa construction et sa mise en œuvre de s'intégrer au maximum aux processus existants, pour accompagner ces producteurs de la donnée.

## Vers une Definition du bâtiment 

Afin d'aboutir à une définition du bâtiment satisfaisante, il est nécessaire de concerter largement. Pour cela, nous menons des approches multiples que l’équipe Bat-ID est chargée de coordonner pour en assurer le lien entre elles.
- Sur la définition du bâtiment : Une approche multi-acteurs est engagée: l’équipe Bat-ID mènent des ateliers de co-création de définitions auprès de plusieurs organisations productrices de données, dont les résultats sont disponibles [ici](docs/Synthèse-Ateliers-de-Définition-Bat-ID.pdf).
- Un [groupe de travail](http://cnig.gouv.fr/?page_id=26261) sous l'égide du Conseil National de l'information géolocalisée [CNIG](http://cnig.gouv.fr/) qui vise à faire remonter toutes ces réflexions au niveau institutionnel et à aboutir à un standard commun.
- Une expérimentation terrain avec la métropole de Toulouse permettant de confronter ces réflexions à la réalité d’un territoire.

Notre démarche se veut ouverte et contributive, ici et sur les forums des [géocommuns](https://forum.geocommuns.fr/) et de [team open data](https://teamopendata.org/t/identifiant-unique-batiment/2899).

Suivez ce [`lien`](BUILDING_DEFINITIONS.md) pour vous embarquer dans la lecture des nombreuses définitions du bâtiment proposées et discutées lors des ateliers.
Dans le cadre de l’expérimentation avec Toulouse Métropole, nous proposerons des premiers éléments de définition que nous aurons testé, afin que cela puisse alimenter la réflexion. Celle-ci n’est qu’un début et pourra évoluer dans le temps bien sûr !

## Vers une intégration dans les processus - À venir

L'idée générale étant de ne pas ajouter un énième processus pour faire vivre le référentiel, nous tentons d'explorer les pistes d'intégration à des processus existants. 

Les premières pistes de réflexions sont :
- les Autorisations du Droit des Sols (ADS) par les collectivités
- les mutations de biens par les notaires
- l'établissement des valeurs locatives cadastrales par la DGFiP
- le recensement de la population par l'INSEE
- le recensement des ERP et points d'accès par les SDIS
- toute autre piste pertinente …


## Vers un modèle de données

Voir [la documentation dédiée](DATA_MODEL.md)

## Vers un découpage du parc - À venir

## Contributions

Tout ceci ne sont pas des éléments gravés dans la roche mais plutôt des éléments pour alimenter la réflexion sur ces sujets.

Dans un souci d'ouverture, de bienveillance et de  coopération, nous sommes donc preneur de toute contribution, dans le respect de [`ce code de conduite`](CODE_OF_CONDUCT.md). N'hésitez donc pas à ouvrir une issue ou nous contacter directement !
