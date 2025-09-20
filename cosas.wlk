object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() { return 1 }
	method accidentada() {}
}

object arenaAGranel {
	var property peso = 0
	method nivelPeligrosidad() { return 1 }
	method bultos() { return 1 }
	method accidentada() { peso += 20 }
}

object bumblebee {
	var property esAuto = true

	method peso() { return 800 }
	method nivelPeligrosidad() {
		if (esAuto) { return 15 }
		else { return 30 }
	}
	method bultos() { return 2 }
	method accidentada() { esAuto = not esAuto }
}

object paqueteDeLadrillos {
	var property cantLadrillos = 1
	
	method peso() { return 2*cantLadrillos }
	method nivelPeligrosidad() { return 2 }
	method bultos() {
		if(cantLadrillos <= 100){
			return 1
		}
		else if (cantLadrillos >= 101 && cantLadrillos <= 300){
			return 2
		}
		else{
			return 3
		}
	}
	method accidentada() { 
		if (cantLadrillos >= 12) {cantLadrillos -= 12}
		else {cantLadrillos = 0}
	}
}

object bateriaAntiaerea {
	var property estaCargada = true // Osea, tiene misiles

	method peso(){
		if(estaCargada){ return 300 } 
		else { return 200 }
	}

	method nivelPeligrosidad(){
	    if(estaCargada){ return 100 } 
		else { return 0 }
	}

	method bultos(){
		if(estaCargada){ return 2 } 
		else { return 1 }
	}

	method accidentada() {estaCargada = false}
}

object residuosRadiactivos {
	var property peso = 0
	method nivelPeligrosidad(){ return 200 }
	method bultos() { return 1 }
	method accidentada() { peso += 15 }
}

object contenedorPortuario {
	const property cosas = #{}
	method peso() { return 100 + cosas.sum{cosa => cosa.peso()} }
	method nivelPeligrosidad() { 
		if(cosas == #{}){ return 0 }
		else{ return (cosas.max{cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad() } 
	}

	method bultos(){ return 1 + cosas.sum{cosa => cosa.bultos()} }


	method cargar(unaCosa){
		cosas.add(unaCosa)
	}

	method accidentada() {cosas.forEach{cosa => cosa.accidentada()}}

}

object embalajeDeSeguridad {
	var cosaEnvuelta = bumblebee
	method cosaEnvuelta(cosa) {cosaEnvuelta = cosa}
	method peso() { return cosaEnvuelta.peso()}
	method nivelPeligrosidad() { return cosaEnvuelta.nivelPeligrosidad() / 2 } 
	method bultos() { return 2 }
	method accidentada() {}
}


