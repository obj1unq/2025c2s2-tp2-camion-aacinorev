import camion.*
import cosas.*

object almacen {
    const property cosas = #{}

    method almacenarLoDe(cosasTransporte){
        cosas.addAll(cosasTransporte)
    }

    method almacenar(cosa){
        cosas.add(cosa)
    }
}