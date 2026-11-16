Algoritmo ValidarEdad
	Definir edad Como Entero
	Escribir "Ingrese la edad:"
	Leer edad
	// Valida: edad >= 0 Y edad <= 120
	// Invalida (De Morgan): edad < 0 O edad > 120
	Si edad < 0 O edad > 120 Entonces
		Escribir "Edad invalida"
	SiNo
		Escribir "Edad valida"
	FinSi
FinAlgoritmo
