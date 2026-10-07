# Miniproyecto - Presupuesto y Gastos

**Asignatura:** UCOM250 - Organización y Arquitectura de Computadores  
**Integrantes:** Matías Mendoza, Jerissel Sanchez y Jorge Cabezas  
**Año:** 2026  
**Fecha:** 7 de octubre de 2026  

---

## Descripción

### Escenario

El proyecto plantea un escenario de control de presupuesto en el que una persona dispone de un presupuesto inicial y registra una cantidad de gastos. El programa debe cargar ambos valores desde memoria, procesarlos mediante instrucciones MIPS y determinar si existe una diferencia entre el presupuesto disponible y los gastos registrados.

Para el desarrollo del escenario se utilizan los siguientes valores:

- Presupuesto disponible: **100**
- Gastos registrados: **135**

### Resultado

El programa compara el presupuesto con los gastos. Si ambos valores son diferentes, debe indicar que existe una diferencia presupuestaria y mostrar el resultado de:

```text
gastos - presupuesto
```

Con los valores utilizados:

```text
135 - 100 = 35
```

Por lo tanto, la salida esperada de la versión final es:

```text
Existe diferencia presupuestaria: 35
```

---

## Análisis

### Datos del programa

| Dato | Valor inicial | Propósito |
|---|---:|---|
| `dato1` | 100 | Representa el presupuesto disponible |
| `dato2` | 135 | Representa los gastos registrados |
| `resultado1` | 0 | Espacio de memoria destinado a guardar el resultado de la resta |
| `resultado2` | 0 | Espacio de memoria destinado a guardar el resultado de la comparación |

### Operaciones requeridas

| Datos / Resultados | Propósito | Operación requerida | Instrucción MIPS |
|---|---|---|---|
| `dato1` | Cargar el presupuesto desde memoria | Carga | `lw` |
| `dato2` | Cargar los gastos desde memoria | Carga | `lw` |
| `resultado1` | Calcular la diferencia entre gastos y presupuesto | Resta | `sub` |
| `resultado2` | Determinar si presupuesto y gastos son diferentes | Comparación | `sne` |
| Control de flujo | Determinar si debe mostrarse el mensaje | Salto condicional | `beq` |
| `resultado1` | Guardar la diferencia calculada | Almacenamiento | `sw` |
| `resultado2` | Guardar el resultado de la comparación | Almacenamiento | `sw` |
| Salida | Mostrar el mensaje y el resultado por pantalla | Llamada al sistema | `syscall` |

---

## Implementación

### Versión base

La carpeta `version_base/` contiene la primera versión del programa desarrollada durante el miniproyecto.

**Archivo:**

[Ver programa base](<version_base/Grupo 8 miniproyecto - Presupuestos y Gastos- MM JS JC (1).s>)

```text
version_base/Grupo 8 miniproyecto - Presupuestos y Gastos- MM JS JC (1).s
```

En esta versión se cargan el presupuesto y los gastos desde memoria utilizando `lw`. Posteriormente se realiza una resta, se utiliza `sne` para determinar si los valores son diferentes y se almacenan los resultados en memoria mediante `sw`.

La versión base constituye el punto de partida del proyecto y todavía no incorpora la presentación completa del resultado por pantalla.

### Versión final

La carpeta `version_final/` contiene la versión final desarrollada por el grupo.

**Archivo:**

[Ver programa final](<version_final/Grupo_8_Avance_2_Presupuesto_Gastos_MM,JS,JC.s>)

```text
version_final/Grupo_8_Avance_2_Presupuesto_Gastos_MM,JS,JC.s
```

En esta versión se mantiene la carga de datos desde memoria y se modifica el procesamiento para calcular:

```text
gastos - presupuesto
```

El resultado obtenido es **35**. Además, se utiliza `sne` para determinar si existe una diferencia entre los dos valores y `beq` para controlar el flujo del programa.

Cuando existe una diferencia presupuestaria, el programa muestra por pantalla:

```text
Existe diferencia presupuestaria: 35
```

Los resultados también son almacenados nuevamente en memoria mediante instrucciones `sw`.

---

## Evidencias de ejecución

Las evidencias se encuentran almacenadas dentro de la carpeta `evidencias/`.

### Código

Las capturas relacionadas con el código se encuentran en:

[Ver evidencias del código](<evidencias/Grupo 8 miniproyecto - Codigo/>)

**Descripción:**  
En estas evidencias se observa el código ensamblador MIPS utilizado para implementar la solución, incluyendo la definición de los datos en memoria, la carga mediante `lw`, la resta, la comparación, el control de flujo y el almacenamiento de los resultados.

### Registros

Las capturas relacionadas con los registros se encuentran en:

[Ver evidencias de registros](<evidencias/Grupo 8 miniproyecto - Registros/>)

**Descripción:**  
En estas evidencias se pueden comprobar los valores utilizados durante la ejecución. El presupuesto se carga con valor **100**, los gastos con valor **135**, la diferencia calculada es **35** y la comparación produce **1**, indicando que los valores son diferentes.

### Resultado

La evidencia del resultado final se encuentra en:

[Ver evidencia del resultado](<evidencias/Evidencias Resultado MiniProyecto G8}.png>)

**Descripción:**  
La captura permite comprobar que, al existir una diferencia entre presupuesto y gastos, el programa presenta el mensaje correspondiente junto con el resultado de **35**.

> **Nota:** Si posteriormente se desea mostrar directamente en este README las capturas que están dentro de las carpetas de Código y Registros, será necesario utilizar el nombre exacto de cada archivo de imagen contenido dentro de esas carpetas.

---

## Conclusiones

El desarrollo del miniproyecto permitió comprender de una forma práctica cómo un problema planteado a partir de una situación cotidiana puede convertirse en una secuencia lógica de instrucciones dentro de un programa en lenguaje ensamblador.

Durante la actividad fue necesario analizar primero qué debía realizar el programa, identificar los datos disponibles y definir el resultado esperado. Esto ayudó a comprender mejor la importancia de organizar la solución antes de comenzar a modificar el código.

Una de las partes que requirió mayor atención fue seguir el recorrido de los datos durante la ejecución y comprobar que cada resultado coincidiera con lo esperado. El uso del simulador permitió observar el comportamiento del programa y verificar progresivamente cada etapa.

La implementación práctica contribuyó a relacionar los conceptos estudiados en clase con una solución funcional. Además, permitió reforzar la importancia de documentar correctamente el desarrollo, mantener una estructura ordenada de archivos y conservar evidencias que permitan comprobar el funcionamiento del programa.

Si se realizara nuevamente la actividad, sería conveniente organizar desde el inicio las versiones del código, las capturas de evidencia y la documentación para simplificar la construcción del repositorio final.

---

## Documentación

El reporte completo del proyecto se encuentra en:

[Ver reporte del proyecto](<documentacion/reporte_proyecto_MM_JS_JC.pdf>)

```text
documentacion/reporte_proyecto_MM_JS_JC.pdf
```

El documento contiene la descripción del escenario, el análisis, la implementación, las evidencias, las conclusiones y la bibliografía del proyecto.

---

## Estructura del repositorio

```text
miniproyecto01/
│
├── README.md
│
├── version_base/
│   └── Grupo 8 miniproyecto - Presupuestos y Gastos- MM JS JC (1).s
│
├── version_final/
│   └── Grupo_8_Avance_2_Presupuesto_Gastos_MM,JS,JC.s
│
├── evidencias/
│   ├── Evidencias Resultado MiniProyecto G8}.png
│   ├── Grupo 8 miniproyecto - Registros/
│   └── Grupo 8 miniproyecto - Codigo/
│
└── documentacion/
    └── reporte_proyecto_MM_JS_JC.pdf
```

---

## Bibliografía

University of New South Wales. (n.d.). *MIPS instruction set*.  
https://cgi.cse.unsw.edu.au/~cs1521/current/resources/mips-guide.html

Patterson, D. A., & Hennessy, J. L. (2021). *Computer organization and design: The hardware/software interface* (6th ed.). Morgan Kaufmann.
