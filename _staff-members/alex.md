---
ref: alex
name: Alexandre CUER
position: chief executive officer
mel: alexandre.cuer@cerema.fr
layout: default
lang: fr
---

Diplôme d'ingénieur de l'ENTPE

Maîtrise en génie civil de l'INSA Lyon


# Développements Python

## Maintenance des intégrations emoncms et emoncms_history sous home-assistant

y compris la library synchrone [pyemoncms](https://github.com/Open-Building-Management/pyemoncms) basée sur [aiohttp](https://github.com/aio-libs/aiohttp)

https://www.home-assistant.io/integrations/emoncms/

https://www.home-assistant.io/integrations/emoncms_history/ 

## projet BIOS - Building Intelligent Operating System - Internet Of Things

BIOS est une Gestion Technique de Bâtiments embarquée sur carte [Jetson NVIDIA](https://www.nvidia.com/fr-fr/autonomous-machines/embedded-systems/)

BIOS utilise docker pour isoler les services, ce qui garantit la robustesse terrain.

BIOS dispose d'un orchestrateur de services pour activer les briques (capteurs sans fil, modbus, prévisions météo) dont l'utilisateur a besoin.

Un superviseur permet de gérer les mises à jour depuis l'interface utilsateur.

L'interface utilisateur est entièrement en [web component](https://developer.mozilla.org/fr/docs/Web/API/Web_components)

Le système fonctionne de manière sécurisée en [https](https://fr.wikipedia.org/wiki/Hypertext_Transfer_Protocol_Secure)

# Développements PHP

# emoncms

[emoncms](https://github.com/emoncms/emoncms) est un logiciel de monitoring de bâtiment, avec sa propre timesérie embarquée.

Son principal atout, par rapport à des solutions comme influxdb et grafana, est la légéreté et la rapidité.

Participation aux développements depuis 2018

# devops

## emoncms standalone container

https://emoncms-docker.github.io/

[Sources](https://github.com/Open-Building-Management/emoncms)

[Pour en savoir plus](https://github.com/Open-Building-Management/containers/tree/main/emoncms)

Cette image utilise [s6-overlay](https://github.com/just-containers/s6-overlay/) comme système d'init

Elle est utilisable comme un addon sous home-assistant.

Un pipeline utilisant [QEMU](https://fr.wikipedia.org/wiki/QEMU) produit les images pour 3 architectures (x86, arm64, arm/v7) et les met en ligne sur [docker hub](https://hub.docker.com/r/alexjunk/emoncms) 


[CV sur linkedin](https://www.linkedin.com/in/alexandre-cuer-832ba971)

