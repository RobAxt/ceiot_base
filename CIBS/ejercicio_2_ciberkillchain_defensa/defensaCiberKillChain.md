# Ejercicio CiberKillChain - Defensa

## Alumno

i0616 - Roberto Oscar Axt

## Enunciado

Desarrolla la defensa en función del ataque planteado en orden inverso

## Resolución

### Actions on Objectives

- Uso de herramientas de mitigación como pueden ser los IDS/IPS para detección de comportamientos anómalos.
- Definción de zonas de seguridad y conductos. A cada zona asignarle los minimos permisos, basandose en el concepto de mínimos privilegios.

### Command and Control

- No usar la Raspberry Pi 3B+ en ambiente productivos.

### Installation

- Configurar tiempo de expiración de la sesión local.

### Exploitation

- No usar claves por defecto. Utilizar claves y certificados distintos por estación repetidora.
- Mantener actualizado el software RaspAP a una versión superior o igual a la [2.5.1](https://github.com/RaspAP/raspap-webgui/releases/tag/2.5.1)

### Delivery

- Uso de alarmas perimetrales o vibraciones de muros para detección de intrusión física.
- Minimizar el área de cobertura de la red Wi-Fi al interior del Shelter, bajando la potencia de salida.
- Desde la configuración no permitir el uso de dispositivos tipo Massive-Storage en los puertos USB.
 
### Weaponization


### Reconnaissance