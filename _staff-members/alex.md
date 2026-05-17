---
ref: alex
name: Alexandre CUER
mel: alexandre.cuer@cerema.fr
layout: default_no_menu
lang: fr
---


# Alexandre CUER

🟢 Diplôme d'ingénieur de l'ENTPE : 1997

🟢 Maîtrise en génie civil de l'INSA Lyon : 1997

**Recherche & développements** 

🔵 **IOT - Internet Of Things**

🔵 **simulation, monitoring et pilotage de bâtiments et de systèmes énergétiques, pompes à chaleur**


[CV sur linkedin](https://www.linkedin.com/in/alexandre-cuer-832ba971)

# PROJETS

## Dromotherm | depuis 2018 | chef de projet

Le projet Dromotherm, financé par le dispositif Pack Ambition Recherche de la région Auvergne-Rhône-Alpes sur la période 2020 – 2025, est une initiative innovante visant à transformer la gestion énergétique des zones urbaines.

En utilisant la chaleur captée par les chaussées durant l'été, cette technologie permet de chauffer les bâtiments environnants en hiver, offrant une solution durable et efficace pour réduire les émissions de carbone, améliorer l'efficacité énergétique et lutter contre les Îlots de Chaleur Urbains.

Concept et Fonctionnement :
- **Récupération de la chaleur Solaire** : Les routes absorbent la chaleur solaire en été. Cette chaleur est récupérée grâce à un fluide caloporteur circulant dans un enrobé drainant sous la couche de roulement.
- **Stockage géothermique** : La chaleur est stockée dans un massif de gravier saturé sous le sol, qui agit comme un réservoir thermique.
- **Restitution en Hiver** : En hiver, la chaleur stockée est extraite pour chauffer les bâtiments grâce à des pompes à chaleur géothermiques.


## BIOS | depuis 2021 | chef de projet

[BIOS](https://alexandrecuer.github.io/bios-smart-control-84/download/Bios_Datasheet_FR_2025.pdf) (Building Intelligent Operating System) est une Gestion Technique de Bâtiments (GTB) embarquée sur carte [Jetson NVIDIA](https://www.nvidia.com/fr-fr/autonomous-machines/embedded-systems/)

Il manque 2 briques pour passer en classe A selon selon la norme **NF EN ISO 52120-1-2022** : 
- la commande des pompes à vitesse variable
- la mise en séquence des différents générateurs en fonction des prédictions de charges

BIOS :

- utilise docker pour isoler les services, ce qui garantit la robustesse terrain.
- dispose d'un orchestrateur de services pour que l'utilsateur active facilement les briques (capteurs sans fil, modbus, prévisions météo) dont il a besoin.
- fonctionne de manière sécurisée en [https](https://fr.wikipedia.org/wiki/Hypertext_Transfer_Protocol_Secure)

Un superviseur permet de gérer les mises à jour depuis l'interface utilsateur.

L'interface utilisateur est entièrement en [web component](https://developer.mozilla.org/fr/docs/Web/API/Web_components)

La structure étant modulaire, tous les protocoles sont adressables (Bacnet IP, KNX, RS485)

#  Développements Python

## IDFHub | depuis décembre 2025 | chef de projet

[IDFHub](https://github.com/Open-Building-Management/ladybug_codes) est un générateur de fichiers IDF (Input Data File) pour Energyplus

[Energyplus](https://energyplus.net/) est un logiciel permettant de simuler le comportement énergétique d'un bâtiment et de ses systèmes HVAC (Heating, Ventilation, and Air Conditioning)

L'API d'energyplus est complexe à appréhender et la bibliothèque IDFHub permet de décrire simplement des configurations HVAC élaborées en utilisant le format déclaratif yaml.

Un générateur de helpers fournit des classes assistant le développement pour ajouter rapidement les équipements sans se perdre dans la documentation.

## EnergyGym | de juillet 2022 à janvier 2025 | chef de projet

Exploratoire, la bibliothèque [EnergyGym](https://github.com/Open-Building-Management/EnergyGym) fournit un environnement pour entrainer par apprentissage renforcé des réseaux neurones, l'objectif étant de prédire l'optimal restart du système énergétique d'un bâtiment quelconque. 

Le comportement énergétique du bâtiment est simulé par des modèles électriques RC simples.

Développé en lien avec SIGMA Clermont-Ferrand, EnergyPlus implémente diverses techniques d'apprentissage renforcé : Deep Q-Network ou DQN, double DQN, Dueling DQN, Dueling PER (Prioritized Experience Replay)

## Maintenance d'intégrations home-assistant | depuis mai 2024 | contributeur

L'intégration [emoncms](https://www.home-assistant.io/integrations/emoncms/) permet de synchroniser en toute simplicité des données recueillies par emoncms au sein de home-assistant 

L'intégration [emoncms_history](https://www.home-assistant.io/integrations/emoncms_history/ ) permet d'intégrer à une base de données emoncms des données issues d'un système home-assistant

Ces intégrations utilisent la library asynchrone [pyemoncms](https://github.com/Open-Building-Management/pyemoncms) basée sur [aiohttp](https://github.com/aio-libs/aiohttp)

# Développements PHP

## Emoncms | depuis 2019 | contributeur

[Emoncms](https://github.com/emoncms/emoncms) est un logiciel de monitoring de bâtiment, avec sa propre timesérie embarquée.

Son principal atout, par rapport à des solutions comme influxdb et grafana, est la légéreté et la rapidité.

# DEVOPS

## Emoncms standalone container | depuis septembre 2023 | chef de projet

Le container docker [standalone emoncms](https://emoncms-docker.github.io/) utilise [s6-overlay](https://github.com/just-containers/s6-overlay/) comme système d'init.

Il embarque le serveur apache/PHP, la timesérie, la base de données clé-valeur redis utilisée comme tampon d'écriture et tous les services au sein d'une seule image, ce qui facilite le déploiement.
Cette image est conçue pour être embarquée sur des systèmes contraints, en mode edge.

Elle est utilisable comme un [addon home-assistant](https://developers.home-assistant.io/docs/apps/), grâce à une configuration en mode [ingress](https://github.com/Open-Building-Management/emoncms/discussions/17).

Un pipeline utilisant la virtualisation [QEMU](https://fr.wikipedia.org/wiki/QEMU) produit les images pour 3 architectures (`x86`, `arm64`, `arm/v7`) et les met en ligne sur [docker hub](https://hub.docker.com/r/alexjunk/emoncms)

[Sources](https://github.com/Open-Building-Management/emoncms)

[Pour en savoir plus](https://github.com/Open-Building-Management/containers/tree/main/emoncms)

## Operating-systems | depuis mai 2025 | chef de projet

[operating-systems](https://github.com/Open-Building-Management/operating-systems) est une distribution linux construite à partir du générateur buildroot, pour une utilisation en mode embarqué ou en datacenter sur bare metal.

Elle autorise le déploiement rapide d'applications conteneurisées, notamment netbox, permettant de gérer un parc d'objets connectés.
