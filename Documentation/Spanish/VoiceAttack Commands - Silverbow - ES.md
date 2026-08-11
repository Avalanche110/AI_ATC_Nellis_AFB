# AI_ATC - Referencia de comandos de VoiceAttack - Silverbow

**Silverbow · Tonopah Test Range Airfield**  
**Versión AI_ATC:** 1.00 · **Versión del perfil VoiceAttack:** 1.00

## 00 Cómo usar esta referencia

Al cargar por primera vez el perfil de VoiceAttack, di `Set Airbase to Silverbow` y después `Set Callsign Dodge Two One` antes de utilizar cualquier comando ATC. Repite estos comandos cuando cambies el aeródromo activo o el callsign.

| Notación | Significado |
|---|---|
| `<Callsign>` | Callsign seleccionado, por ejemplo `Dodge Two One` |
| `<Runway>` | Pista Silverbow válida: `14` o `32` |
| `<Waypoint>` | Punto de navegación válido para Nellis Control |
| `<Altitude>` | Altitud o nivel de vuelo hablado |
| `<ATIS Code>` | Información `Alpha` a `Zulu` |
| `[Optional]` | La palabra o frase puede omitirse |
| `A / B` | Puede pronunciarse cualquiera de las dos opciones |

Pronuncia el nombre del controlador, el callsign y el comando como una frase continua, salvo cuando se indique que es un comando que solo requiere callsign. Nellis Control proporciona los servicios de radar de salida y aproximación para Silverbow.

## 01 Clearance Delivery

**UHF 233.950 | VHF 119.450**

**Formato estándar:** `Silverbow Clearance, <Callsign>, clearance on request, <Clearance>`

### Autorización VFR

`VFR` selecciona el perfil local de salida VFR.

- **RUNWAY 14 DEPARTURE:** ruta inicial hacia la zona del fijo de aproximación final de la pista `14`.
- **RUNWAY 32 DEPARTURE:** ruta inicial hacia la zona del fijo de aproximación final de la pista `32`.

### Salidas IFR

| Salida hablada | Ruta inicial / altitud |
|---|---|
| `ESSA ONE` | Directo a `ESSA`; altitud inicial `18,000 ft` |
| `JAYSN ONE` | Directo a `JAYSN`; altitud inicial `18,000 ft` |
| `LEAHI ONE` | Directo a `LEAHI`; altitud inicial `18,000 ft` |
| `RANGE TWO` | Directo a `Tonopah TACAN`; altitud inicial `10,000 ft` |
| `SILVER ONE` | Directo a `Tonopah TACAN`; altitud inicial `10,000 ft` |
| `STOFF TWO` | Intercepta el radial `137` hacia `STOFF`; altitud inicial `10,000 ft` |

### Comandos Squawk

- **Código específico:** `Squawk <code>`
- **Código secuencial:** `Squawk 1001 / 2001 / 3001 / 4001 / 5001 / 6001 / 7001 sequential`

**Ejemplo:** `Silverbow Clearance, Dodge Two One, clearance on request, JAYSN One`

## 02 Ground Control

**UHF 335.500 | VHF 127.250**

**Formato estándar:** `Silverbow Ground, <Callsign>, <Command>`

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
| `14` | `One Four` |
| `32` | `Three Two` |

**Ejemplo:** `Silverbow Ground, Dodge Two One, request taxi with information Alpha`

## 03 Tower

**UHF 257.950 | VHF 124.750**

**Formato estándar:** `Silverbow Tower, <Callsign>, <Command>`

| Propósito | Comando reconocido |
|---|---|
| Listo | `Request takeoff / ready for takeoff / ready for departure / number one` |
| Mantener posición | `Holding short [runway] One Four / Three Two` |
| Ascenso | `Request [unrestricted / quick] climb to / through <Altitude>` |
| Helicóptero | `Request hover check / request takeoff from parking` |
| Inicial/overhead | `Initial / at initial / request the overhead / request initial / ready overhead` |
| Circuito especial | `Request high tactical initial / overhead`; `request SFO`; `high key`; `low key` |
| Base | `Left / right base, <gear report>, <landing intention>` |
| Distancia | `Three / five miles, <gear report>, <landing intention>` |
| Directo | `Request straight in / straight-in landing` |
| Circuito cerrado | `Request closed / closed traffic` |
| Otros | `Extending downwind / missed approach / runway in sight / traffic in sight / no joy / say winds` |

**Ejemplo:** `Silverbow Tower, Dodge Two One, left base, gear down, full stop`

## 04 Nellis Control - Departure

**UHF 254.400 | VHF 119.350**

**Formato estándar:** `Nellis Control, <Callsign>, <Command>`

| Propósito | Comando reconocido |
|---|---|
| Contacto inicial | `Checking in` |
| Informe de altitud | `Airborne passing <Altitude> / passing <Altitude>` |
| Informe de punto | `Is / passing / reporting <Waypoint>` |
| Identificación radar | `Flash` |
| Solicitud de aproximación | `Request approach` |

**Formato de vector:** `Nellis Control, <Callsign>, request vector to <Waypoint>`

- `Request vector / request vectors / request a vector`
- `To / for <Waypoint>`

**Fijos de salida IFR:** `ESSAA`; `JAYSN`; `LEAHI`; `Tonopah TACAN`; `STOFF`.

**Ruta local VFR:** `Runway 14 FAF`; `Runway 32 FAF`.

**Formato de informe:** `Nellis Control, <Callsign>, reporting <Waypoint>`

**Ejemplo:** `Nellis Control, Dodge Two One, airborne passing seven thousand`

## 05 Nellis Control - Approach

**UHF 254.400 | VHF 119.350 · SFA UHF 343.725 | VHF 124.950**

**Formato estándar:** `Nellis Control, <Callsign>, <Command>`

### Contacto y estado radar

- `Checking in VFR / IFR`; `is up on frequency`; `cancel IFR`; `request IFR pickup`.
- Informe de punto: `Is / passing / reporting <Waypoint>`.
- Recuperación radar: `Request back to radar`; `breaking out`.
- Aproximación frustrada: `Request missed approach`; `is missed approach`; `going missed approach`.
- Contacto visual: `Runway in sight`.

### Solicitudes de aproximación compatibles

| Servicio | Solicitud reconocida |
|---|---|
| TACAN | `Request TACAN / TACAN approach`; `request TACAN final / vectors to the TACAN final` |
| ILS/LOC | `Request ILS / ILS approach`; `request ILS final / request vectors to the ILS final` |
| RNAV | `Request RNAV / RNAV approach` |
| PAR/GCA | `Request PAR approach / request GCA / request a GCA pickup` |

### Otros comandos

- `Request departure`
- `Request closed / request closed traffic`

### Solicitudes de vector

**Formato:** `Nellis Control, <Callsign>, request vector to <Waypoint>`

| Pista / aproximación | Puntos de navegación válidos |
|---|---|
| Runway 14 TACAN | `COPAR`; `LOZMO`; `HUGER` |
| Runway 14 ILS / RNAV | `JEPAR`; `JANAV`; `OSRIE` |
| Runway 32 TACAN | `HUBON`; `IRAVE`; `ITAVE`; `ITOGE` |
| Runway 32 ILS / RNAV | `JESVO`; `JIREM`; `DRAKO`; `PALAE`; `WATLU`; `RUDII`; `FALAK` |

**Ejemplo:** `Nellis Control, Dodge Two One, request ILS approach`

## 06 Comandos que solo requieren callsign

**Formato estándar:** `<Callsign>, <Command>`

| Propósito | Comando reconocido |
|---|---|
| Circuito | `Initial`; `ready overhead`; `high key`; `low key`; `extending downwind`; `request closed traffic` |
| Aterrizaje | `Left / right base, <gear report>, <landing intention>`; `three / five miles, <gear report>, <landing intention>` |
| Radar | `Missed approach`; `breaking out`; `request back to radar` |
| Visual | `Runway in sight`; `traffic in sight`; `no joy`; `say winds` |
| Estado | `IFR / VFR` |
| Informe de punto | `Reporting a valid Silverbow or Nellis Control waypoint` |

**Ejemplo:** `Dodge Two One, runway in sight`
