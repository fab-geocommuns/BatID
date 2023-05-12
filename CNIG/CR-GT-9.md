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

## Sur les modes de contribution

#### Restitution des ateliers de co-contribution sur les contributions au RNB 
    - Vue d'ensemble : 10h d'atelier en 2 SEMAINES avec 20+ participants
    - Participants : ADEME, IGN, CSTB, DGFIP, SDES, INSEE, Grenoble, Fabrique Géoco.
    - À venir : Toulouse, Opérateurs de Réseaux, Dinum
    - Synthèse diffusée le 5 mai au GT CNIG n°10

#### Différents modes de contribution

![](https://s3.hedgedoc.org/demo/uploads/b2d6b6d8-e41e-4e38-8ebb-0f109303e914.png)
![](https://s3.hedgedoc.org/demo/uploads/9891c6f7-524e-47c6-b69c-2e65d34923c0.png)
![](https://s3.hedgedoc.org/demo/uploads/fc31738a-b6d9-4991-951c-cb7efc6603e1.png)
![](https://s3.hedgedoc.org/demo/uploads/3eb48fb6-26b3-44bc-b81a-12a30cd2331b.png)
![](https://s3.hedgedoc.org/demo/uploads/d473931d-35b6-4632-973c-2fa8dc751f02.png)
![](https://s3.hedgedoc.org/demo/uploads/f3dca615-0276-4b8b-b37c-3af5c1db0c46.png)

#### Commentaires : 

- Sur le signalement : 
    - Pour les utilisateurs utilisant les données d'un référentiel, les fonctions de signalement sont étroitement liées aux fonction de (re)synchronisation. Il faut que vous abordiez les fonctions envisagées je pense.

- Besoin de venir préciser les informations qui peuvent être modifiés dans le cadre des signalements :
    - Arrêter d'utiliser "enveloppe" pour dire "géométrie"
    - Statuts : En projet, en construction, construit, démoli

- Commentaires généraux:
    - Difficulté dans la réfléxion : Chaque contributeur / signaleur se place dans sa propre logique au regard de ses propres missions, compétences. Donc cela veut dire qu'on a besoin d'une analyse des contributions pour vérifier leur pertinence. La représentation d'un bâtiment par un diagnostiqueur ne sera pas forcément la même que celle d'un gestionnaire par ex. Donc cela entraine des ressources, consacrées à la vérification et donc des moyens significatifs. 
        - Contre exemple d'OSM qui fonctionne en auto-régulation même si ce n'est pas un référentiel
        - Attention : le référentiel doit avoir cet aspect certifié (fondamental) - ce qui impose à un moment un arbitrage qui est indispensable du fait que les gens ne respectent pas forcément toutes les consignes et/ou qui se trompent.
        - Si on a plusieurs contributeurs / on intègre des signalements - il faut dédier des moyens à l'arbitrage. Si on décide d'une gestion totalement centralisée, de toute façon il y aurait des moyens spécifiques à dédier, et il faut caractériser ces moyens dans l'une et l'autre option.

    - Une collectivité, maître d’œuvre de la base en local, garante de sa fiabilité/certification, voudra conserver le rôle de modérateur sur le signalement et assurer elle-même les corrections.
        - Différence par rapport aux adresses (BAN) : cadre réglementaire et législatif on est plus dans le flou et ça ne facilite pas la détermination.
        - Donc peut être que certains contributeurs seront certifiés sur certains aspects : communes pourrait se voir attribuer la compétence de validation des attributs liés au cycle de vie du bâtiment.

    - Il faut faire un RNB partagé avec les bonnes règles, de ne pas s'appuyer du tout sur les signalements ça serait dommage. 
        - Approche contributive intéressante - il faudrait moduler le discours pour dire que la priorité est sur l'initialisation (étape 1) et les fluxs administratifs (étape 2) ce qui permettrait un bon premier niveau d'information. Mettre la priorité sur la constitution initiale, suivie de la mise en place de flux dministratifs, avant de s'intéresser aux modes collaboratifs (cf OSM) et aux signalement (cf IGN)
        - Convaincu que c'est ce qu'on ne sait pas faire en France c'est de signaler des anomalies dans des référentiels (sauf portail de l'IGN). Le point de convergence est de convenir de ressources humaines disponibles pour arriver à une qualité et une certitude de prise en charge des signalements.
        - Comment collaborer correctement : communes (gardent la main sur le début du cycle), couperet taxe foncière (DGFIP garde la main). Il faut un système décentralisé, notamment en s'intéressant au modèle OSM pour permettre d'offrir quelque chose d'extrêmement souple et on pourrait ensuite y mettre des règles d'organisation et les adapter régulièrement. Toute autre règles rigide sera très cher à faire évoluer et c'est souvent notre limite française. 
        - La priorité est de matérialiser un bâtiment existant sur le terrain. Donc déjà (à un palier à fixer) : nettoyer les bâtis détruits et créer les bâtis récents que méconnaissent toutes les BD.
        - Ou alors modèle suisse : équipe minimale de 15 personnes avec une centralisation des trois référentiel : adresse, bâtiment, local --> on divise par 3 le nombre d'ETP pour gérer ces trois référentiels. Attention cela demande quand même pas mal de ressources sur les communes pour en faire l'entretien au niveau Suisse.

    - Un référentiel n'est utile que si il est utilisé ! Il faut donc aussi travailler sur les modalité de publication (ne pas faire comme la BAN :))
    - Côté Etat il n'y pas non plus la pérennité. La non maj des bâtis sur le PCI est rédhibitoire. Dans tous les projets DINUM la pérennité des équipes n'est pas acquise non plus. La centralisation n'est pas / plus une garantie d'efficacité.
