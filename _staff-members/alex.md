---
ref: alex
name: Alexandre CUER
position: chief executive officer
mel: alexandre.cuer@cerema.fr
layout: default
lang: fr
---

Diplôme d'ingénieur de l'ENTPE : 1997

Maîtrise en génie civil de l'INSA Lyon : 1997

[CV sur linkedin](https://www.linkedin.com/in/alexandre-cuer-832ba971)

**IOT - Internet Of Things**

# Développements Python

## Maintenance d'intégrations home-assistant

[emoncms](https://www.home-assistant.io/integrations/emoncms/) permet de synchroniser en toute simplicité des données recueillies par emoncms au sein de home-assistant 

[emoncms_history](https://www.home-assistant.io/integrations/emoncms_history/ ) permet d'intégrer à une base de données emoncms des données issues d'un système home-assistant

Ces intégrations utilisent la library asynchrone [pyemoncms](https://github.com/Open-Building-Management/pyemoncms) basée sur [aiohttp](https://github.com/aio-libs/aiohttp)

## générateur de fichiers IDF pour energyplus : IDFHub

[Energyplus](https://energyplus.net/) est un logiciel permettant de simuler le comportement énergétique d'un bâtiment et de ses systèmes HVAC (Heating, Ventilation, and Air Conditioning)

L'API d'energyplus est complexe à appréhender et la bibliothèque IDFHub permet de décrire simplement des configurations HVAC élaborées en utilisant le format déclaratif yaml.

Un générateur de helpers fournit des classes assistant le développement pour ajouter rapidement les équipements sans se perdre dans la documentation.

## EnergyGym

Exploratoire, la bibliothèque [EnergyGym](https://github.com/Open-Building-Management/EnergyGym) fournit un environnement pour entrainer des réseaux neurones par apprentissage renforcé à comprendre le comportement énergétique d'un bâtiment.

Développé en lien avec SIGMA Clermont-Ferrand, EnergyPlus implémente diverses techniques d'apprentissage renforcé : Deep Q-Network ou DQN, double DQN, Dueling DQN, Dueling PER (Prioritized Experience Replay)

## projet BIOS

BIOS (Building Intelligent Operating System) est une Gestion Technique de Bâtiments embarquée sur carte [Jetson NVIDIA](https://www.nvidia.com/fr-fr/autonomous-machines/embedded-systems/)

BIOS :

- utilise docker pour isoler les services, ce qui garantit la robustesse terrain.
- dispose d'un orchestrateur de services pour que l'utilsateur active facilement les briques (capteurs sans fil, modbus, prévisions météo) dont il a besoin.
- fonctionne de manière sécurisée en [https](https://fr.wikipedia.org/wiki/Hypertext_Transfer_Protocol_Secure)

Un superviseur permet de gérer les mises à jour depuis l'interface utilsateur.

L'interface utilisateur est entièrement en [web component](https://developer.mozilla.org/fr/docs/Web/API/Web_components)

# Développements PHP

## emoncms

[emoncms](https://github.com/emoncms/emoncms) est un logiciel de monitoring de bâtiment, avec sa propre timesérie embarquée.

Son principal atout, par rapport à des solutions comme influxdb et grafana, est la légéreté et la rapidité.

**Participation aux développements depuis 2018**

# devops

## emoncms standalone container

Le container docker [standalone emoncms](https://emoncms-docker.github.io/) utilise [s6-overlay](https://github.com/just-containers/s6-overlay/) comme système d'init.

Il embarque le serveur apache/PHP, la timesérie, la base de données clé-valeur redis utilisée comme tampon d'écriture et tous les services au sein d'une seule image, ce qui facilite le déploiement.

Il est utilisable comme un addon sous home-assistant, gràce à une configuration en mode ingress.

Un pipeline utilisant [QEMU](https://fr.wikipedia.org/wiki/QEMU) produit les images pour 3 architectures (x86, arm64, arm/v7) et les met en ligne sur [docker hub](https://hub.docker.com/r/alexjunk/emoncms)

[Sources](https://github.com/Open-Building-Management/emoncms)

[Pour en savoir plus](https://github.com/Open-Building-Management/containers/tree/main/emoncms)
