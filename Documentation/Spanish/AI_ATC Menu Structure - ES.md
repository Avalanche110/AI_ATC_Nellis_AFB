# Estructura de menús de AI_ATC

Las teclas `F1`...`F10`, callsigns, nombres propios, procedimientos, puntos de navegación, puertas, designadores y términos operativos se conservan tal como aparecen en el paquete.

## Menú principal

`F1` - AI_ATC

- `F1` - Autorización
- `F2` - Tierra
- `F3` - Torre
- `F4` - Salida
- `F5` - Aproximación
- `F6` - Otras agencias
  - `F1` - BlackJack
  - `F2` - NATCF SALLY
  - `F3` - NATCF LEE
  - `F4` - Repetir última transmisión
  - `F5` - Opciones
  - `F6` - Ala #2
    - `F1` - Mando
      - `F1` - Informar base
        - `F1` - Parada completa
        - `F2` - Toma y despegue
        - `F3` - Aproximación baja
        - `F4` - Option
      - `F1` - Solicitar circuito cerrado
  - `F7` - Ala #3 (misma estructura que Ala #2)
  - `F8` - Ala #4 (misma estructura que Ala #2)

## Autorización

`F1` - AI_ATC > `F1` - Autorización

- `F1` - Salida
  - `F1` - VFR
    - `F1` - FLEX NORTH
    - `F2` - FLEX WEST
    - `F3` - FLEX MMM TRANSITION
    - **HELICOPTER OPTIONS**
      - `F1` - GASS PEAK
      - `F2` - DRY LAKE
      - `F3` - RED HORSE
      - `F4` - SUNRISE
  - `F2` - IFR
    - `F1` - DREAM 7
    - `F2` - FYTTR 7
    - `F3` - MORMON MESA 8
    - **HELICOPTER OPTIONS**
      - `F1` - IFR (NOT IMPLIMENTED YET)
- `F2` - Opciones
  - `F1` - Establecer callsign
    - `F1` - Bluefor: `F1` Aspen, `F2` Chaos, `F3` Cylon, `F4` Dragon, `F5` GunFighter, `F6` Nightmare, `F7` Eagle, `F8` Viper, `F9` Hornet, `F10` Slayer
    - `F2` - Redfor: `F1` Mig, `F2` Stalin, `F3` Flanker, `F4` Fulcrum, `F5` Flogger, `F6` Ivan, `F7` Grape, `F8` Strelka, `F9` Skalpel, `F10` Rapier

### Lectura de la autorización

`F1` - AI_ATC > `F1` - Autorización > `F1` - Colación

- `F1` - `Código transpondedor 1001`
- `F2` - `Código transpondedor 2001`
- `F3` - `Código transpondedor 3001`
- `F4` - `Código transpondedor 4001`
- `F5` - `Código transpondedor 5001`
- `F6` - `Código transpondedor 6001`
- `F7` - `Código transpondedor 7001`
- `F8` - `Código transpondedor 8001`

## Tierra

`F1` - AI_ATC > `F2` - Tierra

- `F1` - Solicitar arranque de motores
- `F1` - Solicitar autorización de rodaje
- Menú auxiliar de pista: `F1` - Solicitar autorización para cruzar la pista; `F1` - Rodar a estacionamiento

## Torre

`F1` - AI_ATC > `F3` - Torre

- `F1` - Solicitar autorización para cruzar 03L
- `F1` - Solicitar autorización para cruzar 03R
- `F1` - Solicitar despegue
- **HELICOPTER OPTION:** `F1` - Solicitar autorización para la plataforma; `F2` - Solicitar comprobación de vuelo estacionario

### Comandos de Torre

- `F1` - Mandos
  - `F1` - Contacto inicial
  - `F1` - Straight In
  - `F2` - Overhead
  - `F3` - SFO
  - `F4` - Solicitar salida
  - `F5` - PAR
- Menú de aproximación instrumental:
  - `F1` - Instrument Straight In
  - `F2` - Blank
  - `F3` - Solicitar regreso a radar
  - `F4` - Blank

### Straight in

`F1` - Mandos > `F1` - Informar a 5 millas

- `F1` - Parada completa
- `F2` - Toma y despegue
- `F3` - Aproximación baja
- `F4` - Option

### OverHead

- `F1` - Mandos > `F1` - Informar inicial
- `F1` - Mandos > `F1` - InformarBase
  - `F1` - Parada completa
  - `F2` - Toma y despegue
  - `F3` - Aproximación baja
  - `F4` - Option

### SFO

- `F1` - Mandos > `F1` - Informar punto alto
- `F1` - Informar punto bajo
- `F1` - Informar base Key
  - `F1` - Parada completa
  - `F2` - Toma y despegue
  - `F3` - Aproximación baja
  - `F4` - Option

### Go around

**VMC**

- `F1` - Mandos
  - `F1` - Solicitar circuito cerrado
  - `F2` - Solicitar regreso a radar
  - `F3` - Aproximación frustrada
  - `F4` - Solicitar DUCK\FLEX

**IMC**

- `F1` - Mandos
  - `F1` - BLANK
  - `F2` - Solicitar regreso a radar
  - `F3` - Aproximación frustrada
- `F1` - Mandos
  - `F1` - Informar FLEX\DUCK
  - `F2` - BLANK
  - `F3` - BLANK
  - `F4` - Solicitar salida

### Menú auxiliar de Torre

- `F2` - Ancillaries
  - `F1` - Traffic in sight
  - `F2` - No Joy
  - `F3` - Acknowledge Extending downwind
  - `F4` - Say winds
  - `F5` - Break out
  - `F6` - Runway insight

## Salida

`F1` - AI_ATC > `F4` - Salida

- `F1` - Contacto inicial
- `F1` - FLASH
- `F1` - Informar
  - `F1` - Informar JUNNO
  - `F2` - Informar FYTTR
  - `F2` - Informar MMM
- `F2` - Vectores a...
  - `F1` - HEREM
  - `F1` - ATALF
  - `F1` - JOGEV
  - `F1` - CUVAX
  - `F1` - ZINAX
  - `F1` - FLEX
  - `F2` - JUNNO
  - `F2` - FYTTR
  - `F2` - DREAM
  - `F2` - MMM
  - `F2` - GASS PEAK
  - `F3` - Vectores a Aeródromo
- **HELICOPTER OPTION:** `F1` FLEX / `F2` GASS PEAK; `F1` NORTH GAP / `F2` DRY LAKE; `F1` I 15 / `F2` SAND DUNES; `F1` SOUTH GAP / `F2` GASS PEAK; `F3` Vectores a Aeródromo
- `F3` - Solicitar Aproximación

## Otras agencias - BLACKJACK

`F6` - Otras agencias > `F1` - BLACKJACK

- `F1` - Contacto inicial
  - `F1` - Gate 1; `F2` - Gate 2; `F3` - Gate 3; `F4` - Gate 4; `F4` - NIXON; `F4` - SARAH
- `F1` - Vector
  - `F1` - Gate, con las mismas puertas y puntos
  - `F2` - Tanker
- `F2` - Check Out, con `Gate 1` a `Gate 4`, `NIXON` y `SARAH`

## Otras agencias - NATCF SALLY

`F6` - Otras agencias > `F2` - NATCF SALLY

- `F1` - VFR: `F1` Gate 3, `F2` Gate 4
- `F2` - IFR: `F1` Gate 3, `F2` Gate 4
- `F1` - Solicitar Vector desde Gate 3: `F1` Gate 3, `F2` DREAM, `F3` ARCOE
- `F1` - Solicitar Vector desde Gate 4: `F1` Gate 4, `F2` ELKXX, `F3` MOOSE, `F4` ACTON
- `F2` - Vectores a Aeródromo

## Otras agencias - NATCF LEE

`F6` - Otras agencias > `F3` - NATCF LEE

- `F1` - VFR: `F1` Gate 1, `F2` Gate 2, `F3` NIXON, `F4` SARAH
- `F2` - IFR: `F1` Gate 1, `F2` Gate 2
- Solicitudes `Solicitar Vector`:
  - Gate 1: `F1` Gate 1, `F2` FLUSH, `F3` JAYSN, `F4` STRYK
  - Gate 2: `F1` Gate 2, `F2` BEATTY, `F3` JAYSN, `F4` STRYK
  - NIXON: `F1` NIXON, `F2` BLANK, `F3` BLANK, `F4` STRYK
  - SARAH: `F1` BLANK, `F2` BLANK, `F3` SARAH, `F4` GASS PEAK
- `F2` - Vectores a Aeródromo

## Aproximación

`F1` - AI_ATC > `F5` - Aproximación

- `F1` - Contacto inicial
- `F1` - Vector: `DUDBE`, `SECRT`, `HOKUM`, `HULPU`, `JENAR`, `JOGEV`, `WILIE`, `KITCH`; `ARCOE`, `RONKY`, `WISTO`, `OLNIE`, `KRYSS`, `SHEET`, `ROTSE`, `JELIR`, `CADOS`, `SESDE`; `NIXON`, `SARAH`, `STRYK`, `GASS_PEAK`, `APEX`, `PHINN`
- `F2` - Informar NAVPOINT (`DUDBE`, `ARCOE`, `ACTON`)
- `F3` - Vectores a Airbase
- `F4` - Cancelar IFR
- `F1` - Solicitar HI-TACAN Yankee\Zulu
- `F2` - Solicitar ILS/LOC
- `F3` - Solicitar TAC 21L
- `F4` - Cancelar IFR
- `F5` - Solicitar PAR
- `F1` - Vectores a Navpoint; `F2` - `BLANK`; `F3` - Vectores a Airbase; `F4` - Cancelar IFR
- `F1` - Contacto inicial... > `F1` VFR / `F2` IFR

### Variantes de aproximación

**APPROACH B2R:** `F1` Contacto inicial; `F1` BLANK; `F2` Solicitar ILS/LOC; `F3` Solicitar TAC 21L; `F4` Cancelar IFR; `F5` Solicitar GCA.

**APPROACH MAP:** `F1` Contacto inicial; `F1` Vectores a ARCOE; `F2` Solicitar ILS/LOC; `F3` Solicitar TAC 21L; `F4` Solicitar departure.

**APPROACH VFR:** `F1` Contacto inicial; vectores a `ACTON`, `APEX`, `PHINN`, `ARCOE`; `F2` Solicitar IFR pick up; `F3` Vectores a Airbase.

## GCA

`F1` - AI_ATC > `F5` - Aproximación > `F1` - GCA Contacto inicial

### En aproximación a Nellis

- `F1` - Vectores a Navpoint
- `F2` - `BLANK`
- `F3` - Vectores a Airbase
- `F4` - Cancelar IFR

### Al hablar con el controlador final

- `F1` - Solicitar
  - `F1` - Solicitar circuito cerrado
  - `F2` - Solicitar regreso a radar
  - `F3` - Aproximación frustrada
  - `F4` - Solicitar DUCK\FLEX
  - `F5` - Parada completa
- `F2` - `BLANK`; `F3` - `BLANK`; `F4` - Cancelar IFR; `F5` - Informar Runway insight

## Repeat Transmission

`F6` - Otras agencias > `F4` - Repetir última transmisión > `F1` - Repetir última transmisión
