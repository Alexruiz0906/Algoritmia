SubProceso subtotal <- LeerPedido()
	Definir subtotal, precio, cantidad Como Real
	subtotal <- 0
	Escribir "Precio del plato (0 para terminar):"
	Leer precio
	Mientras precio <> 0 Hacer
		Escribir "Cantidad:"
		Leer cantidad
		subtotal <- subtotal + precio * cantidad
		Escribir "Precio del plato (0 para terminar):"
		Leer precio
	FinMientras
FinSubProceso

SubProceso resultado <- CalcularPorcentaje(base, porcentaje)
	Definir resultado Como Real
	resultado <- base * porcentaje / 100
FinSubProceso

SubProceso ImprimirFactura(subtotal, impuesto, propina)
	Escribir "----- FACTURA -----"
	Escribir "Subtotal:      $", subtotal
	Escribir "Impuesto (8%): $", impuesto
	Escribir "Propina (10%): $", propina
	Escribir "Total:         $", subtotal + impuesto + propina
FinSubProceso

Algoritmo FacturaRestaurante
	Definir subtotal, impuesto, propina Como Real
	subtotal <- LeerPedido()
	impuesto <- CalcularPorcentaje(subtotal, 8)
	propina <- CalcularPorcentaje(subtotal, 10)
	ImprimirFactura(subtotal, impuesto, propina)
FinAlgoritmo
