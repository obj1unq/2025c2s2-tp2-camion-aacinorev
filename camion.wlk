import cosas.*
import almacen.*
import rutas.*

object camion {
	const property cosas = #{}
	const tara = 1000
		
	method cargar(unaCosa){
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}

	method validarCarga(unaCosa){
		if(cosas.contains(unaCosa)){
			self.error("No se puede cargar porque ya está cargada en el camión")
		}
	}

	method descargar(unaCosa){
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}

	method validarDescarga(unaCosa){
		if(not cosas.contains(unaCosa)){
			self.error("No se puede descargar porque no está cargada en el camión")
		}
	}

	method esTodoPesoPar(){
		return (cosas.sum{cosa => cosa.peso()} % 2) == 0
	}

	method hayAlgunoQuePesa(peso){
		return cosas.any{cosa => cosa.peso() == peso}
	}

	method pesoTotal(){
		return tara + cosas.sum{cosa => cosa.peso()}
	}

	method estaExcedidoDePeso(){
		return self.pesoTotal() > 2500
	}

	method laCosaDeNivel(peligrosidad){
		return cosas.find{cosa => cosa.nivelPeligrosidad() == peligrosidad}
	}

	method cosasQueSuperanElNivel(nivel){
		return cosas.filter{cosa => (cosa.nivelPeligrosidad() >= nivel)}
	}

	method cosasMasPeligrosasQue(cosa){
		return self.cosasQueSuperanElNivel(cosa.nivelPeligrosidad())
	}

	method puedeCircularEnRutaDeNivel(peligrosidad){
		return not self.estaExcedidoDePeso() && (#{} == self.cosasQueSuperanElNivel(peligrosidad))
 	}

	method existeCosaQuePesaEntre(min, max){
		return cosas.any{cosa => cosa.peso() >= min} && cosas.any{cosa => cosa.peso() <= max}
	}

	method cosaMasPesada(){
		return cosas.max{cosa => cosa.nivelPeligrosidad()}
	}

	method pesoDeCadaCosa(){
		return cosas.map{cosa => cosa.peso()}
	}

	method bultosTotales(){
		return cosas.sum{cosa => cosa.bultos()}
	}

	method accidente(){
		return cosas.forEach{cosa => cosa.accidentada()}
	}

	method transportar(destino, camino){
		if(camino.soportaViajeDe(self)){
			self.llegarADestino(destino)
		}
		else{
			self.error("El camino no soporta al camion")
		}
	}

	method llegarADestino(destino){
		destino.almacenarLoDe(cosas)
		cosas.clear()
	}
}
