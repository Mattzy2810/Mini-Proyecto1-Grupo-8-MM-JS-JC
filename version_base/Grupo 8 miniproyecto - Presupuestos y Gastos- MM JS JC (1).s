.data
# ============================
# DATOS ALMACENADOS EN MEMORIA
# ============================

dato1:      .word 100      # Presupuesto disponible
dato2:      .word 135      # Gastos registrados
resultado1: .word 0        # Aquí se guardará presupuesto - gastos
resultado2: .word 0        # Aquí se guardará el resultado de la comparación

.text
.globl main

main:
    # ============================
    # CARGA DE DATOS DESDE MEMORIA
    # ============================

    lw $t0, dato1          # $t0 = 100  (presupuesto)
    lw $t1, dato2          # $t1 = 135  (gastos)

    # ==========================================
    # OPERACIÓN ARITMÉTICA: PRESUPUESTO - GASTOS
    # ==========================================

    sub $t2, $t0, $t1      # $t2 = 100 - 135 = -35

    # ==========================================
    # OPERACIÓN DE COMPARACIÓN
    # ==========================================

    sne $t3, $t0, $t1      # $t3 = 1 si presupuesto y gastos son diferentes
                            # Como 100 != 135, entonces $t3 = 1

    # ==========================================
    # ALMACENAMIENTO DE RESULTADOS EN MEMORIA
    # ==========================================

    sw $t2, resultado1     # Guarda -35 en resultado1
    sw $t3, resultado2     # Guarda 1 en resultado2

    # Finalizar programa
    li $v0, 0
    jr $ra
