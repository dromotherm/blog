---
layout: post
title:  "The Building Operating System (BOS) Themis"
date:   2019-11-22
author: alex
draft: true
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
