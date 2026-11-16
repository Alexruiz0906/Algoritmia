Algoritmo Parqueadero
	Definir tipo, factura Como Caracter
	Definir minutos, tarifa, horas, valor Como Entero
	Escribir "Tipo de vehiculo (Carro/Moto):"
	Leer tipo
	Escribir "Minutos de permanencia:"
	Leer minutos
	Escribir "Tiene factura del centro comercial? (S/N):"
	Leer factura
	tipo <- Mayusculas(tipo)
	factura <- Mayusculas(factura)
	
	// R1: tipo no valido
	Si tipo <> "CARRO" Y tipo <> "MOTO" Entonces
		Escribir "Tipo no valido"
	SiNo
		// R2: minutos negativos
		Si minutos < 0 Entonces
			Escribir "Minutos negativos"
		SiNo
			Si tipo = "CARRO" Entonces
				tarifa <- 4000
			SiNo
				tarifa <- 2000
			FinSi
			// R3: primeros 15 minutos gratis (incluido el 15)
			Si minutos <= 15 Entonces
				horas <- 0
			SiNo
				// R4: hora o fraccion se cobra completa
				horas <- Trunc((minutos + 59) / 60)
			FinSi
			valor <- horas * tarifa
			// R4: tope diario
			Si valor > 30000 Entonces
				valor <- 30000
			FinSi
			// R5: factura = mitad, despues del tope
			Si factura = "S" Entonces
				valor <- valor / 2
			FinSi
			Escribir "Valor a pagar: $", valor
		FinSi
	FinSi
FinAlgoritmo
