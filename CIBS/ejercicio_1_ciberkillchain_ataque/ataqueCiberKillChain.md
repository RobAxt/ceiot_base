# Ejercicio CiberKillChain - Ataque

## Alumno

i0616 - Roberto Oscar Axt

## Enunciado

Armar una [cyberkillchain](https://www.lockheedmartin.com/en-us/capabilities/cyber/cyber-kill-chain.html) usando técnicas de la matriz de [Att&ck](https://attack.mitre.org/tactics/TA0043/) para un escenario relacionado a tu trabajo práctico.

## Datos trabajo práctico

El [Proyecto Final de CEIOT](https://drive.google.com/drive/folders/1-OQjS7y56o0RLT7-2TWIwGT60QBQOwh2?usp=share_link) es el desarrollo de un [Stack de Software para la Gestión de Repetidoras de Comunicación](https://github.com/RobAxt/stack).
Las Repetidoras se encuentran a lo largo del gasoducto de TGN separadas unos 50 km. La infraestructura de una estación repetidora del troncal de microondas está formada por un shelter, una torre de comunicaciones y un cerco perimetral.
Dentro del shelter se encuentran los distintos subsistemas que brindan soporte al sistema de comunicaciones. Dependiendo de los servicios que se brindan en el sitio y de las particularidades se dispondrán de distintos subsistemas.
Por la complejidad de los distintos subsistemas, la capa de percepción queda fuera del alcance del trabajo final. Solo se desarrolla un sistema embebido que simule el subsistema ambiental. Para la rápida implementación de este nodo se utiliza el framework de Tasmota corriendo en un ESP32-C3. Este nodo utiliza 2 sensores de temperatura one-wire DS18B20 simulando la información de la temperatura interior y exterior. Luego se utilizan 4 leds que simulan relés. Los dos primeros encargados de encender y apagar los aires acondicionados, el tercero se encarga de la apertura y cierre de las persianas y el cuarto de la activación del extractor. Este nodo no tiene ninguna inteligencia en cuanto a la lógica del funcionamiento de sus periféricos. Esta lógica es implementada en las capas superiores.
Las restantes capas estarán soportadas por la reTerminal de Seeed Studio, que se basa en el module de Raspberry Pi CM4. Pero por problemas de importación aún no se cuenta con este dispositivo. Como workaround se está desarrollando el stack de software sobre una laptop corriendo Docker Desktop.

## Resolución

### Reconnaissance

Gather Victim Host Information [T1592](https://attack.mitre.org/techniques/T1592)

- En cada repetidora esta la misma red de sensores Wi-Fi sin acceso a internet, provista por la reTerminal. Aquí el atacante puede descubrir que se trata de un dispositivo con una Raspberry Pi (RPi) [T1592.001](https://attack.mitre.org/techniques/T1592/001/) y de los servicios que brindan [T1592.002](https://attack.mitre.org/techniques/T1592/002/).
- Hurtar fisicamente el dispositivo (reTerminal) y algún nodo de la red de sensores (ESP32-C3) para poder analizar las aplicaciones que corren en la misma [T1592.003](https://attack.mitre.org/techniques/T1592/003/).

Active Scanning [T1595](https://attack.mitre.org/techniques/T1595):

- Escaneo de vulnerabilidades [T1595.002](https://attack.mitre.org/techniques/T1595/002/). Analizando el tráfico de la red Wi-Fi se puede detectar los protocolos de comunicación que se están usando y descubrir que aplicaciones corren en cada puerto TCP. 
- Escaneo de lista de palabras [T1595.003](https://attack.mitre.org/techniques/T1595/003/). Tanto de manera remota por la red Wi-Fi o con la manipulación física del equipo se puede obtener información del contenido del dispositivo y la infraestructura a la que se encuentra conectado.

### Weaponization

Vulnerabilidades Raspberry Pi. [NIST NVD Raspberry Pi](https://nvd.nist.gov/vuln/search/results?form_type=Basic&results_type=overview&query=raspberry+pi&search_type=all&isCpeNameSearch=false)

- Ataque a Access Point en RPi. [CVE-2020-24572](https://nvd.nist.gov/vuln/detail/CVE-2020-24572)
- Uso de claves por defecto en RPi. [CVE-2021-38759](https://nvd.nist.gov/vuln/detail/CVE-2021-38759)
- Elevación de privilegios mediante un proceso de debug. [CVE-2018-18068](https://nvd.nist.gov/vuln/detail/CVE-2018-18068)

Vulnerabilidades Node-Red [NIST NVD Node-Red](https://nvd.nist.gov/vuln/search/results?form_type=Basic&results_type=overview&query=node-red&search_type=all&isCpeNameSearch=false)

- Esta vulnerabiliad problematica del node-red-dashboard afecta a algunos procesos desconocidos del archivo components/ui-component/ui-component-ctrl.js del componente ui_text Format Handler. La manipulación conduce a secuencias de comandos entre sitios. El ataque puede iniciarse de forma remota.[CVE-2022-3783](https://nvd.nist.gov/vuln/detail/CVE-2022-3783)
- Es posible inyectar JavaScript dentro de las versiones de node-red-dashboard anteriores a la versión 2.17.0 debido a que el nodo ui_notification acepta HTML sin procesar de forma predeterminada. [CVE-2019-10756](https://nvd.nist.gov/vuln/detail/CVE-2019-10756)
- Node-RED-Dashboard antes de 2.26.2 permite el recorrido del directorio ui_base/js/..%2f para leer archivos. [CVE-2021-3223](https://nvd.nist.gov/vuln/detail/CVE-2021-3223)

Vulnerabilidades InfluxDB [NIST NVD InfluxDB](https://nvd.nist.gov/vuln/search/results?form_type=Basic&results_type=overview&query=influxdb&search_type=all&isCpeNameSearch=false)

- Solo vulnerabilidades para versiones anteriores a la 2.0
- Vulnerabilidad con interacción Grafana que puede resultar en la ejecución de código js arbitrario en el navegador de las víctimas. [CVE-2018-1000816](https://nvd.nist.gov/vuln/detail/CVE-2018-1000816) 

Vulnerabilidades Grafana [NIST NVD Grafana](https://nvd.nist.gov/vuln/search/results?form_type=Basic&results_type=overview&query=grafana&search_type=all&isCpeNameSearch=false)

- La más reciente, las versiones anteriores a la 9.1.8 y la 8.5.14 permiten que un usuario bloquee el intento de inicio de sesión de otro registrando la dirección de correo electrónico de otra persona como nombre de usuario. [CVE-2022-39229](https://nvd.nist.gov/vuln/detail/CVE-2022-39229)

Vulnerabilidades Portainer [NIST NVD Portainer](https://nvd.nist.gov/vuln/search/results?form_type=Basic&results_type=overview&query=portainer&search_type=all&isCpeNameSearch=false)


### Delivery

### Exploitation

### Installation

### Command and Control

### Actions on Objectives

