# Retos semana 3

## 1. CajeroParqueadero

Patron: ciclo con centinela (el 0 termina), contador y acumulador.

**El bug del robot:** no tenia `Leer valor` dentro del `Mientras`. Como `valor` nunca cambia, la condicion `valor <> 0` siempre es Verdadera y el ciclo es infinito.

### Tabla de traza (4000, 8000, 2000, 0)

| Iteracion | valor leido | valor <> 0 | carros | total |
|---|---|---|---|---|
| inicio | 4000 | V | 0 | 0 |
| 1 | 8000 | V | 1 | 4000 |
| 2 | 2000 | V | 2 | 12000 |
| 3 | 0 | F | 3 | 14000 |

Salida: **Carros atendidos: 3 · Total recaudado: $14000** (OK)

## 2. ValidarPIN

Patrones: intentos limitados (`Repetir ... Hasta Que acceso O intentos = 3`) y contador (`intentos`).

| Caso | PINs ingresados | intentos al salir | acceso | Salida |
|---|---|---|---|---|
| Acierta al primero | 2580 | 1 | V | Bienvenido |
| Acierta al tercero | 1111, 2222, 2580 | 3 | V | Bienvenido |
| Falla 3 veces | 1111, 2222, 3333 | 3 | F | Tarjeta bloqueada |

El caso "acierta al tercero" es el borde: sale por las dos condiciones a la vez, pero se revisa `acceso` y por eso da Bienvenido.

## 3. Calificaciones

Un solo `Para` de 1 a 5, una sola pasada. `mayor` arranca en 0 y `menor` en 5 para que la primera nota siempre los reemplace.

| Patron | Variable |
|---|---|
| Acumulador | suma (promedio = suma / 5) |
| Contador | aprobados (nota >= 3) |
| Maximo y minimo | mayor, menor |
| Bandera | alguienPerdio |

### Tabla de traza (3.5, 2.8, 4.9, 3.0, 4.2)

| i | nota | suma | aprobados | mayor | menor | alguienPerdio |
|---|---|---|---|---|---|---|
| inicio | - | 0 | 0 | 0 | 5 | F |
| 1 | 3.5 | 3.5 | 1 | 3.5 | 3.5 | F |
| 2 | 2.8 | 6.3 | 1 | 3.5 | 2.8 | V |
| 3 | 4.9 | 11.2 | 2 | 4.9 | 2.8 | V |
| 4 | 3.0 | 14.2 | 3 | 4.9 | 2.8 | V |
| 5 | 4.2 | 18.4 | 4 | 4.9 | 2.8 | V |

Salida: promedio 18.4 / 5 = **3.68**, **4** aprobados, mas alta **4.9**, mas baja **2.8**, **"Hay estudiantes en refuerzo"** (OK)

## 4. Piramide

Por fila: `n - fila` espacios y `2 * fila - 1` asteriscos. Con `2 * fila` sale una escalera (error por uno).

Los `Para` llevan `Con Paso 1` para que, en la ultima fila (`Para j <- 1 Hasta 0`), el ciclo de espacios no se ejecute. Sin el paso, algunos perfiles de PSeInt cuentan hacia atras y ponen espacios de mas.

### Traza con altura 4

| fila | espacios (n - fila) | asteriscos (2 * fila - 1) | Linea |
|---|---|---|---|
| 1 | 3 | 1 | `   *` |
| 2 | 2 | 3 | `  ***` |
| 3 | 1 | 5 | ` *****` |
| 4 | 0 | 7 | `*******` |

### Pruebas

```
Altura 1:
*

Altura 4:
   *
  ***
 *****
*******

Altura 6:
     *
    ***
   *****
  *******
 *********
***********
```

## 5. FacturaRestaurante

SubProcesos:
- `LeerPedido()`: lee precio y cantidad hasta que el precio sea 0 y devuelve el subtotal.
- `CalcularPorcentaje(base, porcentaje)`: se usa dos veces, para el impuesto (8) y la propina (10).
- `ImprimirFactura(subtotal, impuesto, propina)`: muestra la factura y el total.

### Traza (25000 x 2, 12000 x 1, 0)

| Paso | Llamada | Resultado |
|---|---|---|
| 1 | LeerPedido(): 25000 x 2 | subtotal = 50000 |
| 2 | LeerPedido(): 12000 x 1 | subtotal = 62000 |
| 3 | LeerPedido(): precio 0 | termina, devuelve 62000 |
| 4 | CalcularPorcentaje(62000, 8) | impuesto = 4960 |
| 5 | CalcularPorcentaje(62000, 10) | propina = 6200 |
| 6 | ImprimirFactura(62000, 4960, 6200) | total = **73160** (OK) |
