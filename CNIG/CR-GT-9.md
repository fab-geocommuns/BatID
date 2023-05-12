# GT Bati CNIG 9 05-05-2023

**Date:** 05.05.2023

- [Lien vers l'enregistrement vidéo](https://bbb-dinum-scalelite.visio.education.fr/playback/presentation/2.3/4cb07e3a14bfe099ecb01d601bb57d18477690f3-1683270049371)

- [Rappel - Lien vers la définition & annexe](https://github.com/fab-geocommuns/BatID/tree/main/CNIG)

**Participants:**

- Adeline Ferchaud - Bordeaux Métropole
- Arnauld GALLAIS (Cerema)
- Virginie Desvigne (Grenoble)
- Elisabeth T - BatID
- Félix V - BatID
- Filipe Afonso - Stonal
- François ROLLO (DGFiP)
- Georges Monnot (Toulouse)
- J.VILLOT (URBS)
- Loïc REBOURS (Enedis)
- Mael REBOUX - Rennes
- Mylène RITTER (SDIS38)
- Olivier Lefebvre (Insee)
- Pierre PAGES (Toulouse Métropole)
- Régis Haubourg CSTB
- Rémi Beaurain (chef projet data Géo Vendée)
- Sébastien WEHRLE (Eurométropole de Strasbourg)
- Sylvain Bardin (Métropole Aix-Marseille-Provence)
- Vincent Gomand (DGFiP)
- Vincent Masson (IGN)

## ODJ
- Préparation en vue du conseil plénier du CNIG - 30 mai 2023
- Format de l'ID
- Modèle de données RNB
- Modes de contribution au référentiel

## Notes réunion

### Format de l'ID
[voir issue github pour les éléments de discussions](https://github.com/fab-geocommuns/BatID/issues/24)

#### Critères nécessaires à prendre en compte
    - l’ID doit pourvoir être lu ou écrit facilement par un humain
    - l’ID n’est pas signifiant
    - On souhaite avoir un faible risque de collision (nb actuel de bâtiment France ~ 30Millions)
    - Intéressant de donner la flexibilité à un potentiel usager de générer des IDs (en tout cas permettre une génération d’IDs non centralisée) : facilitation de la contribution
    - Etre en capacité de générer de façon performante un grand nombre d’ID
    - Ne pas réinventer la roue dans si un sytème d’ID existant satisfait à nos critères
    - Linked data / URI compatible ?


#### Deux options
    - Format Plaque d'immatriculation : Ex: AB456FV --> Facteur différenciant : Plus facilement utilisable par un humain
    - Format NanoID: Ex: Z8EU4TR7DFGD -->Facteur différenciant. Permet une génération décentralisée + Génération existante dans de nombreux langages (technos)

#### Précisions / Discussions

- [Linked data quesaqo ?](https://fr.wikipedia.org/wiki/Web_des_donn%C3%A9es)
    - Si on est pas compatible Linked Data on risque de rater une marche (par rapport à INSPIRE), le bâtiment est pivot entre divers jeux de données et on a besoin de tout chainer. Les technologies de Linked Data sont faites pour ça. Il y a des bases de données et des outils qui existent pour ça - qui sont opérationnelles de faits. Il faut que les données bâti puissent entrer dans ces schémas. Est ce que c'est l'ID lui même qui doit être compatible avec le Linked Data ? 
    - Les pré-requis sont les mêmes que ce qu'on a dit : accessible par une URI, translatable en URL. 
    - Globalement le NanoID est complètement dans la cible, l'UUID aussi 
    - Questions sur 'qu'est ce qu'on met dedans, qu'est ce qui est résolvable' mais plutot un enjeux sur les sites de mise à disposition pour la diffusion de l'ID. Pas encore complètement en place au niveau de l'état Français

- Un outil qui permet une gestion décentralisé est un énorme avantage (notamment pour les communes)

- L'UUID était la solution ultime ? Rejet utilisateurs assez fort car trop long. Le Nano ID parrait bien plus accessible sur les éléments visuels et permettent d'écrire le Nano ID sur un bout de papier si besoin (ce qui se fait)
- Le NanoID peut être généré de façon assez performante : pas trop de sujet sur les languages qui permettent de le générer: [voir la liste ici](https://github.com/ai/nanoid#other-programming-languages)

- La difficulté d'une génération décentralise réside dans le risque de collision, ce qui est très problématique pour un référentiel. Pouvez-vous rappeler comment il est maitrisé avec Nano_ID?
    - Pas vraiment d'inquiétude pour ma part. On a prouvé avec les uuid des métadonnées INSPIRE que pas de collision au niveau européen (en dehors des vraies duplication genre n fiches IGN qui ressortaient).
    - comme l'uuid, par calcul statistique. https://zelark.github.io/nano-id-cc/ Et une clé primaire dans la base centrale pourrait border le cas arrivant tous les 500 ans pour remonter une collision au moment de la consolidation nationale :)
    - La solution 2 semble très séduisante. Mais perso, je ne mesure pas assez le risque d'un mauvais paramétrage à la mise place d'un moteur avec NanoID => et donc risque potentiel de doublons ? Il me semble donc que le choix 2 impliquera de bien s'organiser pour garantir que les implémentation décentralisée seront vérifiées/contrôlées.
    - "Il reste la possibilité (que je ne pousse pas) de préfixer avec le code SIREN du producteur des données."

- Sur la génération décentralisée
    - Permet de créer des applications autonomes plutot que de faire appel à un webservice
    - Référentiel étant sensé être national : est ce que plusieurs personnes sur un territoire peuvent générer un NanoID ? Qu'est ce qu'on fait en cas de conflit ? 
    - Est ce qu'à un moment on ne va pas devoir recentraliser pour la post-vérification sur les clash et les doublons ? Comment on gère la remontée de l'information ?
    - Deux acteurs qui ont la possibilité de créer un ID qui le font en même temps de manière décentralisée - le problème serait identique ? 
        - C'est plus une question d'organisation (qui fait quoi à quel moment de la vie de l'objet) pour réguler les potentielles doublons et mettre des règles et des contrôles derrière. Mais d'impact sur la méthode utilisée de génération initiale. 
        - Mauvais exemple pour le coup car une commune n'a pas à intervenir sur le territoire d'une autre commune. Et si c'est l'EPCI (notre cas) qui est chef de file / gestionnaire technique : il n'y aura pas de risque de conflit au niveau du bloc local.
        - organisation : oui, clairement. On a eu ces débats sur l'adresse aussi.

- On aurait intérêt à travailler sur les règles d'organisation et contrôle pour savoir quel format on choisit 
    - Certaines règles de contrôles peuvent impliquer certains choix de l'ID
    - Le NanoID n'empêche pas la centralisation

- Quel intérêt de statuer maintenant ?
    - Pouvoir tester rapidement (agile) et avoir des retours terrains. 

- A-t-on une liste des usages de l'ID ? 
    - Oui, format synthétique [disponible ici](https://github.com/fab-geocommuns/BatID/blob/9365b5ad1976395f99311d678ab7c941c59aad93/docs/RNB%20-%20Cas%20d%20usages.pdf)
    - Attention à la fois à répondre à des usages "humain" et des compatibilités technologiques nécessaires.
    - La capacité à faire une décentralisation n'est pas forcément à utiliser/développer
    - Sur la question pratique : les gens auront en tête leurs adresses, mais l'ID ne rentrera pas nécessairement dans les usages du quotidien par les citoyens.
    - L'usager principal : personnes dans les collectivités qui utilisent les référentiels et les mettent à jour mais c'est tout.

- Les petites communes qui n’ont pas de service informatique auront-elles la possibilité de générer un NanoID ?

- Question du sondage
De manière expérimentale, quel format souhaitons nous tester ?
1: 2 ||| 11%
2: 12 |||||||||||||| 67%
3: 4 ||||| 22%
Options du sondage
1: Format plaque d'immatriculation
2: Format NanoID
3: Ne se prononce pas 
