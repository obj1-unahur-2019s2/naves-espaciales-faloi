class Nave {
	const velocidadMaxima = 100000
	const direccionMaxima = 10
	
	var property velocidad 
	var property direccion
	
	method acelerar(cuanto) { 
		velocidad = velocidadMaxima.min(velocidad + cuanto)
	}
	
	method desacelerar(cuanto) { 
		velocidad = 0.max(velocidad - cuanto)
	}
	
	method irHaciaElSol() { direccion = 10 }
	
	method acercarseUnPocoAlSol() { 
		direccion = direccionMaxima.min(direccion + 1)
	}
	
	method ponerseParaleloAlSol() {
		direccion = 0
	}
	
	method prepararViaje() 	  		// me obliga a que las subclases lo definan y falla si no lo hacen
 // method prepararViaje() { } 	  	// si no se redefine, no hace nada
}

class NaveBaliza inherits Nave {
	var property color
	
	method cambiarColorDeBaliza(colorNuevo) {
		color = colorNuevo
	}
	
	override method prepararViaje() {
		color = "verde"
		self.ponerseParaleloAlSol()
	}
}

class NavePasajeros inherits Nave {
	var property cantidadPasajeros
	var property racionesComida
	var property racionesBebida
	
	method cargarComida(cuanto) {
		racionesComida += cuanto
	}
	
	override method prepararViaje() {
		racionesComida += 4 * cantidadPasajeros
		racionesBebida += 6 * cantidadPasajeros
		self.acercarseUnPocoAlSol()
	}
}

class NaveCombate inherits Nave {
	var property estaInvisible
	var property mensajes = []
	var property misilesDesplegados
	
	method primerMensajeEmitido() { return mensajes.first() }
	method ultimoMensajeEmitido() = mensajes.last()
	
	method esEscueta() =
		not mensajes.any { m => m.length() > 30 }
	 // mensajes.all { m => m.length() <= 30 }
		
	method emitioMensaje(mensaje) = 
		mensajes.any { m => m == mensaje }
	 // mensajes.contains(mensaje)	
	 
	method emitirMensaje(mensaje) { mensajes.add(mensaje) }
	 
	override method prepararViaje() {
		estaInvisible = false
		misilesDesplegados = false
		self.acelerar(15000)
		self.emitirMensaje("Saliendo en misión")
	}
}



