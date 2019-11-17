---
layout: post
title:  "Themis, un Building Operating System (BOS)"
date:   2019-11-17
author: alex
lang: fr
ref: themis bos opensource
categories: [themis]
---

THEMIS est un réseau de monitoring NON INTRUSIF orienté performance énérgétique du
bâtiment, qui utilise le logiciel [EmonCMS](http://github.com/emoncms/emoncms) comme grapheur et comme stockage de données.
EmonCMS est une base de données NoSQL dédiée au monitoring temps réel à base d'objets
connectés. Son code est opensource.

Le schéma ci dessous représente l'architecture générale de l'écosystème THEMIS, avec au centre un routeur 4G smartflex....

![architecture d'un réseau de monitoring themis]({{ site.baseurl }}/assets/themis/ecosysteme_version1.png){:class="img-responsive"}

Cette architecture permet de travailler avec deux types de fréquences radio : 868 Mhz et 169 Mhz et offre la possibilité de se raccorder à un bus industriel de type RS485, que l'on
rencontre fréquemment dans les chaufferies gaz des bâtiments tertiaires, ce qui fait de THEMIS un agrégateur de données puissant, bénéficiant de la redoutable efficacité du protocole MQTT (Message Queuing Telemetry Transport). 
Grâce a La bande 169Mhz, THEMIS est en mesure d'équiper des bâtiments de taille importante avec des capteurs sans fil.

Sur un bâtiment voire sur un ensemble de bâtiments, THEMIS est capable de rassembler au sein d'une même base NoSQL de données chronologiques 
une bonne partie de ce qui est mesuré par les capteurs existants et de rajouter d'éventuelles informations manquantes. Le but est de capitaliser le recueil de données, afin d'offir une matière numérique cohérente 
à des algorithmes intelligents permettant de quantifier le comportement du bâtiment et d'en optimiser la gestion énergétique. 

THEMIS offre une importante variété de mesures : température intérieure et extérieure, hygrométrie, CO2, puissance électrique instantanée, impulsions gaz, comptage de chaleur... 

![Themis in da box]({{ site.baseurl }}/assets/themis/themis_in_a_box.png){:class="img-responsive"}

Capable de simuler les pertes thermiques par infiltration pour un bâtiment, THEMIS peut réaliser de façon automatisée le calcul d’un coefficient Ubat "terrain" (coefficient de déperdition d’une enveloppe) pour conduire des études de performances énergétiques analogues à celles menées dans le cadre du programme PREBAT (Programme de recherche et d’expérimentation sur l’énergie dans le bâtiment, initié par le plan climat 2004-2012 du gouvernement français).

![simulation des pertes par infiltrations]({{ site.baseurl }}/assets/themis/INFLOSSES.png){:class="img-responsive"}

La mise en œuvre sur le terrain et le système ont été expérimentés lors d’une opération menée par le bailleur social Allier habitat, avec des mesures effectuées durant un an sur trois habitations de type pavillonnaire afin d’évaluer différentes techniques d’isolation thermique par l’extérieur.


![suivi des consommations énergétiques]({{ site.baseurl }}/assets/themis/Energy.png){:class="img-responsive"}

Vu la précision de son monitoring, THEMIS permet sans effort de faire le distinguo entre ce qui relève des usages et tout ce qui est propre au comportement du bâtiment, comme on le voit sur l'illustration suivante, où l'on 
identifie d'un seul coup d'oeil les consommations énergétiques dues à l'utilisation d'un climatiseur.
![simulation des pertes par infiltrations]({{ site.baseurl }}/assets/themis/Energie_ConfortTRH.png){:class="img-responsive"}

Pendant les périodes d'été, THEMIS sait faire le calcul de l'humidité absolue et permet de produire des diagrammes psychrométriques faisant apparaître les pourcentages hors du polygone de confort.

![psychrometric diagram]({{ site.baseurl }}/assets/themis/psychrometric.png){:class="img-responsive"}

Avec cet outillage logiciel, THEMIS est l'équipement idéal des bureaux d'études en efficacité énergétique. Il est aussi très pertinent dans le domaine de la maintenance pour le gestionnaire de bâtiments.

Le tableau de bord ci après détaille le suivi des circuits d'une chaufferie gaz. Les courbes vertes et rouge sont respectivement la température extérieure et la température de départ dans les circuits. Les fonctionnements de pompe sont 
matérialisés en orange, les ouvertures et les fermetures de vannes 3 voies sont représentés par des traits verticaux bleus (ouvertures) et noirs (fermeture). 

![suivi chaufferie OK]({{ site.baseurl }}/assets/themis/monitoring_circuit_eau_chaude_isolationOK.png){:class="img-responsive"}
![suivi chaufferie pb vanne]({{ site.baseurl }}/assets/themis/monitoring_circuit_eau_chaude_defaut_vanne.png){:class="img-responsive"}

![suivi chaufferie passoire]({{ site.baseurl }}/assets/themis/monitoring_circuit_eau_chaude_batiment_passoire.png){:class="img-responsive"}

Le second graphique est typique d'une défaillance de vanne 3 voies. Le système mutiplie les ouvertures mais 
la température dans le circuit ne bouge pas. Il faut appeler l'exploitant pour précéder au remplacement.

Le premier graphique illustre un fonctionnement normal : on distingue les réduits. 
Le troisième graphique lui aussi illustre un fonctionnement normal. Il n'y a pas de réduits en semaine ou presque plus car il s'agit d'une passoire énergétique : l'intelligence 
artificielle ayant modélisé le comportement du bâtiment est arrivée à la conclusion que la température chutait trop entre le soir et le matin et qu'il était nécessaire de maintenir le bâtiment en chauffe pendant la nuit pour garantir un confort minimal à l'arrivée des agents le matin. 
En week end, le réduit est pratiqué mais sur une période plutôt courte. 

Lorsque THEMIS sera arrivé à maturité, embarquant à son bord des algorithmes d’intelligence artificielle et des fonctions de pilotage intelligent, 
il pourra, dans une optique décentralisée et autonome, jouer le rôle de contrôleur énergétique pour smartgrid multi-énergies. 

Themis sera le controlleur de réference pour la technologie dromotherm.

![dromotherm]({{ site.baseurl }}/assets/smartgrid_small.png){:class="img-responsive"}
