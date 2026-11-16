Algoritmo Piramide
	Definir n, fila, j Como Entero
	Escribir "Altura de la piramide:"
	Leer n
	Para fila <- 1 Hasta n Con Paso 1 Hacer
		// n - fila espacios (en la ultima fila son 0)
		Para j <- 1 Hasta n - fila Con Paso 1 Hacer
			Escribir " " Sin Saltar
		FinPara
		// 2 * fila - 1 asteriscos (con 2 * fila sale una escalera)
		Para j <- 1 Hasta 2 * fila - 1 Con Paso 1 Hacer
			Escribir "*" Sin Saltar
		FinPara
		Escribir ""
	FinPara
FinAlgoritmo
