# Compte Rendu Groupe de Travail Bâti n°7

**Date:** 01.02.2023

- [Lien vers le support Mural pdf](CR-GT-7-support-Mural.pdf)

- [Lien vers l'enregistrement vidéo](https://bbb-dinum-scalelite.visio.education.fr/playback/presentation/2.3/4cb07e3a14bfe099ecb01d601bb57d18477690f3-1675256325403)

- [Rappel - Lien vers la définition & annexe](https://github.com/fab-geocommuns/BatID/blob/eea3555c0de8fb178a85379306fbe85c358ea9ce/docs/CNIG/Annexe-Definition-Batiment.md)

**Participants :**
- DARTOIS_Gaëlle 
- Arnauld GALLAIS (Cerema)
- François ROLLO (DGFiP)
- Vincent Masson (IGN)
- Jean-Roc Morreale (MEL)
- Amelie MAITREPIERRE ANSC (SIG)
- Yann Kacenelen (SDIS 91)
- Félix V - BatID
- Emmanuelle Martin EPT 12 Grabd Orly Seine Bièvre
- Régis Haubourg CSTB
- Géo Vendée - Thibaud Le Dorze Géomaticien
- Yélise Akol IGN
- Laura Léchine
- Sébastien LRG
- Georges Monnot - Toulouse Métropole
- Stéphanie ALIBERT - Toulouse Métropole
- Pierre Pagès (Toulouse Métropole)
- Maël REBOUX (Rennes Métropole)
- GUERENDEL Josse (BSPP - SIG)
- Filipe - Stonal
- Valentin HAGENMULLER -Eurométropole Strasbourg
- Sébastien Wehrlé (Eurométropole de Strasbourg)
- Elisabeth Talbourdet-ville
- Marc Grossouvre, U.R.B.S.
- Rémi Beaurain (chef projet data Géo Vendée)

# Actu bat ID 
- Passage de projet EIG en start up d'état 
- Équipe incubée [Fabrique des géocommuns de l'IGN](https://www.ign.fr/institut/la-fabrique-des-geocommuns-incubateur-de-communs-lign)
- Recrutement de trois nouveaux profils : un développeur, un chargé de déploiement et une coach
- Communes partenaires du projet Bat-ID : 
    - Grenoble & Toulouse métropoles en cours d'expérimentation 
    - Rennes métropole, atelier recueil de besoins 
- Avancées sur le volet réglementaire
    
# Calendrier
- Session 7 du GT CNIG sur le modèle de donnée
- Pas de discussion sur le format de l'ID unique mais prévu pour la prochaine session.

# Focus réglementaire

- Présentation du volet réglementaire applicable : 
- 2017 : Directive Inspire européenne, établie une infrastructure d'information géographique au niveau européen. Transposée en droit français qui donne lieu à : 
    - 2010: Désignation du plan cadastral comme donnée de référence pour la représentation du bâti (Art. L.127-10 Code de l'Environnement)
    - Mais versement de la BD Topo sur le Géoportail Inspire

- 2023 (Janvier): Publication du règlement d'exécution de la directive Inspire qui liste les données à forte valeur. Les données géospatiales sont inclues dont le bâti, pour laquelle des attributs clés sont requis : 
    - ID unique 
    - Géométrie (emprise au sol)
    - Nombre d'étage 
    - Type d'utilisation 
        
Questions : 
- Contexte réglementaire récent EU : est ce qu'il y a un cadre réglementaire Français supplémentaire ? Y a-t-il un article de loi, ordonnance ou décret qui fait que la communauté des utilisateurs DOIT s'appuyer sur le futur standard bâti ? A priori non, pas plus d'information sur ce sujet. 
- Notion d'emprise au sol : règlement d'exécution, pas en tête à cette référence explicite. Peu être un sujet de difficulté car il y a différents modes de représentation (par ex. vue du toit).
    - La spécification de l'emprise au sol est-elle une suggestion ou contrainte ? Discussions préliminaires avec la DINUM, si on prend le terme géométrie en générale, alors on se réfère a INSPIRE et c'est une notion large (cf.https://inspire.ec.europa.eu/codelist/HorizontalGeometryReferenceValue)
    - Ça ressemble aux définitions INSPIRE : le footprint c'est ce qui permet d'avoir l'emprise maximale du bâtiment projeté au sol et qui prend le plus de place sur le terrain. Et donc c'est la valeur par défaut quand on parle du bâtiment. Ce n'est pas très grave car personne ne contrôle sur le terrain l'emprise mais plutot des gens qui vont réutiliser de manière fine une emprise de bâtiment qui vont pouvoir se plaindre. Il n'y a rien de bloquant. 
    - C'est cohérent avec la définition précédente du cadastre.
    - +1 Je pense qu'on ne doit pas sur-intérpréter par rapport au champ culturel urba français : attendons un peu des éléments d'implémentation , c'est très tôt. Je ne serais pas étonné que la directive renvoie à INSPIRE la responsabilité de faire un modèle de données détaillé. Le texte de loi donne une intention mais le but d'INSPIRE n'est pas de rentrer dans des modèles de données détaillés et communs ? Trouver des interlocuteurs pour ce sujet au niveau EU 

- Par rapport au nombre d'étage, il n'est pas forcément unique, doit-on comprendre le nombre maximal d'étages?

- Est ce que dans Inspire il donne le nombre d'étage ? La façon de le compter est très importante donc il faudra bien normaliser la manière dont on compte ce type d'étage. 
- Est ce uniformisé côté Fichiers Fonciers ? Côté FF comme on gère la notion de local, on sait à quel étage se situe le local. Donc par déduction on connait le nombre d'étages du bâtiment sur la base du déclaratif. --> Quid de la limite sur les maisons individuelles ?  
- (Rennes) On utilise la même source pour (tenter) de déterminer un nb d'étages dans notre BD bâti. Et au final : on transforme ça en même au doigt mouillé pour faire une 3D boîte à chaussure.*en mètres
- le RIL prévoit un nombre d'étage maximum en démarrant à 1 au rdc mais l'information n'est pas forcément robuste.

- par contre : "granularité jusqu'au 1/5000" : ça veut dire quoi ?(on va pê pas faire tout un débat…)


# Focus MDD étranger

## Suisse
1. pas de géometrie du batiment ou de l'immeuble dans ce modèle, soit des coordonnées ou un rattachement par la géom du point d'entrée. 
    - Tout à fait, chaque bâtiment a bien une coordonnée propre qui est au centre de l'enveloppe du bâtiment. Donc c'est une gestion du référentiel à l'aide d'un point dans l'espace- qui est un élément pivot. Cela permet quand il y a une instruction de permis de a minima de géolocaliser par un point et ne pas rentrer la géométrie. Cela permets de co-exister avec le cadastre (mensuration officielle). 
        - oui ils déléguent les représentations géométriques hors du référentiel --> côté pragmatique car c'est une vraie question cornelienne de choisir la représentation géométrique du bâtiment, il y en a plusieurs et ils ont décidé d'avancer sur l'identifiant d'abord, plutôt que d'essayer de trancher le débât
        - Mais il est relevé que le croisement automatisé des deux peut être ardue : le référentiel annexe de géométrie et le référentiel avec le point mais parfois on a des éléments qui ne sont pas assez discriminant pour relier un point et la géométrie associée.
        
2. Autre aspect positif : le MDD est simple, pas trop générique : un bâtiment appartient à un immeuble qui contient des logements. C'est simple. Il prévilégie l'utilisabilité du référentiel.
- Ne peut-il y avoir d'immeubles ou de bâtiments construits à cheval sur 2 communes ? d'où une cardinalité 0-n à compléter entre les tables immeuble et commune.
    - Si ça existe 
    - Ce qui est intéressant de le côté point, on ne rentre pas dans le détail de géographiquement est ce qu'on a deux communes de rattachement. Il y a une instruction de rattachement administratif du point et même si spacialement la géométrie peut être à cheval, ce n'est qu'une question secondaire pour le référentiel. Ce n'est pas le spatial qui répond mais le rattachement administratif et l'attributaire.
    - un point n'est que sur une commune? Non, en l'absence de rcpu il peut être sur deux, et plus souvent qu'on ne le pense.

3. Quel est le lien avec les parcelles ? 
    - Côté pragmatique - ils laissent de côté les aspects qu'ils ne savent pas gérer. Mais finalement ils font le lien avec les équipes cadastres via la table immeuble. Ils ont intrinséquement fait cohabiter deux éléments qui se ressemblent mais ça fonctionne quand même.

4. Sur la relation immeuble / local / immeuble : 
    - Positive, tel que c'est présenté ils ont un objet physique qui est le bâtiment et ils le font entrer dans un immeuble avec des logements qui y sont rattachés à l'immeuble mais PAS aux bâtiment. C'est malin car dans le cas de la maison pavillonaire : un logement dans un immeuble qui est rattaché à un bâti. C'est l'immeuble en tant qu'ensemble de logements --> pour moi aussi, ça résout plein de problèmes. C'est ce qu'il y a déjà peu ou prou dans les fichiers fonciers --> totalement d'accord. On fait sauter un mur porteur dans une rénovation et ça marche quand même
    - La différence entre un immeuble et un bâtiment : l'immeuble est un ensemble qui regroupe plusieurs locaux, sans représentation physique. Cela ressemble à la propriété bâti dans les fichiers MAJIC français. Si on prend une barre d'immeuble type HLM, avec 3 cages d'escaliers type A, B, C alors on a 3 bâtiments intégrés à un immeuble. C'est un méta-objet avec 3 objets dedans. 
        - Point d'attention : ce n'est pas le sens commun des termes.
        - Autre point d'attention : Si on ne sait pas diviser ni ou sont les murs porteurs, alors la définition ne correspond pas. On est dans des problèmes de granularité et de connaissance du patrimoine bâti. 
        - En cas de non-connaissance : Suggestion de partir sur une granularité de 1_1 en l'absence de l'information - et se laisser la possibilité d'une évolution dans le temps : si on a l'information (un signalement par un acteur), alors on pourra découper et avoir ce rapport de 1_3 par exemple. 
 

    - Bien-fonds et immeubles : *Les immeubles, dont font partie les biens-fonds, qui sont enregistrés dans le RegBL fédéral sont repris des données de la mensuration officielle et du registre foncier. Lors de mutations, il arrive que les nouveaux numéros ne puissent pas être transmis immédiatement au RegBL. Dans ce cas, le numéro provisoire peut être saisi. Les numéros d’immeuble sont exclusivement utilisés pour améliorer l’identification des projets de construction, des bâtiments et des logements. Les informations enregistrées dans le RegBL fédéral ne sont en aucun cas contraignantes et n’ont aucune valeur juridique" --> l'immeuble n'est pas défini dans le Reg-BL lui même, mais l'immeuble est bien l'équivalent d'une donnée cadastre DGFIP pour nous.

Sur la relation entrée-logement au sein du bâtiment : 
- Bâtiment peut avoir plusieurs accès, plusieurs entrée. Avec la possibilité de spécifier directement que tel logement à telle entrée. Donc l'attribut de l'adresse (ID Adresse) est reliée à l'entrée directement. Donc un bâtiment doit avoir 1-n entreée / adresse. Mais ça implique que la gestion des adresses est très bien faite et le lien entrée / logement est cohérent pcq il ont unebase adresse hyper propre. 
- Mais en garde de vouloir a tout prix vouloir rentrer et saisir tous les attributs pour le logement. En suisse c'est très riche et on sait qu'on a des opérateurs qui veulent la sous-composante adresse qui peut aller jusqu'au logement.
- La relation entrée-logement est particulièrement problématique dans les grands ensembles d'habitation (villes nouvelles). Pas évident à saisir comme info (et par qui).--> Un logement direct vers une entrée est problématique car c'est difficile de caractériser directement la bonne entrée de tel logement. En effet, dans les villes nouvelles ce sont des résidences complexes étendues et sur plusieurs niveaux : quand on recoit une demande de secours pour accéder le plus rapidement à un logement,ce n'est pas systématiquement plus rapide se présenter à l'entrée de l'immeuble la plus proche du logement (par rapport au sol). Donc intéressant d'avoir accès aux logements donnés par rapport à une entrée. C'est pour ça que sur ces grands ensembles qu'on a besoin d'avoir des plans spécifiques. Mais on ne sait pas qui doit la saisir et comment on va le faire. 
    - Attention : en tant que commune (faisant autorité sur l'adresse) on se sent pas du tout de compléter ces informations. Pcq immeuble = propriété privée : on y va pas. La commune fait la dénomination des voies proprement et l'adressage exhaustif (montée en qualité par rapport à l'existant)- mais aller au dela pour faciliter l'identification des PDL dans les logements c'est compliqué. C'est de l'ordre de la propriété privée - c'est constitutionnel. Dès qu'un logement n'est plus visible, on ne peut pas y remonter en tant que commune.Ce qui est visible de l'extérieur est possible mais sinon ce n'est pas aux communes de le faire. Une CL peut avoir des informations mais est ce qu'elle a la légitimité de les partager c'est un débat. 
    - MAIS ça pourrait être collecté par d'autres biais. Le modèle suisse permet visiblement cette saisie en tous cas.
    - Qui ira remplir cette information ? Il faut un débat mais les SDIS ou services de secours (selon leurs moyens) = relation logements-accès immeuble. Ou autre biais ou acteur, par exemple les fournisseurs de réseaux. 
    - Par contre angle d'attaque des secours quand il faut faire des évacuations - c'est un bon angle pour collectivement mettre de l'information de référence dans une donnée qui a une vocation opérationnelle
    - On sent que tout le monde a envie de progresser sur la connaissance des données mais il faut trouver le modus opérandi pour décrire tout ça. 

- Pour les services de secours, outre le bâti et son adresse admin, ce sont ses accès qui sont opérationnellement importants, chacun de ceux-ci pouvant se placer sur plusieurs communes. Du coup la relation entrée-tronçon-rue-commune brosse répondait au besoin d'identification.
    - oui : tout-à-fait : j'y pensais aussi : l'entrée par la port de derrière est gérée

- Vu les enjeux de la base au niveau de la population. La typologie simplifiée de l’usage du bâtiment (avec logement d’habitation ou pas) est interessante.Ca a un sens sur la répartition de charges pour les gestionnaires de parc : certaines se font à l'immeuble et d'autre au bâtiment (sachant que plusieurs bâtiments peuvent être intégrés à un immeuble). Ex: les charges de rénovation d'une toiture sont pour tout l'immeuble.


## Danemark
- Attention : limite de la traduction compliquée à réaliser

Sur la génèse du projet
- Danemark part du principe que ce sont bien les propriétaires qui sont tenus de faire remonter de l'information sur le cycle de vie du bâtiment.- Différents statuts du bâtiment possible qui reflètent le cycle de vie du bâtiment.
- Le prisme de départ est bien le calcul de l'assiette du foncier (contrairement à la Suisse où le point de départ était le recensement de la population)
- La motivation pour les individus est bien d'avoir une description la plus fine possible pour être taxée correctement.

Sur le cycle de vie du bâtiment, peut on s'en inspirer?

- Quid du cycle de vie & du statut : il y a différent statuts qui pourraient varier selon ce qu'on décide de mettre dans le référentiel français ? 
- On a prit le prisme ADS dans la V0 du MDD mais est-ce qu'on élargit les évènements qui peuvent faire évoluer le statut au délà de ADS ? 
    - Par ex : Rénovation centre ancien (parties communes des immeubles qui tombent en ruine): clé qui vient perturber le cycle de vie - donc le dossier est passé devant des instances et donc est ce qu'on peut dire que l'immeuble est en travaux ? 
    - Par ex: Arrêté de péril si un immeuble a brulé ?
    - Participant : Je suis d'accord : il faut évidemment prendre en compte d'autres thématiques - dans les premières réunions, l'approche ADS ne faisait peut être pas consensus - car l'ADS est une source mais ce n'est pas le cas d'utilisation principal que l'on donne à ce modèle de donnée
- Dans le MDD, inscrire quelque chose de plus générique que "ADS" et peut-être parler largement d'"évènements" avec une typologie d'évènements / Ce qui fait que le modèle peut être enrichit notamment par exemple avec un arrêté de péril. 

    - Attention, temporiser ce pdv : En effet, ADS est sortie en premier parce que c'est le début du cycle de vie de l'objet, pas pour avoir une vue thématique de l'urbanisme. On construit un référentiel qui doit être partagé par un identifiant. Donc les arrêtés de péril qui doit être interopérable avec les ID bâtiments et logements 
    - Si on prend l'exemple de la BDNB - il y a des tonnes de bases de données thématiques (rénovation, énergétique), on a tous envie de les emmener dans un référentiel central et que ça soit complet et le plus à jour possible MAIS  plus on ajoute d'éléments au référentiel, plus c'est difficile à maintenir.
    - Préconisation: C'est un squelette minimal d'identification de cycle de vie des objets, par dessus lequel les SI thématiques viennent se raccrocher. Ce n'est pas un outil décisionnel. On veut que tout le monde parle le même language mais on ne veut pas avoir une base centralisée macro qui centralise tous les objets.
        - OUI, on veut avoir un squelette avec un minimum d'éléments métiers dedans mais pour autant est ce que l'alimentation du squelette peut avoir plusieurs faisceaux ? Quid du faisceaux par de multiples acteurs pour venir enrichir le squelette ? 

    - Donc est ce qu'on créé une table "évènement" et attention à ne pas mélanger ce qui déclenche vs. le schéma des données lui même : pour clarifier est ce qu'on en ferait pas deux ? 
    - Est-ce qu'il ne faudrait pas d'abord régler le cycle de vie de l'id_bat?
        - Oui, si on prend le pdv de l'identifiant strtict, ce qu'impose INSPIRE c'est d'avoir un cycle de vie de l'identifiant - donc il faut savoir à quel moment un objet est en projet, détruit etc... donc il faut capter les quelques évènements qui donnent des indications sur l'état de l'objet de référence. 
        - L'arrêté de péril par ex, ne remet pas en cause l'existence du bâtiment (il n'est pas détruit, il est juste inhabitable). C'est un attribut entre l'existence réelle ou non de l'objet. L'objet bâtiment est qualifié dans le système d'information des arrêtés de périls des services de l'état avec un code de bâtiment qui vient du RNB. Et si ça aboutit à destruction là on modifie le statut du RNB. Mais ne pas obliger les services de l'état à aller mettre l'attribut "arrêté de péril" dans le RNB avec une désynchronisation temporelle compliquée  sur les arrêtés de périls : exactement, l'objet existe mais ne "sert" plus.
        
- Attention par ailleurs sur ADS, on a plein de permis construire/démolir qui sont "en cours". Donc on ne peut pas tout baser sur ADS et qu'il faut partir sur un évènement générique qu'on qualifie et qu'on type - par ex: achevé, fini, en construction/ en travaux, projet ? 
    - good point. Quel ramasse miette si ADS échoue
    - Est ce qu'on dissocie ça du cycle de vie de l'ID ? Donc plutot de s'accorder sur les différents statuts du bâtiment - est ce qu'on veut 3 états ou est ce qu'on en veut 8 ? Puis réfléchir à qu'est ce qu'on pense qui déclenche cet évènement ?
    - En effet, en pratique 1/4 -1/3 sans DAACT (Rennes) et 3/4 sans DAACT pour Strasbourg (ce qui est problématique au niveau du RIL notamment pour qualifier l'habitation, notamment pour les fichiers qui sont protégés par le RGPD)
        - Un des objectifs de l'expérimentation RUDY à Rennes: créer un cercle de confiance sur les données d'énergie et d'eau pour dire si un logement est occupé ou non. 
- Objectif : Se fixer sur qu'est ce qu'on met dans le statut (sans faire trop compliqué). Mais on verra qu'on aura surement du mal à avoir des bons déclencheurs au bon moment :  projet, en construction/en travaux, achevé et démoli (historisé). Attention à l'écueil des "états" qui sont fondamentalement des vues métiers.

# Focus MDD Bat ID

Sur les boucles relationnelles : 
- Attention car en général on peut les éviter car elles peuvent être source d'incohérence- et pas vraiment présent dans les standards CNIG ou schéma gouv.fr. 
- Est ce qu'on veut conserver l'information par exemple, les liens entre parcelles / ADS puis parcelle/bâtiment. Mais ce lien est un mélange entre une table qui sert de déclencheur ce qui amène de la confusion 
 
- Autre boucle : Sur le local, on parle d'une information au sens fiscal / cadastral. Il est rattaché à une propriété non-bâtie qui rattaché à une parcelle. C'est compliqué car en théorie c'est le lien qu'on aimerait faire mais en pratique difficile. 
    - Comme on a une information déterminante qui vient des FF, un local on sait qu'il est rattaché à la parcelle mais on ne sait pas comment il est ventilé sur les bâtis sur une parcelle. Mais c'est pour ça que ce qu'on fait les suisses avec la notion d'immeuble. 
        - Mais réussir historiquement à ventiler les locaux existants dans le bâtiment on est pas sûr de savoir le faire si ? Même avec la meilleure volonté du monde ? 
        - Modèle suisse permet de représenter l'état des choses correctement : on a des locaux, on sait attributairement où ils sont mais on ne sait pas les localiser dans des bâtiments. Est ce qu'on a envie de casser le plafond de verre pour réussir à localiser les logements dans les bâtiments ? Peut être que la structure suisse est bonne ?
        - D'ailleurs : doit-on mettre les locaux dans cette v1.0 d'un modèle "bâtiment" ?

    DGFIP : notre SI ajd gère la notion local / parcelle mais gère mal la notion de bâtiment. Notre objectif pour les constructions a venir c'est d'identifier correctement la notion d'immeuble / bâtiment/ local et associé à une parcelle et une adresse. Sur le stock c'est un autre défi - mais si déjà on arrivait à faire ces liens là sur le flux ça serait bien. Pour le stock on verra ensuite quels travaux pourraient être menés en se projettant sur la gestion du flux. On va se projeter d'abord sur la gestion du flux. 
    - C'est l'occasion via Bat-ID de mettre en place des fluxs consolidés. 
   -  J'adhère sur cette vision. on a une entrée très foncière en France qu'on souhaiterait donc minimiser progressivement ? Actuellement entrée locaux est sur la propriété foncière (à la parcelle) donc déjà si on gère le flux sur le futur modèle de données et c'est super intéressant. 
- Donc dans le MDD il faut se donner la possibilité de faire le lien local bâtiment. Mais ça explique de laisser les locaux dans la V1.0 - MAIS si on se projette et qu'on se dit qu'on va les rentrer dans les SI alors oui effectivement il faut que l'objet local soit dans le MDD du bâtiment. 
- Dans les locaux de la DGFIP : on a les qualification des usages ? OUI, chaque local est bien typé en tant qu'habitation. Le bâtiment peut en plus avoir plusieurs usages. 

Sur le concept d'adresse / entrée
- ID entrée et ID adresse : aujourd'hui on a une clé d'interopérabilité de la BAN mais comme elle n'est pas exhaustive que faire : Maël : l'adresse doit être a minima dans ça - si on veut remettre de la donnée gérée ailleurs c'est compliqué à maintenir pour mettre en place des choses compliquée. Il vaut mieux mettre le minimum "j'ai une référence à une adresse en stockant de l'ID Ban"
 ET S'IL MANQUE UNE ADRESSE Dans le référentiel, faire un signaelement à la BAN qui va impliquer que la commune créée une nouvelle adresse et qui pourrait gérer les multi-positions (même si elle ne le fait pas pour le moment). Il vaut mieux aller chercher une adresse, quitte à ce qu'elle soit mal typée dans la BAN et faire un signamelement. 
 Chaque référentiel est souverain dans son MDD - le reste montrer que c'est des liens vers des référentiels externes on mentionne en disant qu'un ID vient d'ailleurs.
 Cas à Rennes : immeuble avec 4 entrées et 3 adresses typées automatiquement et 1 a un point mal positionné et il n'est pas typé bâtiment. Donc si on l'utilise ici, il y aurait une forme d'alerte automatique qui créé des signaelment automatiquement dans la boucle de rétro
 ÇA VEUT DIRE : MDD (99) qu'on fait vivre on va faire référence au dictionnaire de base adresse : non mais juste ban_id + date ajout + type - pas plus d'info stockée dans le référentiel bâtiment. 
 Couleur ou forme différente pour comprendre qu'on va le chercher dans d'autres SI. 
 
 
 Sur les enveloppes : 
 - X bâtiment est rattaché à X enveloppe de X source. Enveloppe bâtiment c'est la géométrie ? en fait c'est l'immeuble, oui - Dans les specs INSPIRE il y a classe Géométrie. Donc est ce que le terme enveloppe n'est peut être pas adapté ? 
- Est ce que la géométrie peut être plus large que le découpage du bâtiment en propre ? Donc la vision suisse c'est immeuble. On a une géométrie qui est ce qu'elle peut et on a un immeuble. Sauf que pour "immeuble" on a la mensuration officielle
- MAIS est ce qu'on a besoin de mettre ça dans le MDD ? Si ces différentes enveloppes vont mettre les IDBat dans leurs propres base de données qui contiennent leur propres enveloppes ? Ce n'est pas le gestionnaire du bâtiment qui va créer les géométries ... MAIS si on ne met pas l'enveloppe dans le référentiel on reste dans la situation actuelle. 
- Est ce que c'est en le mettant dans le modèle qu'on résout cette situation ? Ce n'est pas plutot une question de bonne pratique ? C'est un paris risqué
- D'un pdv pragmatique - il est important de rattacher à une géométrie même si conceptuellement c'est pas aussi cohérent. 
- DGFIP : notre objectif c'est bien de pouvoir faire le lien entre l'ID Ba^tiement et la représentation graphique sur le plan cadastrale (enveloppe) - différentes possibilités : emprise au sol, plan de masse, emprise au toit. Plusieurs formes géométriques qui peuvent y être associée. Dans le flux c'est important de faire le lien avec l'ID Bâtiment et l'ID d'enveloppe. Mais du coup c'est celle de la géomatrie du bâtiment dans le plan cadastrale ? Oui ça peut être celle là - MAIS au moment où il y a l'instruction de l'ADS et eux sont près à mettre les plans de masse + la géométrie lorsqu'il y a un levé sur le terrain effectué OU prise de vues aériennes de l'IGN ou les leurs. Il faut des attributs pour expliquer l'origine de cette représentation. 
- On peut aussi ajouter les géométries issues du BIM par ex. L'idée de rassembler ces bases de connaissances à partir d'un identifiant commun = ID bâtiment.
- ID enveloppe = pointe vers l'enveloppe de la source IGN / source ADS / source DGFIP : c'est l'ID source qui est l'ID du producteur et l'ID enveloppe est l'identifiant technique
- Enveloppe pas le plus approprié - donc plutot géométrie 
- Dans la BDNB , on l'a appelée "construction" - après 15 jours de discussions et d'attermoiements.
    - On ne parle pas de la même chose : plutot un regroupement (bâtiment collés les uns aux autres qui sont dans un immeuble)
- je +1 pour parler de "géométrie" sans plus de détails

- Jean Roc : Pose bcp plus de question que l'on a de réponse. Mais je vois de moins en moins comment nous au niveau de la commune je peux pas me dire je pars sur la base des FF, PCI vecteur. Là au niveau du MDD je suis d'accord avec ce qui a été dit avant (111), la partie ID du bâti - je ne vois pas comment je pourrais le générer avec un niveau de confiance. 
- Il y a eu des expérimentations avec d'autres collectivités : besoin d'avoir un retour. 
- Cas général - travaux de la BDNB du CSTB qui sont ouverts et qui permet d'aboutir à un socle qui devrait pouvoir s'imbriquer dans le MDD qui est présenté ici. pour proposer le découpage du parc avec différents flux de consolidation pour représenter la réalité.
- Je peux disposer d'un fond vectoriel proche de la réalité et comment je réconcilie ça avec des bases tierces pour générer un identifiant qui pourrait être partagé par les intervenants. - la question se pose quand quelqu'un va devoir s'y coller. Bcp de jeux de données qui ont tous des avantages et des inconvénients. Pour la BAL on est descendu à la commune. Donc si un jour où on se pose à l'identification des bâtiments - est ce qu'on arrive à l'échellon communal ou intercommunal et là je n'identifie pas du tout comment en respectant la définition. 
- Mise en oeuvre pratique - besoin fort !
- Modèle suisse c'est intéressant le lien entre les bâtiments et les logements c'est central - ce cas d'usage est intéressant. 
- Envoyer les liens dans le doc : 


A faire pour prochaine session : 
- Discussion sur l'expression de l'ID unique (1h27 + modèle suisse) à communiquer en amont du GT
- Interlocuteurs niveau EU sur le contenu du règlement d'application
- s'accorder sur les différents statuts du bâtiment - est ce qu'on veut 3 états ou est ce qu'on en veut 8 ? Puis réfléchir à qu'est ce qu'on pense qui déclenche cet évènement ? Proposition : en projet, en construction/en travaux, achevé et démoli (historisé)