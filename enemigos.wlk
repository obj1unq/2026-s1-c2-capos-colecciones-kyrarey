import capos.*

object erethia {
    const enemigos = #{caterina, archibaldo, astra}

    method enemigos() = enemigos

    method esPoderoso(personaje) = self.enemigos().all({ e => personaje.puedeVencer(e) })
}

//2.3
object caterina {
    var morada = fortalezaDeAcero
    const poder = 28

    method poder() = poder

    method morada() =  morada

    method morada(lugar) {
        morada = lugar
    }
}

object fortalezaDeAcero {
    var dueño = caterina

    method dueño() = dueño
}

object archibaldo {
    var morada = palacioDeMarmol
    const poder = 16

    method poder() = poder

    method morada() = morada

    method morada(lugar) {
        morada = lugar
    }

}

object palacioDeMarmol {
    var dueño = archibaldo

    method dueño() = dueño
}

object astra {
    var morada = torreDeMarfil
    const poder = 14

    method poder() = poder

    method morada() = morada

    method morada(lugar) {
        morada = lugar
    }
}

object torreDeMarfil {
    var dueño = astra

    method dueño() = dueño
}