// artefactos.wlk
// artefactos.wlk
//2.1
object espadaDelDestino {
    var vecesUsada = 0

    method usarArtefacto() {
        vecesUsada += 1
    }

    method poder(personaje) {
        if (vecesUsada == 0) return personaje.poderBase()
        return (personaje.poderBase() * 0.5)
    }
}

object collarDivino {
    var vecesUsada = 0
    const poderBase = 3

    method usarArtefacto() {
        vecesUsada += 1
    }

    method poder(personaje) {
        if (personaje.poderBase() > 6) return poderBase + vecesUsada
        return poderBase
    }
}

object armaduraDeAceroValyrio {
    const poder = 6

    method usarArtefacto() {}

    method poder(personaje) = poder
}

//2.2
object libroDeHechizos {
    const hechizos = [] 

    method hechizos() = hechizos

    method agregarHechizo(hechizo) {
        hechizos.add(hechizo)
    }

    method usarArtefacto() {
        hechizos.remove(hechizos.head())
    }

    method poder(personaje) {
        if (hechizos.isEmpty()) {
            return 0
        } else {
            return (hechizos.head().poder(personaje)) //poder del primer hechizo
        }
    }
}

//hechizos
object bendicion {
    const poder = 4

    method poder(personaje) = poder
}

object invisibilidad {
    method poder(personaje) = personaje.poderBase()
}

object invocacion {
    method poder(personaje) {
        personaje.poderInvocado()
    }
}