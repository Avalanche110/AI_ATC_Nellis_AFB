# AI_ATC Nellis AFB

![AI_ATC Nellis AFB(2)](https://github.com/user-attachments/assets/b557d1a7-9c99-491d-a667-46c3e44fe19b)

AI_ATC para Nellis AFB, Creech AFB y Silverbow AF.

## Traducción al español

Esta rama incorpora una localización al español de España preparada por **DMP
(David, GitHub: [DMP-SPAIN](https://github.com/DMP-SPAIN))**. La contribución
traduce los textos visibles de los menús F10, los subtítulos e instrucciones
de AI_ATC y los manuales de uso, manteniendo intacta la lógica Lua.

La traducción no sustituye ni modifica los ficheros originales en inglés: los
ficheros españoles se entregan con el sufijo `.es.lua` para que puedan
revisarse y adoptarse de forma independiente.

### Ficheros Lua traducidos

| Aeródromo | Fichero |
|---|---|
| Nellis AFB | `Lua files/Nellis AFB/AI_ATC_Nellis_v2.9.27.es.lua` |
| Creech AFB | `Lua files/Creech AFB/AI_ATC_Creech_v2.9.27.es.lua` |
| Silverbow AF | `Lua files/Silverbow AF/AI_ATC_Silverbow_v2.9.27.es.lua` |

Se han conservado sin traducir los valores que forman parte de la lógica del
script: claves internas, estados, argumentos de funciones, callsigns,
procedimientos publicados, navpoints, pistas, frecuencias, nombres de audio,
rutas `Airbase_ATC/...`, VFR/IFR, TACAN, ILS/LOC, PAR, GCA y otra terminología
operativa que DCS o el script utiliza como identificador.

### Manuales traducidos

La documentación en español está en `Documentation/Spanish/`:

- Manual de uso de AI_ATC.
- Estructura de menús F10.
- Comandos VoiceAttack de Nellis AFB.
- Comandos VoiceAttack de Creech.
- Comandos VoiceAttack de Silverbow.

Los comandos que el piloto debe pronunciar, callsigns, procedimientos,
frecuencias, teclas F1-F10 y designadores se conservan literalmente dentro
de los ejemplos para no confundir la referencia hablada con la traducción
del texto de ayuda.

## Instalación manual de la localización

1. Haz una copia de seguridad del fichero `.miz` original.
2. Abre el `.miz` con 7-Zip, WinRAR u otra herramienta compatible con ZIP.
3. Dentro de `l10n/DEFAULT/`, sustituye únicamente el fichero del aeródromo
   que quieras traducir por su versión `.es.lua`, quitando `.es` del nombre
   final. Por ejemplo:

   ```text
   AI_ATC_Nellis_v2.9.27.es.lua
   → l10n/DEFAULT/AI_ATC_Nellis_v2.9.27.lua
   ```

4. Mantén la estructura de carpetas, los nombres de los audios y el resto del
   contenido del `.miz` sin cambios.
5. Guarda el archivo y prueba primero la misión Tutorial o una copia de la
   misión principal.

No se deben renombrar variables, claves ni argumentos Lua. La traducción es
para el texto que aparece al piloto; no es una traducción de las órdenes que
el motor necesita internamente.

## Verificación de la contribución

Los tres ficheros traducidos se han validado con el intérprete Lua incluido en
DCS mediante `loadfile`:

```text
AI_ATC_Creech_v2.9.27.es.lua: SYNTAX OK
AI_ATC_Nellis_v2.9.27.es.lua: SYNTAX OK
AI_ATC_Silverbow_v2.9.27.es.lua: SYNTAX OK
```

También se ha comprobado que:

- Los tres ficheros mantienen exactamente su número de líneas original.
- No hay caracteres de reemplazo Unicode (`U+FFFD`).
- Los literales protegidos, argumentos, rutas, ficheros `.ogg` y estructura
  Lua no cambian fuera de los campos visibles.
- Los manuales traducidos están en UTF-8.

## Licencia y atribución

El repositorio upstream declara **CC0 1.0 Universal** en `LICENSE`. Esta
contribución se publica bajo la misma dedicación CC0, en la medida permitida
por la legislación aplicable. La atribución a **DMP / David (DMP-SPAIN)** se
incluye para reconocer el trabajo de traducción y facilitar su revisión; no
implica reclamar la autoría del proyecto AI_ATC original, de sus scripts,
audios, imágenes, manuales originales ni marcas de terceros.

Proyecto original: <https://github.com/Avalanche110/AI_ATC_Nellis_AFB>
