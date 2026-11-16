# Retos semana 2

## 1. ValidarRegistro

Regla: se registra si `edad >= 14` **Y** `respuesta = "S"`.

### Tabla de verdad

| edad >= 14 | acepta (S) | Resultado |
|---|---|---|
| V | V | Registro |
| V | F | No puede registrarse |
| F | V | No puede registrarse |
| F | F | No puede registrarse |

### Pruebas

| Edad | Respuesta | Esperado | Resultado |
|---|---|---|---|
| 14 | S | Registro | OK |
| 13 | S | No puede registrarse | OK |
| 30 | n | No puede registrarse | OK |
| 14 | s | Registro | OK |

Sin `respuesta <- Mayusculas(respuesta)`, el caso `14 s` falla porque `"s" = "S"` da Falso.

## 2. ValidarEdad

- Valida: `edad >= 0 Y edad <= 120`
- Invalida (Ley de De Morgan): `NO (edad >= 0 Y edad <= 120)` = `edad < 0 O edad > 120`
- La trampa: `edad < 0 Y edad > 120` nunca se cumple, porque ningun numero es menor que 0 y mayor que 120 al mismo tiempo. Con esa condicion todas las edades salen validas.

### Pruebas

| Edad | Esperado | Resultado |
|---|---|---|
| -1 | Edad invalida | OK |
| 0 | Edad valida | OK |
| 120 | Edad valida | OK |
| 121 | Edad invalida | OK |

## 3. Parqueadero

### Tabla de decision

| Regla | Condicion | Accion |
|---|---|---|
| R1 | tipo no es Carro ni Moto | "Tipo no valido" |
| R2 | minutos < 0 | "Minutos negativos" |
| R3 | minutos <= 15 | valor = 0 |
| R4 | minutos > 15 | horas = hora o fraccion; valor = horas x tarifa (Carro 4.000, Moto 2.000); si valor > 30.000 entonces valor = 30.000 |
| R5 | factura = S | valor = valor / 2 (despues del tope) |

Hora o fraccion: `horas <- Trunc((minutos + 59) / 60)`. Asi 60 min = 1 hora y 61 min = 2 horas.

### Casos borde

| # | Tipo | Min | Factura | Esperado | Obtenido | Estado |
|---|---|---|---|---|---|---|
| 1 | Carro | 15 | No | 0 | 0 | OK |
| 2 | Carro | 16 | No | 4.000 | 4.000 | OK |
| 3 | Carro | 60 | No | 4.000 | 4.000 | OK |
| 4 | Carro | 61 | No | 8.000 | 8.000 | OK |
| 5 | Moto | 61 | Si | 2.000 | 2.000 | OK |
| 6 | Carro | 600 | No | 30.000 (tope) | 30.000 | OK |
| 7 | Carro | 600 | Si | 15.000 | 15.000 | OK |
| 8 | 3 | 30 | No | Tipo no valido | Tipo no valido | OK |
| 9 | Carro | -5 | No | Minutos negativos | Minutos negativos | OK |

### Prueba de escritorio (caso 7: Carro, 600 min, con factura)

| Paso | Instruccion | tipo | minutos | factura | tarifa | horas | valor |
|---|---|---|---|---|---|---|---|
| 1 | Leer datos | Carro | 600 | S | - | - | - |
| 2 | tipo <- Mayusculas(tipo) | CARRO | 600 | S | - | - | - |
| 3 | R1: tipo valido, R2: minutos >= 0 | CARRO | 600 | S | - | - | - |
| 4 | tarifa <- 4000 | CARRO | 600 | S | 4000 | - | - |
| 5 | horas <- Trunc((600 + 59) / 60) | CARRO | 600 | S | 4000 | 10 | - |
| 6 | valor <- 10 * 4000 | CARRO | 600 | S | 4000 | 10 | 40000 |
| 7 | valor > 30000: valor <- 30000 | CARRO | 600 | S | 4000 | 10 | 30000 |
| 8 | factura = S: valor <- 30000 / 2 | CARRO | 600 | S | 4000 | 10 | 15000 |
| 9 | Escribir valor | CARRO | 600 | S | 4000 | 10 | **15000** |

### Resumen de los 9 casos

| # | tipo | minutos | factura | tarifa | horas | valor |
|---|---|---|---|---|---|---|
| 1 | CARRO | 15 | N | 4000 | 0 | 0 |
| 2 | CARRO | 16 | N | 4000 | 1 | 4000 |
| 3 | CARRO | 60 | N | 4000 | 1 | 4000 |
| 4 | CARRO | 61 | N | 4000 | 2 | 8000 |
| 5 | MOTO | 61 | S | 2000 | 2 | 4000 -> 2000 |
| 6 | CARRO | 600 | N | 4000 | 10 | 40000 -> 30000 |
| 7 | CARRO | 600 | S | 4000 | 10 | 40000 -> 30000 -> 15000 |
| 8 | 3 | 30 | N | - | - | Tipo no valido |
| 9 | CARRO | -5 | N | - | - | Minutos negativos |

## 4. Semaforo (reto final 1)

### Tabla de decision

| Regla | Condicion | Resultado |
|---|---|---|
| R1 | unidades < 0 | Error |
| R2 | unidades = 0 | Rojo: agotado |
| R3 | 1 <= unidades <= 10 | Amarillo: pedir |
| R4 | unidades > 10 | Verde: todo bien |

### Pruebas de borde

| Unidades | Esperado | Resultado |
|---|---|---|
| -1 | Error | OK |
| 0 | Rojo | OK |
| 1 | Amarillo | OK |
| 10 | Amarillo | OK |
| 11 | Verde | OK |

### Prueba de escritorio

| unidades | unidades < 0 | unidades = 0 | unidades <= 10 | Salida |
|---|---|---|---|---|
| -1 | V | - | - | Error |
| 0 | F | V | - | Rojo: agotado |
| 1 | F | F | V | Amarillo: pedir |
| 10 | F | F | V | Amarillo: pedir |
| 11 | F | F | F | Verde: todo bien |

## 5. Bisiesto (reto final 2)

Condicion: `(anio MOD 4 = 0 Y anio MOD 100 <> 0) O anio MOD 400 = 0`

### Tabla de verdad

| div 4 | NO div 100 | div 400 | (A Y B) O C | Ejemplo |
|---|---|---|---|---|
| V | V | F | V | 2024 |
| V | F | F | F | 1900 |
| V | F | V | V | 2000 |
| F | V | F | F | 2026 |

1900 es la trampa: es divisible entre 4, pero tambien entre 100 y no entre 400, asi que **no** es bisiesto.

### Pruebas

| Anio | Esperado | Resultado |
|---|---|---|
| 2024 | Si | OK |
| 1900 | No | OK |
| 2000 | Si | OK |
| 2026 | No | OK |

### Prueba de escritorio

| anio | anio MOD 4 | anio MOD 100 | anio MOD 400 | A Y B | (A Y B) O C | Salida |
|---|---|---|---|---|---|---|
| 2024 | 0 | 24 | 24 | V | V | es bisiesto |
| 1900 | 0 | 0 | 300 | F | F | no es bisiesto |
| 2000 | 0 | 0 | 0 | F | V | es bisiesto |
| 2026 | 2 | 26 | 26 | F | F | no es bisiesto |
