.data
# ============================================================
# 1. DATOS ALMACENADOS EN MEMORIA
# ============================================================
# En esta sección se definen los valores iniciales del problema.
# dato1 representa el presupuesto disponible.
# dato2 representa los gastos realizados.
# resultado1 almacenará el valor de (gastos - presupuesto).
# resultado2 almacenará el resultado de la comparación:
#   1 = presupuesto y gastos son diferentes
#   0 = presupuesto y gastos son iguales
#
# Se mantienen únicamente las variables necesarias para resolver
# el escenario planteado.

dato1:      .word 100              # Presupuesto disponible
dato2:      .word 135              # Gastos registrados
resultado1: .word 0                # Aquí se guardará gastos - presupuesto
resultado2: .word 0                # Aquí se guardará el resultado de sne

# Mensajes utilizados para mostrar el resultado por pantalla.
mensaje_diferencia: .asciiz "Existe diferencia presupuestaria: "
salto_linea:        .asciiz "\n"


.text
.globl main

main:

    # ========================================================
    # 2. CARGA DE DATOS DESDE MEMORIA MEDIANTE lw
    # ========================================================
    # lw significa "Load Word".
    # La instrucción carga una palabra de 32 bits desde memoria
    # hacia un registro.
    #
    # $t0 recibirá el presupuesto.
    # $t1 recibirá los gastos.

    lw $t0, dato1                  # $t0 = 100  (presupuesto)
    lw $t1, dato2                  # $t1 = 135  (gastos)


    # ========================================================
    # 3. OPERACIÓN ARITMÉTICA
    # ========================================================
    # El escenario solicita mostrar el resultado de:
    #
    #       gastos - presupuesto
    #
    # Como gastos = 135 y presupuesto = 100:
    #
    #       135 - 100 = 35
    #
    # El resultado se guarda temporalmente en $t2.

    sub $t2, $t1, $t0             # $t2 = 135 - 100 = 35


    # ========================================================
    # 4. COMPARACIÓN ENTRE PRESUPUESTO Y GASTOS
    # ========================================================
    # sne significa "Set if Not Equal".
    #
    # La instrucción compara los valores de $t0 y $t1:
    #
    #       $t0 != $t1
    #
    # Si son diferentes, $t3 recibe 1.
    # Si son iguales, $t3 recibe 0.
    #
    # En este caso:
    #
    #       100 != 135
    #
    # Por lo tanto:
    #
    #       $t3 = 1

    sne $t3, $t0, $t1             # $t3 = 1 porque 100 != 135


    # ========================================================
    # 5. ALMACENAMIENTO DE RESULTADOS EN MEMORIA MEDIANTE sw
    # ========================================================
    # sw significa "Store Word".
    # La instrucción guarda una palabra de 32 bits desde un
    # registro hacia una posición de memoria.
    #
    # resultado1 recibirá el valor 35.
    # resultado2 recibirá el valor 1.

    sw $t2, resultado1             # resultado1 = 35
    sw $t3, resultado2             # resultado2 = 1


    # ========================================================
    # 6. DECISIÓN: ¿EXISTE DIFERENCIA PRESUPUESTARIA?
    # ========================================================
    # Si $t3 es igual a 0, significa que presupuesto y gastos
    # son iguales, por lo que no existe diferencia.
    #
    # En ese caso el programa salta directamente a Fin.
    #
    # Si $t3 es diferente de 0, continúa y muestra por pantalla
    # el mensaje solicitado junto con el resultado de la resta.

    beq $t3, $zero, Fin            # Si no hay diferencia, terminar


    # ========================================================
    # 7. MOSTRAR EL MENSAJE POR PANTALLA
    # ========================================================
    # syscall con $v0 = 4 imprime una cadena de texto.
    # $a0 debe contener la dirección del mensaje a imprimir.

    li $v0, 4
    la $a0, mensaje_diferencia
    syscall


    # ========================================================
    # 8. MOSTRAR EL RESULTADO NUMÉRICO
    # ========================================================
    # syscall con $v0 = 1 imprime un número entero.
    # El valor a imprimir debe colocarse en $a0.
    #
    # El resultado que queremos mostrar está en $t2:
    #
    #       gastos - presupuesto = 35

    li $v0, 1
    move $a0, $t2
    syscall


    # ========================================================
    # 9. SALTO DE LÍNEA
    # ========================================================
    # Se imprime un salto de línea para que la salida quede
    # ordenada visualmente.

    li $v0, 4
    la $a0, salto_linea
    syscall


Fin:

    # ========================================================
    # 10. FINALIZACIÓN DEL PROGRAMA
    # ========================================================
    # syscall con $v0 = 10 termina correctamente la ejecución.

    li $v0, 10
    syscall
