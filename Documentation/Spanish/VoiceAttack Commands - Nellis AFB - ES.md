# AI_ATC - Referencia de comandos de VoiceAttack - Nellis AFB

**Versión AI_ATC:** 2.9.27 · **Versión del perfil VoiceAttack:** 1.00

Referencia operativa específica de Nellis AFB. Conserva literalmente los nombres, comandos hablados, callsigns, puntos de navegación, pistas y códigos.

## 00 Cómo usar esta referencia

### Formato hablado estándar

`<Agency>, <Callsign>, <Command>`

### Inicialización del perfil

Al cargar por primera vez el perfil de VoiceAttack, di `Set Airbase to Nellis` y después `Set Callsign Dodge Two One` antes de utilizar cualquier comando ATC. Repite estos comandos de configuración cada vez que cambies el aeródromo activo o el callsign.

### Notación

- `<Callsign>`, `<Runway>`, `<Waypoint>`, `<Altitude>`, `<ATIS Code>` y `<Squawk Code>` deben sustituirse por el valor hablado correspondiente.
- Las palabras entre corchetes pueden omitirse.
- Una barra indica alternativas aceptadas, por ejemplo `left / right` o `to / for`.
- La mayoría de los comandos aceptan solo el callsign, el callsign seguido de un número hablado o el callsign seguido de un entero.
- Las grafías internas incorrectas utilizadas para mejorar el reconocimiento no se muestran como terminología correcta.
- Cada agencia comienza en una página nueva. Usa el encabezado de la página y el bloque de formato estándar para construir la transmisión completa.

### Procedimientos Nellis compatibles

| Procedimiento | Comandos / opciones aceptadas |
|---|---|
| Salidas IFR | `DREAM Seven`; `FYTTR Seven`; `Mormon Mesa Eight` |
| Salidas locales | `FYTTR`; `DREAM`; `Mormon Mesa`; `Gass Peak`; `Dry Lake`; `Red Horse`; `Sunrise` |
| Recuperaciones locales | `STRYK`; `ACTON`; `ARCOE`; `Gass Peak`; `Dry Lake`; `Red Horse`; `Sunrise` |
| Aproximaciones instrumentales | `ILS`; `High ILS`; `TACAN`; `High TACAN Yankee`; `High TACAN Zulu`; `PAR/GCA` |
| Pistas | `03 Left`; `03 Right`; `21 Left`; `21 Right` |
| Entradas NATCF | `Gate One`; `Gate Two`; `Gate Three`; `Gate Four`; `NIXON`; `SARAH` |

**Ejemplo:** `Nellis Tower, Dodge Two One, left base, gear down, full stop`

## 01 Clearance Delivery

**UHF 289.400 // VHF 120.900**

**Formato estándar:** `Nellis Clearance, <Callsign>, clearance on request, <Departure>`

### Salidas VFR

| Opción VoiceAttack | Formulación aceptada / salida asociada |
|---|---|
| `FLEX NORTH` | `FLEX North`; `north-east`; `north-east departure`; `VFR` |
| `FLEX WEST` | `FLEX West`; `north-west`; `north-west departure` |
| `FLEX NORTH M TRANSITION` | `FLEX North M transition`; `M transition`; `south-east`; `south-east departure` |

### Autorizaciones de helicóptero

| Opción | Ruta aceptada |
|---|---|
| `GASS PEAK` | `Gass Peak - via FLEX` |
| `DRY LAKE` | `Dry Lake - via North Gap` |
| `RED HORSE` | `Red Horse - via I-15 and Sand Dunes` |
| `SUNRISE` | `Sunrise / Sunrise departure - via South Gap` |

### Salidas IFR

| Salida IFR | Formulación aceptada | Ruta Nellis |
|---|---|---|
| `DREAM 7` | `DREAM Seven`; `DREAM Seven departure` | `03L: HEREM - JUNNO` · `03R: ATALF - JUNNO` |
| `FYTTR 7` | `FYTTR Seven`; `FYTTR Seven departure` | `03L/03R: JOGEV - FYTTR` |
| `MORMON MESA 8` | `Mormon Mesa`; `Mormon Mesa Eight`; `Mormon Mesa Eight departure` | `03L: CUVAX - MMM` · `03R: ZINAX - MMM` |

### Comandos Squawk

- **Código específico:** `Squawk <Squawk Code>`
- **Código secuencial:** `Squawk 1001 / 2001 / 3001 / 4001 / 5001 / 6001 / 7001 [sequential] [<Callsign>]`

**Ejemplo:** `Nellis Clearance, Dodge Two One, clearance on request, FYTTR Seven`

## 02 Ground Control

**UHF 275.800 // VHF 121.800**

**Formato estándar:** `Nellis Ground, <Callsign>, <Command>`

| Comando | Formulación aceptada / opciones |
|---|---|
| Arranque de motores | `Request engine start` |
| Rodaje | `Request taxi`; `request taxi to runway` |
| Rodaje con ATIS | `Request taxi with [information] <ATIS Code>` |
| Mantener posición | `Holding short [runway] 03 Left / 03 Right / 21 Left / 21 Right` |
| Rodaje a estacionamiento | `Request taxi to park`; `request taxi to parking` |

### Nombres de calles de rodaje Nellis

`Alpha`; `Bravo`; `Charlie`; `Delta`; `Echo`; `Foxtrot`; `Golf`; `Hotel`

**Nota de pistas:** las salidas normales utilizan `03L` o `03R`. Las llegadas normales utilizan `21L` o `21R`.

**Ejemplo:** `Nellis Ground, Dodge Two One, request taxi with information Alpha`

## 03 Tower

**UHF 327.000 // VHF 132.550**

**Formato estándar:** `Nellis Tower, <Callsign>, <Command>`

| Tipo | Formulación aceptada / opciones |
|---|---|
| Preparación para salida | `Request take-off`; `ready for take-off`; `ready for departure`; `number one` |
| Mantener posición | `Holding short [runway] 03 Left / 03 Right / 21 Left / 21 Right` |
| Solicitud de ascenso | `Request [unrestricted / quick] climb [to / through] [flight level] <Altitude>` |
| Overhead | `Request the overhead`; `request initial`; `initial`; `at initial`; `ready overhead` |
| Alta táctica | `Request high tactical initial`; `request high tactical overhead` |
| Circuito SFO | `Request SFO`; `request simulated flame-out`; `high key`; `low key` |
| Base | `Left / right base, with the gear / gear down / three green, stop / full stop / touch and go / low approach / option` |
| Distancia | `Three / five miles, with the gear / gear down / three green, stop / full stop / touch and go / low approach / option` |
| Acciones en circuito | `Request straight in`; `request closed traffic`; `extending downwind`; `rolling out` |
| Informes | `Runway in sight`; `traffic in sight`; `no joy`; `say winds`; `missed approach`; `breaking out`; `request back to radar` |

**Ejemplo:** `Nellis Tower, Dodge Two One, left base, gear down, full stop`

## 04 Departure

**UHF 385.400 // VHF 135.100**

**Formato estándar:** `Nellis Departure, <Callsign>, <Command>`

| Comando | Formulación aceptada |
|---|---|
| Contacto inicial | `Checking in` |
| Informe de altitud | `Airborne passing / passing <Altitude>` |
| Informe de punto | `Is / passing / reporting <Waypoint>` |
| Solicitud de vectores | `Request vector / request vectors / request a vector [to / for] <Waypoint>` |
| Solicitud de aproximación | `Request approach` |
| Flash | `Flash` |

Utiliza únicamente un punto de navegación de la tabla de salidas Nellis y pronuncia el nombre del fijo exactamente como aparece.

| Grupo | Destinos de vector válidos |
|---|---|
| Fijos SID IFR | `DREAM 7: HEREM, ATALF, JUNNO` · `FYTTR 7: JOGEV, FYTTR` · `MORMON MESA 8: CUVAX, ZINAX, MMM` |
| Fijos locales/VFR | `FLEX`, `DREAM`, `Gass Peak`, `North Gap`, `Dry Lake`, `I-15`, `Sand Dunes`, `South Gap` |

**Ejemplo:** `Nellis Departure, Dodge Two One, request vector to JUNNO`

## 05 Approach / GCA

**Approach UHF 273.550 // GCA UHF 343.725 // VHF 124.950**

**Formato estándar:** `Nellis Approach / Nellis GCA, <Callsign>, <Command>`

| Comando | Formulación aceptada |
|---|---|
| Contacto inicial | `Checking in [VFR / IFR]`; `is up on frequency` |
| Estado IFR | `Cancel IFR`; `request IFR pickup` |
| ILS | `Request ILS`; `request ILS approach`; `request ILS final`; `request vectors to the ILS final` |
| ILS alto | `Request high ILS` |
| TACAN | `Request TACAN`; `request TACAN approach`; `request TACAN final`; `request vectors to the TACAN final` |
| TACAN alto | `Request high TACAN Yankee`; `request high TACAN Zulu` |
| PAR/GCA | `Request PAR approach`; `request GCA`; `request a GCA pickup` |
| Otros | `Request closed traffic`; `missed approach`; `request DUCK`; `breaking out`; `request back to radar`; `runway in sight` |

Solicita vectores a un fijo de aproximación, de recuperación local o de aproximación final de la lista siguiente. No uses puntos de navegación no relacionados del perfil.

**Fijos instrumentales:** `ARCOE`, `CADOS`, `DUDBE`, `HOKUM`, `HULPU`, `JELIR`, `JENAR`, `JOGEV`, `KITCH`, `KRYSS`, `KUTME`, `OLNIE`, `RONKY`, `ROTSE`, `SECRT`, `SESDE`, `SHEET`, `WILIE`, `WISTO`.

**Fijos de recuperación local:** `ACTON`, `APEX`, `ARCOE`, `STRYK`, `NIXON`, `SARAH`, `PHINN`, `Gass Peak`, `FLEX`, `North Gap`, `Dry Lake`, `I-15`, `Sand Dunes`, `South Gap`.

**Final/interceptación:** `Final Approach Fix`; `Radar Downwind`; `Radar Base`; `Lake`; `North Point`; `South Point`; `Point Alpha`; `Point Bravo`.

**Ejemplo:** `Nellis Approach, Dodge Two One, request vector to KRYSS`

## 06 Nellis Control / NATCF

**SALLY UHF 317.525 / VHF 126.650 // LEE UHF 254.400 / VHF 119.350**

**Formato estándar:** `Nellis Control / NATCF Sally / NATCF Lee, <Callsign>, <Command>`

| Operación | Formulación VoiceAttack |
|---|---|
| Salida de Silverbow | `Departing [at / from] Silverbow [VFR / IFR]` |
| Contacto/salida de Silverbow | `Checking in / checking out [at / from] Silverbow` |
| Recuperación Creech | `Request [VFR / IFR] approach / recovery [to / at / for] Creech` |
| Recuperación Indian Springs | `Request [VFR / IFR] approach / recovery [to / at / for] Indian Springs` |
| Recuperación Silverbow | `Request [VFR / IFR] approach / recovery [to / at / for] Silverbow` |
| Contacto/salida | `Checking in / checking out [at / from] [VFR / IFR] <Entry Point> [VFR / IFR]` |
| Salida/RTB | `Departing / RTB [at / from] <Entry Point>` |
| Estado | `[Request / is] IFR / VFR` |
| Solicitud de recuperación | `Request [VFR / IFR] approach / recovery [to / at / for] Creech / Indian Springs / Silverbow` |
| Solicitud de vector | `Request vector [to / for] <Entry Point or Route Fix>` |

**Puntos de entrada y rutas:** `Gate One`; `Gate Two`; `Gate Three`; `Gate Four`; `NIXON`; `SARAH`.

- `Gate One`: `FLUSH - JAYSN - STRYK`
- `Gate Two`: `Beatty - JAYSN - STRYK`
- `Gate Three`: `DREAM - ARCOE`
- `Gate Four`: `ELKXX - MOOSE - ACTON`
- `NIXON`: `NIXON - STRYK`
- `SARAH`: `SARAH - Gass Peak`

**Ejemplo:** `Nellis Control, Dodge Two One, checking in at Gate One IFR`

## 07 Range Control

**BLACKJACK UHF 377.800 // VHF 125.300**

**Formato estándar:** `Blackjack / Hammerhead, <Callsign>, <Command>`

| Comando | Formulación aceptada |
|---|---|
| Contacto | `Checking in [at] Gate One / Gate Two / Gate Three / Gate Four / NIXON / SARAH / Silverbow` |
| Salida | `Checking out [at / from] Gate One / Gate Two / Gate Three / Gate Four / NIXON / SARAH / Silverbow` |
| RTB | `RTB [at / from] <Location>`; `RTB for recovery at Silverbow`; `RTB for approach to Silverbow` |
| Solicitud de vector | `Request vector to Gate One / Gate Two / Gate Three / Gate Four / NIXON / SARAH / Tanker` |

Para salidas y recuperaciones de Silverbow: `Checking out [at / from] Silverbow`, `RTB for recovery at Silverbow` o `RTB for approach to Silverbow`. Para Creech/Indian Springs, sal con Blackjack y después solicita la recuperación al destino a Nellis Control/NATCF.

**Puntos de informe del área:** `Point Alpha`; `Point Bravo`; `Point Charlie`; `Point Delta`; `Point Echo`; `Point Foxtrot`; `Point Golf`; `Point Hotel`.

**Nota operativa:** Range Control se incluye porque forma parte de las operaciones normales del NTTR que se originan en Nellis.

## 08 Comandos que solo requieren callsign

**Formato estándar:** `<Callsign>, <Command>`

| Tipo | Formulación aceptada |
|---|---|
| Posición en circuito | `Initial`; `ready overhead`; `high key`; `low key`; `extending downwind` |
| Base | `Left / right base, with the gear / gear down / three green, full stop / touch and go / low approach / option` |
| Distancia | `Three / five miles, with the gear / gear down / three green, full stop / touch and go / low approach / option` |
| Informes visuales | `Runway in sight`; `traffic in sight`; `no joy` |
| Acciones radar | `Missed approach`; `breaking out`; `request back to radar`; `request closed traffic` |
| Estado | `IFR`; `VFR`; `request IFR`; `request VFR`; `is IFR`; `is VFR` |
| Informe de punto | `Is / passing / reporting DUCK / FLEX / Tiger / Eagle / Falcon / North Point / South Point / Point Alpha / Point Bravo / PIUTE` |
| Otros | `Say winds`; `squawk <code> [sequential]` |

**Ejemplo:** `Dodge Two One, runway in sight`
