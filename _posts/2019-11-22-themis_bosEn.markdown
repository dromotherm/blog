---
layout: post
title:  "The Building Operating System (BOS) Themis"
date:   2019-11-22
author: alex
draft: false
lang: en
ref: themis bos opensource
categories: [themis]
---

THEMIS (THermic and Energetic MonItoring System) is a NON-INTRUSIVE monitoring network targeting building energy performance. 
THEMIS embeds a fork of the [EmonCMS](http://github.com/emoncms/emoncms) software as a grapher and for data storage. 
EmonCMS is a NoSQL database dedicated to real-time monitoring based on connected objects. Its code is open source.

The diagram below represents the general architecture of the THEMIS ecosystem, structured around an [Advantech](https://www.advantech.com) 4G smartflex cellular router/gateway.....

![architecture d'un réseau de monitoring themis]({{ site.baseurl }}/assets/themis/ecosysteme_version1.png){:class="img-responsive"}

This architecture implements two types of radio frequencies: 868 Mhz and 169 Mhz and offers the possibility to interface with an industrial RS485 bus (modbus), 
a standard communication protocol popular in industrial environments, such as boiler rooms of tertiary buildings. This makes THEMIS a powerful data aggregator, 
benefiting from the high efficiency of the MQTT protocol (Message Queuing Telemetry Transport). 
Thanks to the 169Mhz band, THEMIS is able to equip large buildings with wireless sensors.

On a building or a set of buildings, THEMIS is able to gather in real time existing measurements from available facilities and extra ones from new sensors,
storing all the feeds in the the same NoSQL chronological database. The aim is to capitalize physical data in order to provide a coherent digital material to intelligent 
algorithms so that they can quantify the building behaviour and optimize energy management. 

THEMIS offers a wide variety of measurements: indoor and outdoor temperature, humidity, CO2, instantaneous electrical power, gas pulses, heat metering... 

![Themis in da box]({{ site.baseurl }}/assets/themis/themis_in_a_box.png){:class="img-responsive"}

THEMIS can simulate thermal losses related to air leakages, and can estimate the actual performance of the building envelope, 
in order to assess the difference with the prescribed performance.

![simulation des pertes par infiltrations]({{ site.baseurl }}/assets/themis/INFLOSSES.png){:class="img-responsive"}

The system was heavily tested on the field during an operation carried out by the social landlord Allier habitat, with measurements carried out over one year 
on three pavilion-type dwellings in order to evaluate different thermal insulation techniques from the outside.

![suivi des consommations énergétiques]({{ site.baseurl }}/assets/themis/Energy.png){:class="img-responsive"}

Given the precision of its monitoring, THEMIS makes it easy to distinguish what is relevant to uses (related to the residents'habits or behaviours) from what 
is specific to the building's performance, as shown by the following illustration, where we can identify at a glance the energy consumption due to the use of an air conditioner.

![simulation des pertes par infiltrations]({{ site.baseurl }}/assets/themis/Energie_ConfortTRH.png){:class="img-responsive"}

During summer, THEMIS can calculate absolute humidity and produce psychrometric diagrams in order to identify the discomfort.

![psychrometric diagram]({{ site.baseurl }}/assets/themis/psychrometric.png){:class="img-responsive"}

With such software tools, THEMIS is the perfect equipment for engineering departments specialized in energy efficiency. It is also very relevant in the field of maintenance.

The following dashboard details the circuits'monitoring in a gas boiler room. The green and red curves represents respectively the outside temperature and the flow temperature 
in the circuits. The pumps'activities appear in orange, while the openings and closures of 3-way valves are represented by vertical lines, blue for openings and black for closures. 

![suivi chaufferie OK]({{ site.baseurl }}/assets/themis/monitoring_circuit_eau_chaude_isolationOK.png){:class="img-responsive"}
![suivi chaufferie pb vanne]({{ site.baseurl }}/assets/themis/monitoring_circuit_eau_chaude_defaut_vanne.png){:class="img-responsive"}
![suivi chaufferie passoire]({{ site.baseurl }}/assets/themis/monitoring_circuit_eau_chaude_batiment_passoire.png){:class="img-responsive"}

The second graph is typical of a 3-way valve failure. We can see repeating opening orders while the temperature in the circuit remains the same. 
A replacement has to be achieved as soon as possible.

The first graph illustrates a normal behaviour : at night, the hot water supply is reduced. 

The third graph represents the heat regulation on a poorly insulated building : 
while modeling the building's behaviour the artificial intelligence concluded that indoor temperature dropped too much between evening and morning when outside temperature was below a certain threshold and  
that it was necessary to keep the building warm at night in order to ensure a basic comfort in morning time, when office work begins.

In the future, with on board artificial intelligence algorithms and intelligent control functions, 
THEMIS will be able to act as a multi-energetic smartgrid controller, in a decentralized and autonomous perspective 

The THEMIS system will become the reference controller for dromotherm technology.

![dromotherm]({{ site.baseurl }}/assets/smartgrid_small.png){:class="img-responsive"}
