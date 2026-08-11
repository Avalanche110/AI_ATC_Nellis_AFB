# Manual de uso de AI_ATC

## ¿Qué es?

AI_ATC es una simulación de nivel de estudio de los procedimientos ATC en la base aérea de Nellis.
Está diseñada para ayudar a los pilotos virtuales a estudiar, planificar y ejecutar procedimientos realistas para Nellis AFB y el Nevada Test and Training Range (NTTR).

## ¿Para quién es?

Para pilotos virtuales interesados en aprender procedimientos ATC realistas y familiarizarse con la fraseología. Está pensada para grupos pequeños o medianos que quieran practicar procedimientos y ganar confianza al comunicarse con ATC. Puede utilizarse tanto en un jugador como en multijugador.

## Fuentes y agradecimientos

### Procedimientos locales de vuelo de Nellis AFB

- <https://static.e-publishing.af.mil/production/1/nellisafb/publication/nellisafbi11-250/nellisafbi11-250.pdf>

### Operaciones en NTTR

- <https://static.e-publishing.af.mil/production/1/nellisafb/publication/afi13-212v1_accsup_nttrsup_add_a/afman13-212v1_nttr_add_a.pdf>

### FAA - Air Traffic Control (JO 7110.65BB)

- <https://www.faa.gov/documentLibrary/media/Order/7110.65BB_Basic_dtd_2-20-25.pdf>

- MOOSE Framework: <https://flightcontrol-master.github.io/MOOSE/>
- Cartas VFR de Tim “Stretch” Morgan: <https://forums.pilotedge.net/viewtopic.php?t=8983>
- Dibujos del mapa F-10 de Dark_S3ntry: <https://www.digitalcombatsimulator.com/en/files/3335725/>
- Contenido de YouTube y pruebas de Garf @ DCS Hacks: <https://www.youtube.com/@DCSHacks>
- Perfil de VoiceAttack y SME: Cabi~599
- Community Manager de AI_ATC: Hayds_93
- Agradecimiento especial al equipo de pruebas beta por sus valiosas aportaciones.
- Imagen de portada: Airman 1st Class Matthew Lancaster
- Apoya AI_ATC en Patreon: <https://patreon.com/Avalanche110?utm_medium=unknown&utm_source=join_link&utm_campaign=creatorshare_creator&utm_content=copyLink>
- Apoya AI_ATC en GiveSendGo: <https://www.givesendgo.com/AIATC>

## Agencias

AI_ATC simula las operaciones de control de tráfico aéreo de Nellis AFB y del Nevada Test and Training Range (NTTR). En esta simulación, los pilotos interactúan con nueve agencias, cada una responsable de una fase concreta del vuelo:

- **Nellis Clearance:** emite autorizaciones de ruta a las aeronaves que salen.
- **Nellis Ground:** coordina el movimiento de aeronaves en plataformas y calles de rodaje hacia y desde la pista.
- **Nellis Tower:** gestiona despegues, aterrizajes y operaciones de pista.
- **Nellis Departure:** proporciona control de salida dentro del espacio aéreo de clase B de Nellis.
- **Nellis Approach:** guía a las aeronaves que llegan dentro del espacio aéreo de clase B de Nellis.
- **NATCF Lee:** dirige las aeronaves por el corredor de tránsito Lee.
- **NATCF Sally:** gestiona las aeronaves que atraviesan los corredores Sally y Elgin.
- **BLACKJACK:** autoriza la entrada y salida del espacio aéreo programado dentro del NTTR.
- **ATIS:** emite continuamente información automatizada meteorológica y del aeródromo.

**Nota:** el espacio aéreo de clase B se define como 30 DME desde el LAS TACAN.

## Frecuencias de radio

Nellis AFB utiliza canalización de radio local. Todas las frecuencias de radio están preseleccionadas en un número de canal concreto.

**Nota:** AI_ATC puede emitir por UHF o VHF, pero no por ambas a la vez. En la mayoría de los casos, el canal UHF predeterminado es suficiente.

## Primeros pasos

Puedes interactuar con AI_ATC mediante el menú de radio F-10. Sintoniza la radio en la agencia con la que quieras hablar y selecciona la opción de radio F-10.

Recomendamos un enfoque de **gatear, caminar y correr** cuando empieces a utilizar AI_ATC.

1. Empieza completando la misión Tutorial incluida. Te enseñará los fundamentos del uso de AI_ATC y los procedimientos locales de Nellis AFB.
2. Ejecuta manualmente los comandos F-10 durante tus primeros vuelos.
3. Cuando conozcas la estructura del menú F-10, pasa a configurar VOICE ATTACK y a aprender la fraseología.

Se incluye por separado una guía completa para instalar VoiceAttack y el perfil de AI_ATC.

Después de instalar VOICE ATTACK, empieza practicando algunos comandos sencillos en el escritorio. Comprueba que todo funciona como quieres y después pasa a utilizarlo en DCS.

No tengas reparo en volver a seleccionar manualmente los elementos del menú: solo mejorarás con la fraseología mediante **PRÁCTICA, PRÁCTICA y más PRÁCTICA**.

## Curva de aprendizaje y planificación

La curva de aprendizaje de AI_ATC dependerá de tus conocimientos generales de aviación.

La aviación general no es un tema que se trate, estudie o practique ampliamente entre la comunidad de jugadores de DCS. Recomendamos encarecidamente consumir de forma constante material sobre aviación general. Hemos seleccionado varios vídeos de YouTube para ayudarte en este proceso; están disponibles en el canal de YouTube de DCS Hacks: <https://www.youtube.com/@DCSHacks>.

Al aprender los procedimientos locales de vuelo, planifica el vuelo con antelación. Elige por adelantado la salida y la aproximación que quieras practicar.

Estudia las cartas incluidas para entender qué tienes que hacer **antes** de iniciar DCS. En el canal de YouTube de DCS Hacks hay una serie completa de tutoriales. Mira los vídeos relacionados con el vuelo que vas a realizar.

Al principio, intenta dominar los procedimientos de vuelo VFR antes de pasar a los procedimientos IFR, más avanzados.

## Añadir archivos de sonido a una misión existente

**Nota:** no es necesario instalar nada para las misiones incluidas.

AI_ATC utiliza aproximadamente 2.500 archivos de sonido pregrabados. Para incorporarlos a una misión existente:

1. **Añade los archivos de sonido a la misión.**
   - Abre el archivo `.miz` con el programa de archivado que prefieras, por ejemplo 7-Zip o WinRAR.
   - Copia los archivos de sonido en la carpeta correspondiente del archivo.
2. **Configura la misión en el Mission Editor.**
   - Inicia el Mission Editor y abre tu misión.
   - Crea un evento de disparador `MISSION START`.
   - Añade una acción `DO SCRIPT FILE` para incluir los archivos de script de MOOSE y AI_ATC.
   - Añade una acción de disparador `SOUND TO COUNTRY` para los 3 archivos de sonido misceláneos.
3. **Configura DCS ATC en modo silencioso.**
   - Asegúrate de que DCS ATC está configurado en `Silent Mode`.

## Parámetros personalizables

AI_ATC tiene varios parámetros personalizables que los diseñadores de misiones pueden utilizar al crear una misión. Solo tienes que añadir la función deseada a una acción de disparador `DO SCRIPT`.

### Establecer el callsign de un grupo

AI_ATC admite 135 callsigns diferentes que pueden preseleccionarse con la siguiente función:

```lua
AI_ATC:SetCallsign([Group name], "[callsign]", "[Integer]")
AI_ATC:SetCallsign("My F-5E", "Dragon", "31")
```

En este ejemplo:

- `"My F-5E"` es el nombre del grupo.
- `"Dragon"` es el callsign deseado.
- `"31"` es el identificador numérico del callsign.

Puedes ajustar el callsign y el entero para adaptarlos a cualquiera de las 135 opciones disponibles según las necesidades de tu misión.

### Establecer la frecuencia de radio

Cada agencia puede emitir por UHF o VHF, pero no por ambas a la vez. De forma predeterminada, todas las agencias emiten por UHF. Puedes cambiarlo especificando el rango de frecuencias de una agencia mediante esta función:

```lua
AI_ATC:SetRadioFrequency("[Agency]", "[Frequency Range]")
AI_ATC:SetRadioFrequency("Ground", "VHF")
```

En este ejemplo:

- `"Ground"` se refiere a la agencia.
- `"VHF"` configura la agencia para emitir en el rango de frecuencias VHF.

### Añadir grupos de aeronaves diferentes

AI_ATC interactúa con los clientes a nivel de **GROUP**. En DCS, un grupo solo puede contener un tipo de aeronave. Sin embargo, AI_ATC permite combinar aeronaves diferentes en un único grupo para la interacción con ATC, aunque sean de tipos distintos. Esto permite utilizar formaciones mixtas y mejorar la coordinación en escenarios multijugador.

Para especificar qué clientes forman un grupo, utiliza esta función:

```lua
AI_ATC:AddPlayerToGroup([Recipient Group Name], [Donor Group Name])
AI_ATC:AddPlayerToGroup("Nellis_F/A-18C", "Nellis_F-16C")
```

En este ejemplo:

- `"Nellis_F/A-18C"` es el grupo receptor y será el nombre principal del grupo.
- `"Nellis_F-16C"` es el grupo donante, que se añadirá al grupo receptor.

AI_ATC tratará ambas aeronaves como un solo grupo, por lo que recibirán las mismas instrucciones ATC, callsigns y secuenciación.

### Desactivar ATIS para compatibilidad con FC3

Los módulos de la serie Flaming Cliffs tienen radios simplificadas. Si quieres utilizar AI_ATC con uno de estos módulos, tendrás que desactivar ATIS:

```lua
AI_ATC:StopATIS()
```

### Mensaje de comando de voz en pantalla

Al aprender procedimientos ATC y fraseología, puede ser difícil recordar la frase concreta que hay que utilizar. AI_ATC ofrece una opción para mostrar en pantalla el comando esperado, de modo que el piloto pueda repetirlo. Para activar esta función, utiliza:

```lua
AI_ATC:VoiceCommandPrompt(true)
```
