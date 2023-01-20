# Compte Rendu Groupe de Travail Bâti n°6

**Date:** 06.12.22

**Lien vers le replay:** https://bbb-dinum-scalelite.visio.education.fr/presentation/f41d9500ea95d3742d11f47b674b12e18463aa84-1670338703535/meeting.mp4


**27 Participants:**

Adeline Ferchaud - Bordeaux Métropole

Arnauld GALLAIS (Cerema)

Christine Bordier - DHUP/PH4

Colin GUIGNABAUDET (Métropole de Montpellier)

Cyril Chabert (Wegoto)

Dufresne Emilie AREC Occitanie

Elisabeth Talbourdet-Ville - BatID

Emmanuelle Martin EPT 12 Grand Orly Seine Bièvre

Félix V - BatID

Frederique Williams IGN

Georges Monnot - Toulouse Métropole

Guillaume Rateau

Isabelle Giraud DDTM34

Jean-Roc Morreale (Metropole Lille)

Julieta Barado - DGALN

MAITREPIERRE ANSC Administratrice de données SIG

Pierre Nguyen Trong (GRDF)

Pierre PAGES(Toulouse Métropole)

Sébastien Wehrlé (Eurométropole de Strasbourg)

Sonia PELLOUX

Stéphanie ALIBERT - Toulouse Métropole

Sylvain Bardin (Métropole Aix-Marseille-Provence)

Thierry Lallemant (IGN)

Vincent Gomand (DGFiP)

Vincent Masson (IGN)

Yélise Akol IGN

## Récapitulatif des évènements du mois de Novembre 2022


- Validation de la définition par la Commission des Standards le 11 novembre 2022
    - L’annexe quant à elle peut encore être sujet à évolution
- Le projet Bat-ID continu en 2023 au sein de la Fabrique des Géo-communs de l’IGN
    - Avec pour projet de faire des liens renforcés avec la BAN

## Phase 2 - Conception du Modèle de Données - Cadrage

### Planning prévisionnel
![planning slide](./static/content-CR-GT-6/image1.png)

### Modes de travail 
- Proposition de travail en asynchrone sur GitHub entre les différentes sessions de
  travail du GT
    - Validé par les membres du GT, sous réserve d’une animation forte pour une bonne participation
- Quelle compétence sera mobilisée dans la rédaction du standard ? IGN conseil ?
    - IGN normalisation
    - Point d’action Bat-ID
- Quel rythme de travail ?
    - Si on objective un standard complet en fin 2023, il faut que le GT soit d’accord sur le standard en Sept. 2023
    - Sondage : 12 participants souhaitent une réunion tous les 2 mois, 8 participants souhaitent une réunion tous les mois
        - A compléter avec le travail en asynchrone
        - A compléter avec le résultat des expérimentations menées à Grenoble & Toulouse
    - Possibilité d’avoir des réunions plénières et des ateliers intermédiaires sur des points spécifiques.


## Echanges sur la conception du modèle de données

### Études des concepts autour de l’objet “Bâtiment”

#### 1. Sur la notion d’ID Unique
<img src="./static/content-CR-GT-6/image6.png" alt="screenshot mural id unique" style="zoom:50%;" />

- Sur l’aspect “unique”

    - ID unique : incontournable

- Sur l’aspect “pérenne”

- Sur l’aspect “signifiant”

    - Est ce qu’un ID doit inclure un code de parcelle / de commune ? 
    - Le risque est sur la pérennité et la robustesse de l’ID, notamment en cas de fusion de commune
    - Les différents participants en majorité souhaitent prendre l’approche d’un ID **non signifiant.**

- Soulève la question de **qui** créé l’identifiant: 

    - Proposition:
        - Gestion Centralisée, cela doit être un identifiant unique et aléatoire
        - Le responsable du RNB offre un service de génération des identifiants uniques au niveau central 
    - Proposition alternative évoquée : La compétence revient au niveau de la commune. Si c’est au niveau d’une compétence communale, il pourrait y avoir le n° INSEE de la commune pour que la commune puisse générer ces identifiants. L’identifiant pourrait ainsi permettre de regrouper par communes. 


- Sur l’exemple des BAL de la BAN

    - Clé d’interopérabilité, chaque opérateur de données peut la calculer, et elle a été mise en place **le temps d’avoir un ID unique d’adresse non signifiant**.

#### 2. Sur la notion de coordonnées géographiques
<img src="./static/content-CR-GT-6/image2.png" alt="screenshot mural coordonnées" style="zoom:50%;" />

- Normes d’expression des coordonnées géographiques : légal (Lambert 93 en métropole ) vs usages (appli web généralement en WGS 84).
  - Les deux systèmes de coordonnées sont utilisés dans les BALs et la BAN
- Quel niveau de précision ? Proposition : A minima, coordonnées géographiques assurées d’être à l’intérieur des enveloppes constituant le bâtiment.

#### 3. Sur la notion d’enveloppe / emprise

<img src="./static/content-CR-GT-6/image4.png" alt="screenshot mural emprise" style="zoom:50%;" />

- ID unique et coordonnées géographique : permet de se rattacher à plusieurs emprises/géométries si besoin.
- Avec un ponctuel, on peut faire coexister la vision cadastre et ortho (bien que celles- ci possèdent un décalage), on évite alors le débat de la représentation géométrique.
- L’origine de chaque enveloppe devra être diffusée
- question : le référentiel doit-il juste faire référence à l’ID et la source de l’enveloppe où également contenir certaines (lesquelles) enveloppes géométriques ?
  - Compromis à trouver pour faciliter l’usage/ l’adoption du référentiel.
  - Prochaine session : prendre un temps pour évoquer quelques cas d’usages afin que chacun puisse comprendre les problématiques des uns et autres.

