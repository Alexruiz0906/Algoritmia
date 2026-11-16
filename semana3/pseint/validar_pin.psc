Algoritmo ValidarPIN
	Definir pin, intentos Como Entero
	Definir acceso Como Logico
	intentos <- 0
	acceso <- Falso
	Repetir
		Escribir "Ingrese su PIN:"
		Leer pin
		intentos <- intentos + 1
		Si pin = 2580 Entonces
			acceso <- Verdadero
		SiNo
			Escribir "PIN incorrecto. Intentos usados: ", intentos, " de 3"
		FinSi
	Hasta Que acceso O intentos = 3
	Si acceso Entonces
		Escribir "Bienvenido"
	SiNo
		Escribir "Tarjeta bloqueada"
	FinSi
FinAlgoritmo
