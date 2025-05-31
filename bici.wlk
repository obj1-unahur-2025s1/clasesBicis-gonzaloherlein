class Bicicleta{
  const rodado
  const largo
  const marca
  const accesorios

  method altura() = rodado * 2.5 + 15
  method velocidadCrucero() = if(largo > 120) rodado + 6 else rodado + 2
  method carga() = accesorios.sum({a => a.carga()})
  method pesoTotalDeAccesorios() = accesorios.sum({a => a.peso()})
  method peso() = rodado / 2 + self.pesoTotalDeAccesorios()
  method tieneLuz() = accesorios.any({a => a.esLuminoso()})
  method cantidadDeAccesoriosLivianos() = accesorios.count({a => a.peso() < 1})
  method marca() = marca
  method largo() = largo
  method accesorios() = accesorios
}

object farolito{
  method peso() = 0.5
  method carga() = 0
  method esLuminoso() = true
}

class Canasto{
  const volumen
  method peso() = volumen / 10
  method carga() = volumen * 2
  method esLuminoso() = false
  method initialize(){
    if(!volumen.between(1, 20)){
      self.error(volumen.toString() + " no es un valor entre 1 y 20")
    }
  }
}

class MorralDeBici{
  const largo
  var tieneOjoDeGato
  method peso() = 1.2
  method carga() = largo / 3
  method esLuminoso() = tieneOjoDeGato
  method ponerOjoDeGato() {tieneOjoDeGato = true}
  method sacarOjoDeGato() {tieneOjoDeGato = false}
}