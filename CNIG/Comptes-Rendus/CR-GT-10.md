# GT Bati CNIG 10 05-07-2023

**Date:** 05.07.2023

- [Lien vers prise de notes collaboratives via HedgeDoc](https://demo.hedgedoc.org/V4BS4EEySseL_AY0ZhGkBA?both)
- [Lien vers le support Mural pdf](CR-GT-10-support-Mural.pdf)
- [Rappel - Lien vers la définition & annexe](https://github.com/fab-geocommuns/BatID/tree/main/CNIG)

**Participants:**

- Loic Rebours (ENEDIS)
- Marina Fages (DGFIP)
- Régis Haubourg (CSTB)
- Pascal Schetelat (CSTB)
- Julieta Barado (DGALN)
- Olivier Lefebvre (INSEE)
- Benoit Génot (URBS)
- Alison Lenain (IGN)
- Sebastien Wehrlé (Eurométropole de Strasbourg)
- Frédérique Williams (BAN/IGN)
- Yélise Akol (IGN)
- Vincent Masson (IGN)
- Pierre Martin (Grenoble Alpes Métropoles)
- Thibaud Le Dorze (Géovendée)
- Marina Fages (DGFIP)
- Loic Hay
- Mael Reboux (Rennes)
- Stéphanie Alibert (Toulouse)
- Arnaud Gallais (CEREMA)
- Maximilien Brossard (URBS)
- Elisabeth Talbourdet Ville (Bat-ID)

## Points clés

- Ressort un intérêt et une volonté de construire un MDD commun bien interopérables entre les concepts de bâtiments et d'adresses. Une première version a été proposée et débattue lors du GT.
- Il existe des enjeux sur le périmètre d'actions de chacun des acteurs afin de déterminer auprès du qui doit peser la responsabilité de réaliser le lien entre les concepts.
- Il semble émerger que la relation adresse - bâtiment est à stocker du coté du référentiel du RNB.
- Le concept d'entrée (relation intermédiaire entre l'adresse et le bâtiment) est encore en question.
  - Il semble nécessaire pour le cas spécifique des zones de constructions privées auxquelles la commune en charge de l'adressage n'a pas accès depuis la voirie.
  - Une possibilité serait de rendre ce champs "d'entrée du bâtiment" optionnel au moment de la détermination de l'adresse.
- D'autres cas spécifiques restent à traiter sur le lien adresse bâtiment.
- Il ressort qu'il est crucial de se concentrer sur la valeur apportée aux utilisateurs (cela passe entre autre par la nécessité de coordonner les différents outils à destination des utilisateurs finaux).
- Échange complémentaire sur le lien local-adresse et local-bâti

## ODJ

- Actualités sur le projet Bat-ID
- Loïc Rebours, retour sur le GT Adresse, et proposition de MDD commun adresse-bâti
- Pierre Martin - Grenoble Alpes Métropole, retour d'expérience d'une métropole sur l'utilisation de la relation bati-adresse

## Notes de la réunion

### Informations générales sur le projet Bat-ID

- Nouveau sponsor dans la Startup d'Etat : la DGALN, en appui pour les évolutions de réglementation, la DGALN, les DPE et les déclarations RE2020 \o/

- prochaine réunion à la rentrée :
  - présentation du processus d'alimentation du RNB
  - démarrage de la rédaction du standard bâti & modèle de donnée

- le site rnb.beta.gouv.fr est lancé, avec un référentiel intialisé France entière : accès à l'interface cartographique et différentes API :
  - API ADS : dédié aux services d'instruction des communes
  - API générique Bat-ID

- expérimentation d'intégration de l'ID batiment dans les outils de diagnostics DPE

- outil de gestion ADS pour les communes rnb.beta.gouv.fr/ads (prototype pour préfigurer l'intégration aux outils ADS par les éditeurs)

![](https://s3.hedgedoc.org/demo/uploads/a59ab8ca-3fef-46d7-aed7-3a8ef4eee47e.png)

- Démontrer la faisabilité de l'ajout d'un ID bâtiment dans le flux d'ADS, et préfigurer les évolutions réglementaires associées

- Outils à venir à la rentrée, rapprochement de bases locales pour attribuer des ID en masse.

- Deux recrutement en cours, grâce à l'arrivée de la DGALN

### Standard Adresse-Bâti (Loïc Rebours)

![](https://s3.hedgedoc.org/demo/uploads/0ff0c363-d07e-4991-96bd-795f593ef1fa.jpg)

Travail actuel dans le standard adressee est de créer un cadre pour l’adresse en France, en officialisant l’adresse BAN, mais pour les objets bâtiments ça nous permet d’aller au-delà, notamment avec le « complément adresse » :

- Tout est en mode « brouillon » côté standard, même si le modèle converge plutôt vers une v1

La partie Bleue est la partie ‘Standard Adresse’ avec l’objet Adresse BAN qui a des composants systématiques et quelques composants complémentaires.

La partie Violet : Le bâtiment est un contexte d’attribut et d’objet, il y a des liens avec la parcelle, locaux et filiation de bâtiment. Ce qui est important de comprendre est qu’il peut y avoir une ou plusieurs adresses qui sont associées au bâtiment.

- Ces entrées / adresses de bâtiment sont des adresses BAN idéalement, sauf dans le cas de sites privés où il y a besoin d’un complément, que l’on appelle « bâtiment » qui ne figure pas aujourd’hui dans la BAN.
- Si on veut gérer proprement certains bâtiments, on est obligé d’ajouter un champs spécifique pour expliciter la notion d’entrée et/ou d’adresse de bâtiment représente à la fois un ID BAN et un complément d’adresse.
- Modèle en cours de construction dans le GT Bâtiment
- L’important est l’articulation entre le Bleue et le Violet et de partager la même structure.
  - Il faudrait mettre des couleurs pour clarifier les "packages" de source de données pour la gestion des données.

- Explications sur le champs "complément d'adresse" qui est un champ un peu "fourre-tout" qui apparait dans le modèle standard adresse :
  - Si on a un 6A, 6B, 6C qui correspondent à 3 bâtiments sur une parcelle :
  - Sur le complément d'adresse qui apparait c'est l'adresse, le 6"A" est dans l'attribut suffixe de numéro et correspond à l'entrée de bâtiment des deux côtés.
  - L'attribut "A, B, C & D" est un attribut d'adresse dans la BAN et ça correspond à 3 bâtiments distincts.
  - Mais il y a des cas où dans les zones privées closes, on a que le "6" et à l'intérieur s'il y a plusieurs bâtiments qui sont appelé "A", "B", "C" on le retrouvera dans la table bâtiment.
  - On est d'accord que dans la majorité des cas, ce 6A sera dans la BAN et le complément adresse sera inutile - mais c'est vraiment nécessaire dans le cas de la voie privée.
  - Il faudrait peut-être mettre ces cas en avant dans le schéma.
    - Selon moi il faudra que le suffixe de la BAL corresponde à la numérotation fficialisée par les communes 15B ou 15 bis et le complément de la BD Bati pourra inclure Batiment C ou batiment + "NOM"

- Comment on articule les ID BAN avec les Bat-ID ?
  - Pour un ID Bâtiment, il pourrait y avoir au moins 1 adresse, potentiellement N. Il y aura donc un ID BAN (ou plusieurs) en face.
  - On articule bien via les ID l'ensemble des attributs côté bâtiment et côté adresse.
  - Cas caricatural : dans la BAN on a qu'une adresse de portail clos fermé. Quand on parle de position dans la BAN on aura qu'une seule position "adresse" qui correspond au portail.
  - Mais si à l'intérieur j'ai 5 bâtiments, alors j'aurais une seule adresse et 5 compléments d'adresse complète. Le modèle essaie d'expliciter les deux cas.

- A terme : peut on imaginer que l'outil "mes adresses" puisse permettre aux communes de venir attribuer la position bâtiment orphelin d'adresse ?
  - Ça serait une évolution envisageable (Frédérique), il faut en parler avec l'équipe.

- Comment le référentiel des PDL va intégrer le RNB ?
  - Loic : On a actuellement 3 discussions à ENEDIS : BAN, RNB, RIAL.
  - Il y a besoin de cohérence entre les 3 référentiel pour avoir une adresse du lieu de service, et si possible ne pas avoir 3 apparaillements avec le RIAL, RNB et la BAN.
  - D'où l'importance de structurer les données et les concepts.
  - Pour l'instant, ENEDIS n'a pas bcp d'identifiants disponibles : la BAN n'en a pas encore, le RNB est peu mature, et le RIAL n'est pas sorti.
  - Mais on a les PDL qui sont géolocalisés et il y a pleins de travaux de confrontation à mener.

- Sur un autre croisement possible avec le RNB : comment on fait pour intégrer le RNB à l'intérieur du référentiel des points de livraison ?
  - On a trois ID à intégrer : RIAL, RNB, BAN.
  - On pose des bases aujourd'hui qui vont nous permettre d'aller plus loin. Pour l'instant on a peu d'identifiant disponibles ... on a les identifiants métiers des PDL géolocalisés qu'on peut relier. Pleins de travaux de confrontation seraient à mener. On aurait besoin d'une vue métier en cours de relecture pour savoir comment on s'y prend pour identifier les besoins des gestionnaires de réseaux.

- Quid de mettre une position optionnelle des entrées dans le modèle de données du RNB ?
  - L'entrée du bâtiment, dans le temps ce serait pertinent de montrer une position même optionnelle et faire les relations proprement avec les concepts d'adresse.
  - On avait dit dans les anciens GT: le travail de montée on a un bâtiment qui est découpé ou non entre parties de bâtiment. l'état de l'art serait déjà de faire un lien entre le bâtiment et une adresse qui est dans la BAN.
  - Parce qu'après la question de positionnement est sensée être côté adressage pour aller positionner un point "bâtiment" sur un bâtiment.
  - Donc il faut plutot partir sur cet horizon là.

  - Réponse Loic : La réalité aujourd'hui c'est qu'il y a une partie où on est sur un territoire ouvert prévu par la loi 3DS et là où c'est pas possible c'est sur les zones privées où la commune ne peut pas aller.
  - Donc si on se dit qu'on a des adresses qui quelques fois ont des "compléments" en violet, lorsqu'on est dans un cas privé.
  - C'est plus par prudence sur ce cas particulier de voie privée qu'il faut introduire cette notion "d'entrée" optionnelle.  

- Au delà du concept, ce qui ne figure pas dans le schéma c'est qui fait le lien entre les bâtiments et les adresses ? Où est fait le lien entre l'un et l'autre ? Est ce que c'est la commune ?
  - Le référentiel BAN et BAT sont archi transversent.
  - Dans les mises en oeuvre de référentiel, aujourd'hui: On se prépare à "quand je gère un bâtiment j'associe une adresse" donc l'association Bati-Adresse se fait plutot côté RNB.
  - Après y a des informations un peu redondante, mais ça peut faire des moyens de contrôle et de cohérence entre les modes de saisies.

- Pour le stock, quid ?
  - Est ce qu'on peut se dire qu'il y a une situation où une commune remplie pour la première fois sa BAL, le stock d'ID-RNB ont été identifié, et au moment où on complète sa BAN, on leur permet d'identifier directement le stock prédéfini d'ID RNB?
  - Il faudrait que dans la manière dont ça pourrait se faire - notamment selon les outils (ex. grosses communes avec son gros SIG) (ex. petites collectivités qui s'appuie sur mes adresses avec la secrétaire de mairie).
  - Majorité des collectivités en France c'est les cas petits.

- Pour l'initialisation : quelle importance on met sur la cohérence des référentiels émergents (RIAL & RNB)?
  - Si on veut faire des choses qui soient le plus cohérent avec le RIAL, ça peut amener à faire évoluer des informations de complément d'adresse sur le bâtiment.
  - Pour les gestionnaires de réseaux : Sur tout ce qui est raccordement, notamment sur tout ce qui est nouveau bâti et l'évolution de l'amménagement - il y a des gros enjeux (notamment sur l.
  - Si on veut une correspondance entre les deux il faut avoir des outils permettent d'interagir avec les identifiants de chaque base en face.
  - Pour l'exemple suisse, le tryptique logement-bâtiment-parcelle du point de vue de l'utilisateur ne fait qu'un. Il faut qu'on trouve des pont d'interopérabilité pour pouvoir trouver des adresses BAN depuis une appli tiers ou requeter des adresses BAN. Il faut que ces référentiels puissent être modifiés et que ça soit unifié dans les applis et les outils développés. Il faut vraiment réfléchir aux utilisateurs et faire en sorte que ça ne soit pas séparé pour eux. Il faut vraiment être coordonnés sur les outils
  - On sait faire : Il faut se mettre d'accord sur les services que chacun met à disposition pour s'assurer que l'interopérabilité vienne jusqu'aux utilisateurs.
  - Il faut surtout éviter qu'on ai de la réconciliation à faire parce que l'information est en doublon dans les deux référentiels, avec deux sources de référentiel - qui porte cette relation ? Si elle est portée par les deux il y aura des conflits (de mise à jour).
  - Donc il y a un sujet où la table relationnelle doit être à endroits.
  - Et idéalement ça doit être porté par le RNB

- Loic, question sur le MDD bâtiment : Code INSEE commune - ce n'est pas anodin, au bâtiment je vais avoir des adresses associées. Donc si on fait un lien avec une commune en propre dans le RNB, est ce qu'on a un risque qu'il y ai plusieurs éléments mis ?
  - On retrouve deux fois la commune et il faut bien voir pourquoi on l'a deux. Mais est ce que du coup on pourrait faire apparaitre la commune comme "gestionnaire" dans un modèle conceptuel ? Juste pour se distancier de l'adresse
  - Egalement parce qu'il y avait beaucoup de discussion sur la signifiance ou non de l'ID mais dès lors la commune doit faire partie des attributs pour faire des filtres facilement. Si c'est que cette deuxième partie cela pourrait être redondant avec un composant de l'adresse.
  - Si c'est le premier cas il faudrait expliciter la relation 1-N sur la/les communes.

- Sur la relation adresse-bâtiment : Les entrées si on a un bâtiment collectif avec 8 entrées : est ce que la relation adresse se fait avec 8 entrées avec chaque adresse reliées à son entrée.
  - Ça dépend de ce qu'il y a dans la BAN (parfois il y a une seule adresse). Il y aura plusieurs numéros BAN liées à plusieurs entrées reliée à un seul bâtiment. Les points adresses BAN ont tous une localisation qui n'est pas celle de l'entrée.
  - La géométrie de l'entrée doit être portée par l'amélioration de la BAN plutot que par le RNB. Donc on renonce aux géométries complémentaires - dans les sites privées notamment.
  - Ce serait bien qu'on ai un schéma sur ces cas là
  - Si on perd les points d'entrées et qu'on a des bâtiments --> il faut qu'on puisse progresser d'une manière ou d'une autre. L'idée d'éditer une adresse avec un type de position "entrée".
  - Risque : point centroide du bâtiment avec une liste d'adresse. Mais ce que dit Mael, c'est que c'est le reflet de la réalité de la donnée disponible actuelle. Mais pour que ça soit complété, il faut que la commmune améliore son adressage avec des processus de signalements (notamment par ex. le fait d'avoir un retour des pompiers).
  - Commune est souveraine - sauf dans les zones privées - mais c'est très hétérogène.

- Quid du lien avec les locaux DGFIP qui portent des adresses?
  - Les adresses contenus dans les locaux c'est là où sont envoyées les fiches d'imposition. Attaché à un local il y a une adresse d'imposition à laquelle on envoit un avis d'impot. On a tjrs une adresse attaché à un local. et même plusieurs adresses dans l'absolu. Et quid de cette relation adresse avec les locaux ? Pour les besoins propres de la DGFIP on a besoin d'une adresse attachée à un local. Ca permettra de faire des contrôles de cohérence même s'il y a plusieurs niveaux de relation.
  - Cible DGFIP : dites le nous une fois pour les communes qui alimentent les BAL et qui deviennent l'alimentation seule et unique alors qu'aujourd'hui par ailleurs les collectivités doivent aussi avoir des informations sur la voirie. Donc la cible c'est que la DGFIP vienne récupérer les informations directement dans la BAN et dans le cadre de ces travaux, ils sont en train de faire une comparaison des adresses BAN & DGFIP pour fiabiliser le stock d'information que l'on a.

### Intervention Grenoble

- Si on prend le cas de ce qu'il y a dans la BAN : adresse qui dessert des parcelles et descendre au niveau des bâtiments. Ca serait déjà très satisfaisant.
- Exemple de l'école : Logiciel de patrimoine n'avait qu'une seule adresse pour une école - alors qu'il y avait en réalité 3 autres adresses disponibles.  
- Problématique budgétaire avec des rattachements de contrats téléphoniques - alors qu'il y a plusieurs adresses et on ne peut faire des croisements de données. On a par exemple des contrats téléphonique sur des bâtiments qui n'appartiennnent plus à la collectivité.
- Grenoble : 1 adresse qui met au niveau des tronçons, 1 adresse qui est mise sur le bâtiment et une dernière adresse pour faire des plans pour éviter les chevauchements.
- Tous les bâtiments de Grenoble ont des adresses qui correspondent à l'adresse BAN - et il ne manque plus que le lien avec le Bat-ID. Une des premières problématiques était qu'il n'y avait pas de définition d'un bâtiment. Donc déjà avoir imposé aux métiers le standard CNIG, c'est une bonne avancée.
- Sur le stock comment c'est envisagé ? À l'échelle du territoire de la métro il y a des collectivités plus ou moins avancées. Il y a un administrateur SIG qui suis les ADS et intègre les plans masses dans le SIG et ensuite ils valident les retours que la DGFIP. Par contre il y a des collectivités où il n'y a rien.
- Est ce qu'il ne faut pas mettre des outils simples et des process au niveau des communes pour déterminer l'emprise ?
- La première partie où on essaie de lancer du lien entre ID bâtiment et ADS.
- OSM : localiser ma porte d'entrée. Mais attention car les habitants n'ont pas de réalité communale.
- RIL : si on a le Bat-ID parce qu'il a été créé au travers de l'ADS - le RIL il vient à la fin et il s'alimente de tout ce qui est fait en amont. Point d'attention : Le RIL n'existe que pour les communes de plus de 10000 habitants.
- Perso, je retiens des discussions importante sur les mises en oeuvre Mais globalement on est plutôt d'accord sur les concept/articulation des données : je pense qu'il faudra travailler une vue "simplifiée" dans le doc de standard Adresse pour illustrer/éclairer. Et on aura encore du travail/des échanges  sur la mise en oeuvre des BAN/RNB/RIL/RIAL...
- A vous entendre : c'est un petit standard de dépose d'une ADS qu'il faudrait  ! (avec un outil pour ceux qui veulent faire la déclaration ?) (sur un sujet similaire, on a résolu ces sujets sur DT/DICT depuis qu'on a structuré les collectes)
- Mael sur retour sur le RNB :

![](https://s3.hedgedoc.org/demo/uploads/b1550376-c2e5-4153-a944-d2cd11a7a69f.png)
![](https://s3.hedgedoc.org/demo/uploads/9e0fc149-f0ae-4c1b-857b-0d711fa373f9.png)
