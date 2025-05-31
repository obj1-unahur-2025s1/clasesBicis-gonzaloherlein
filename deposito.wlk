import bici.*
class Deposito{
    const bicicletas = []

    method agregarBicicletas(listaDeBicis) {
        if(listaDeBicis.any({b => bicicletas.contains(b)})){
            throw new Exception(message="No se puede agregar dos veces una bici al deposito")
        }
        if(listaDeBicis.any({b => listaDeBicis.occurrencesOf(b) > 1})){
            self.error("No se admiten bicicletas repetidas dentro de la lista de las nuevas bicis")
        }
        bicicletas.addAll(listaDeBicis)
    }

    method bicicletasMasRapidas() = bicicletas.filter({b => b.velocidadCrucero() > 25})
    method coleccionDeMarcas() = bicicletas.map({b => b.marca()})
    method esNocturno() = bicicletas.all({b => b.tieneLuz()})
    method tieneBicicletaParaLlevar(carga) = bicicletas.any({b => b.carga() > carga})
    method marcaDeBiciMasRapida() = bicicletas.max({b => b.velocidadCrucero()}).marca()
    method bicisMasLargas() = bicicletas.filter({b => b.largo() > 170})
    method cargaTotalDeBicisLargas() = self.bicisMasLargas().sum({b => b.carga()})
    method cantidadDeBicisSinAccesorios() = bicicletas.count({b => b.accesorios().isEmpty()})
    method bicisCompanierasDe_(bicicleta) = bicicletas.filter({b => b != bicicleta && b.marca() == bicicleta.marca() && (b.largo() - bicicleta.largo()) <= 10})

}