Algoritmo Calificaciones
	Definir i, aprobados Como Entero
	Definir nota, suma, promedio, mayor, menor Como Real
	Definir alguienPerdio Como Logico
	suma <- 0
	aprobados <- 0
	mayor <- 0
	menor <- 5
	alguienPerdio <- Falso
	Para i <- 1 Hasta 5 Hacer
		Escribir "Nota del estudiante ", i, ":"
		Leer nota
		// Acumulador
		suma <- suma + nota
		// Contador
		Si nota >= 3 Entonces
			aprobados <- aprobados + 1
		SiNo
			// Bandera
			alguienPerdio <- Verdadero
		FinSi
		// Maximo y minimo
		Si nota > mayor Entonces
			mayor <- nota
		FinSi
		Si nota < menor Entonces
			menor <- nota
		FinSi
	FinPara
	promedio <- suma / 5
	Escribir "Promedio: ", promedio
	Escribir "Aprobados: ", aprobados
	Escribir "Nota mas alta: ", mayor
	Escribir "Nota mas baja: ", menor
	Si alguienPerdio Entonces
		Escribir "Hay estudiantes en refuerzo"
	SiNo
		Escribir "Todos aprobaron"
	FinSi
FinAlgoritmo
