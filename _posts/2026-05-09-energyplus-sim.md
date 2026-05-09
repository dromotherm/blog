---
layout: post
title:  "Simulation with EnergyPlus"
author: alex
draft: false
lang: "fr"
ref: eplus_sim_01
date: 2026-05-09
categories: [dromotherm, simulation]
image: energy_plus/acf_2.png
---

Rather than rebuilding enverything from scratch in python like we did in the thesis, a more robust approach is to use [energyplus](https://energyplus.net/)



Exemple of a tertiairy building :

![]({{ site.baseurl }}/assets/energy_plus/acf.png)

Area | [m2]
--|--
Total Building Area	| 1377.00
Net Conditioned Building Area | 906.00
Unconditioned Building Area | 471.00

# air to water heat pump with gaz boiler in backup

![]({{ site.baseurl }}/assets/energy_plus/hpatw_gas_backup.png)

consumption | Electricity [GJ] | Natural Gas [GJ]
--|--|--
Heating	| 16.01 |18.66
Pumps	| 0.79	| 0.00
Total End Uses	| 16.80	| 18.66
	
zone HVAC | Design Size Maximum Water Flow Rate [m3/s] | U-Factor times Area [W/C]
--|--|--
RDC BASEBOARD | 0.000931	| 755.96
RPLUS1 BASEBOARD	| 0.000857	| 695.28

PlantLoop | Initial Maximum Loop Flow Rate [m3/s]	| Initial Plant Loop Volume [m3]	| Maximum Loop Flow Rate [m3/s]	| Plant Loop Volume [m3]
--|--|--|--|--
WATER_HEATING_LOOP	| 0.001788	| 0.214543	| 0.001788	| 0.214543

Pump:VariableSpeed | Initial Design Flow Rate [m3/s]	| Initial Design Power Consumption [W]	| Design Flow Rate [m3/s]	| Design Power Consumption [W]
--|--|--|--|--
INSIDE_VARIABLE_PUMP	| 0.001788	| 456.78	| 0.001788	| 456.78

HeatPump:PlantLoop:EIR:Heating | Initial Design Size Load Side Volume Flow Rate [m3/s]	| Initial Design Size Source Side Volume Flow Rate [m3/s]	| Design Size Nominal Capacity [W]	| User-Specified Nominal Capacity [W]	| Design Size Load Side Volume Flow Rate [m3/s]	| Design Size Source Side Volume Flow Rate [m3/s]
--|--|--|--|--|--|--
HPATW_EIR_EIR_HEATPUMP_AIR2WATER	| 0.001788	| 2.07	| 73564.99	| 35000.00	| 0.001788	| 2.07

# profiles

![]({{ site.baseurl }}/assets/energy_plus/hpatw_profiles.png)
