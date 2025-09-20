import camion.*

object ruta9{
    method soportaViajeDe(transporte){
        return transporte.puedeCircularEnRutaDeNivel(20)
    }
}

object caminosVecinales {
    var pesoMaximo = 0
    method pesoMaximo(_pesoMax) {pesoMaximo = _pesoMax}
    method soportaViajeDe(transporte){
        return transporte.pesoTotal() <= pesoMaximo
    }
}