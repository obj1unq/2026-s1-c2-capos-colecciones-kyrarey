import artefactos.*
import enemigos.*


object rolando {
    const artefactosEnMochila = #{}
    const historialDeEncuentros = []
    var tamañoMochila = 2
    var morada = castilloDePiedra
    var poderBase = 5

    method poderBase() = poderBase

    method poderBase(_poderBase) {
        poderBase = _poderBase
    }

    method tamañoMochila() = tamañoMochila

    method tamañoMochila(_tamañoMochila) {
        tamañoMochila = _tamañoMochila
    }

    method morada(lugar) {
        morada = lugar
    }

    method irAMorada() = morada.almacenarObjetos(self)

    method historialDeEncuentros() = historialDeEncuentros

    method poderConArtefactos() = poderBase + self.sumatoriaPoderDeArtefactos()

    method sumatoriaPoderDeArtefactos() = artefactosEnMochila.sum({a => a.poder(self)})

    method artefactosEnMochila() = artefactosEnMochila

    method encontrarObjeto(artefacto) {
        historialDeEncuentros.add(artefacto) //lo añade aunque no lo recolecte
        if (self.esCapacidadSuficiente()) {
            artefactosEnMochila.add(artefacto)
        }
    }

    method eliminarObjeto(artefacto) {
        artefactosEnMochila.remove(artefacto)
    }

    //libro de hechizos
    method tieneArtefacto(artefactoABuscar) = artefactosEnMochila.contains(artefactoABuscar)

    method poderInvocado() = morada.poderInvocado(self)

    method esCapacidadSuficiente() = (tamañoMochila > artefactosEnMochila.size())
    //self.error ("rolando no tiene la capacidad suficiente")

    method cantidadArtefactos() = artefactosEnMochila.size()

    method posesiones() = artefactosEnMochila + morada.artefactos()

    method batallar() {
        self.poderBase (self.poderBase() + 1 ) //despues de batallar su poder base aumenta
        artefactosEnMochila.forEach({ a => a.usarArtefacto() })
    }

    //2.3 enemigos
    method puedeVencer(enemigo) = (enemigo.poder() < self.poderConArtefactos())

    method puedeConquistarMorada(moradaDeEnemigo) = self.puedeVencer(moradaDeEnemigo.dueño())

    //method artefactoMasPoderosoEnMorada() = morada.artefactoMasPoderoso(self)

    //2.4 poderoso
    method esPoderoso(pais) = pais.esPoderoso(self)

    //2.5 artefacto fatal
    method tieneUnArtefactoFatal(enemigo) = artefactosEnMochila.any({ a => a.poder(self) > enemigo.poder()})
}

object castilloDePiedra {
    const artefactos = #{}

    method artefactos() = artefactos

    method artefactoMasPoderoso(personaje) = artefactos.max({ a => a.poder(personaje) })

    method almacenarObjetos(personaje) {
        artefactos.addAll(personaje.artefactosEnMochila())
        personaje.artefactosEnMochila().clear()
    }

    method poderInvocado(personaje) {
        if (artefactos.isEmpty() ) {
            return 0
        }
        else {
            self.artefactoMasPoderoso(personaje).poder(personaje)
        }
    }
}

