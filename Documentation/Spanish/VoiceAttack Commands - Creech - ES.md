# AI_ATC - Referencia de comandos de VoiceAttack - Creech / Indian Springs

**Versión AI_ATC:** 2.9.27 · **Versión del perfil VoiceAttack:** 1.00

## 00 Cómo usar esta referencia

Al cargar por primera vez el perfil de VoiceAttack, di `Set Airbase to Indian Springs` y después `Set Callsign Dodge Two One` antes de utilizar cualquier comando ATC. Repite estos comandos cuando cambies el aeródromo activo o el callsign.

| Notación | Significado |
|---|---|
| `<Callsign>` | Callsign seleccionado, por ejemplo `Dodge Two One` |
| `<Runway>` | Pista Creech válida: `08`, `13`, `26` o `31` |
| `<Waypoint>` | Punto de navegación válido para el servicio Nellis Control correspondiente |
| `<Altitude>` | Altitud o nivel de vuelo hablado |
| `<ATIS Code>` | Información `Alpha` a `Zulu` |
| `[Optional]` | La palabra o frase puede omitirse |
| `A / B` | Puede pronunciarse cualquiera de las dos opciones |

Pronuncia el nombre del controlador, el callsign y el comando como una frase continua, salvo cuando se indique que es un comando que solo requiere callsign. Nellis Control proporciona los servicios de radar de salida y aproximación para Indian Springs.

## 01 Clearance Delivery

**UHF 372.200 | VHF 118.300**

**Formato estándar:** `Indian Springs Clearance, <Callsign>, clearance on request, <Clearance>`

### Autorización VFR

`VFR` → `Gate One - FLUSH - JAYSN - STRYK; maintain 7,000 ft as assigned`

### Operaciones exclusivamente VFR

Indian Springs / Creech AFB está configurado como un aeródromo exclusivamente VFR. No solicites una salida IFR a Clearance Delivery. Utiliza la opción de autorización VFR anterior y, después de la salida, contacta con Nellis Control según las instrucciones.

### Comandos Squawk

- **Código específico:** `Squawk <code>`
- **Código secuencial:** `Squawk 1001 / 2001 / 3001 / 4001 / 5001 / 6001 / 7001 sequential`

**Ejemplo:** `Indian Springs Clearance, Dodge Two One, clearance on request, VFR`

## 02 Ground Control

**UHF 275.800 | VHF 118.300**

**Formato estándar:** `Indian Springs Ground, <Callsign>, <Command>`

| Propósito | Comando reconocido |
|---|---|
| Arranque de motores | `Request engine start` |
| Rodaje | `Request taxi / request taxi to runway` |
| Rodaje con ATIS | `Request taxi with [information] <ATIS Code>` |
| Mantener posición | `Holding short [runway] <Runway>` |
| Estacionamiento | `Request taxi to park / parking` |
| Comprobación de estacionario | `Request hover check` |

### Pistas válidas

| Pista | Forma hablada |
|---|---|
| `08` | `Zero Eight` |
| `13` | `One Three` |
| `26` | `Two Six` |
| `31` | `Three One` |

**Ejemplo:** `Indian Springs Ground, Dodge Two One, request taxi with information Alpha`

## 03 Tower

**UHF 360.600 | VHF 118.300**

**Formato estándar:** `Indian Springs Tower, <Callsign>, <Command>`

| Propósito | Comando reconocido |
|---|---|
| Listo | `Request takeoff / ready for takeoff / ready for departure / number one` |
| Mantener posición | `Holding short [runway] Zero Eight / One Three / Two Six / Three One` |
| Ascenso | `Request [unrestricted / quick] climb to / through <Altitude>` |
| Helicóptero | `Request hover check / request takeoff from parking` |
| Inicial / overhead | `Initial / at initial / request the overhead / request initial / ready overhead` |
| Circuito especial | `Request high tactical initial / overhead`; `request SFO`; `high key`; `low key` |
| Base | `Left / right base, <gear report>, <landing intention>` |
| Distancia | `Three / five miles, <gear report>, <landing intention>` |
| Directo | `Request straight in / straight-in landing` |
| Circuito cerrado | `Request closed / closed traffic` |
| Otros | `Extending downwind / missed approach / runway in sight / traffic in sight / no joy / say winds` |

**Ejemplo:** `Indian Springs Tower, Dodge Two One, left base, gear down, full stop`

## 04 Nellis Control - Departure

**UHF 254.400 | VHF 119.350**

**Formato estándar:** `Nellis Control, <Callsign>, <Command>`

| Propósito | Comando reconocido |
|---|---|
| Contacto inicial | `Checking in` |
| Informe de altitud | `Airborne passing / passing <Altitude> thousand` |
| Informe de punto | `Is / passing / reporting <Waypoint>` |
| Solicitud de vector | `Request vector / request vectors / request a vector [to / for] <Waypoint>` |
| Solicitud de aproximación | `Request approach` |
| Identificación radar | `Flash` |

**Formato de vector:** `Nellis Control, <Callsign>, request vector to <Waypoint>`

| Grupo | Puntos de navegación válidos |
|---|---|
| Fijos de salida IFR | `ESSAA`; `JAYSN`; `LEAHI`; `Tonopah TACAN`; `STOFF` |
| Ruta de salida VFR | `Gate One`; `FLUSH`; `JAYSN`; `STRYK` |
| Puntos de pista/locales | `Runway 08 FAF`; `Runway 13 FAF`; `Runway 26 FAF`; `Runway 31 FAF` |

**Ejemplo:** `Nellis Control, Dodge Two One, request vector to JAYSN`

## 05 Nellis Control - Approach

**UHF 254.400 | VHF 119.350 · SFA UHF 343.725 | VHF 124.950**

**Formato estándar:** `Nellis Control, <Callsign>, <Command>`

| Servicio | Solicitud reconocida |
|---|---|
| Inicial/estado | `Checking in`; `checking in VFR / IFR`; `cancel IFR`; `request IFR pickup` |
| TACAN alto | `Request high TACAN / high TACAN approach` |
| TACAN | `Request TACAN / TACAN approach / TACAN final` |
| ILS/LOC | `Request ILS / ILS approach / ILS final` |
| RNAV | `Request RNAV / RNAV approach` |
| PAR/GCA | `Request PAR approach / request GCA / request a GCA pickup` |
| Recuperación | `Missed approach`; `breaking out`; `request back to radar`; `runway in sight` |
| Circuito cerrado | `Request closed / closed traffic` |

**Formato de vector:** `Nellis Control, <Callsign>, request vector to <Waypoint>`

| Procedimiento | Puntos válidos |
|---|---|
| High TACAN Runway 08 | `PIUTE` |
| High TACAN Runway 26 | `17 DME` |
| Recuperación VFR/local | `Gate One`; `FLUSH`; `JAYSN`; `STRYK` |
| Puntos de aproximación final | `Runway 08 FAF`; `Runway 13 FAF`; `Runway 26 FAF`; `Runway 31 FAF` |
| Circuito radar | `Downwind`; `Base` |

**Ejemplo:** `Nellis Control, Dodge Two One, request high TACAN Runway Zero Eight`

## 06 Range Control

**BLACKJACK UHF 377.800 | VHF 125.300**

**Formato estándar:** `Blackjack, <Callsign>, <Command>`

| Propósito | Formulación VoiceAttack |
|---|---|
| Contacto inicial | `Checking in [at] <range gate / named point>` |
| Salida | `Checking out [at / from] <location>` |
| Regreso a Creech | `RTB for recovery at Creech / Indian Springs` |
| Aproximación a Creech | `RTB for approach to Creech / Indian Springs` |
| Solicitud de vector | `Request vector to <named range point>` |
| Estado/apoyo | `Words`; `say winds`; `pressure`; `request tanker when available` |

### Flujo Creech / Indian Springs

1. Informa a Blackjack de que estás saliendo o regresando (`RTB`) para Creech / Indian Springs.
2. Contacta con Nellis Control y solicita el servicio de recuperación o aproximación requerido.
3. Contacta con Indian Springs Tower cuando se te indique o cuando estés establecido para el procedimiento local.

### Puntos del área

- Puertas: `Gate One`; `Gate Two`; `Gate Three`; `Gate Four`.
- Puntos con nombre: `Point Alpha`; `Point Bravo`; `Point Charlie`; `Point Delta`; `Point Echo`; `Point Foxtrot`; `Point Golf`; `Point Hotel`.

**Ejemplo:** `Blackjack, Dodge Two One, RTB for approach to Indian Springs`

## 07 Comandos que solo requieren callsign

**Formato estándar:** `<Callsign>, <Command>`

| Propósito | Comando reconocido |
|---|---|
| Circuito | `Initial`; `ready overhead`; `high key`; `low key`; `extending downwind`; `request closed traffic` |
| Aterrizaje | `Left / right base, <gear report>, <landing intention>`; `three / five miles, <gear report>, <landing intention>` |
| Radar | `Missed approach`; `breaking out`; `request back to radar` |
| Visual | `Runway in sight`; `traffic in sight`; `no joy`; `say winds` |
| Estado | `IFR / VFR` |
| Informe de punto | `Reporting a valid Creech / Indian Springs or Nellis Control waypoint` |

**Ejemplo:** `Dodge Two One, runway in sight`
