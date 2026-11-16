Algoritmo CajeroParqueadero
	Definir valor, total, carros Como Entero
	total <- 0
	carros <- 0
	Escribir "Valor cobrado (0 para terminar):"
	Leer valor
	Mientras valor <> 0 Hacer
		carros <- carros + 1
		total <- total + valor
		Escribir "Valor cobrado (0 para terminar):"
		// Este Leer es el que faltaba en el codigo del robot
		Leer valor
	FinMientras
	Escribir "Carros atendidos: ", carros
	Escribir "Total recaudado: $", total
FinAlgoritmo
