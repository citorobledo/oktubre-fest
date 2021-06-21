//
import carpa.*
import cerveza.*
class Personas {
	var property peso = 0
	var property jarrasCompradas = []
	const property leGustaMusicaTrad = true
	const property nivelAguante = 0
	const property marcaPreferida = ""
	method estaEbria() = (self.alcholINgerido() * peso) > nivelAguante
	method alcholINgerido() = jarrasCompradas.sum({jarra=>jarra.contAlcohol()})
	method comprarJarra(unaJarra) = jarrasCompradas.add(unaJarra)
	method quiereEntrar(unaCarpa) = marcaPreferida == unaCarpa.marcaCerveza() and (leGustaMusicaTrad == unaCarpa.tieneMusicaTrad() )
	method leSirvieron() =  jarrasCompradas.asSet().map({jar=>jar.marca()})
	method entrandoEnVicio() = jarrasCompradas.all({jar=>jar.capacidad() >= jarrasCompradas.first().capacidad()})
}

class Belga inherits Personas{
	const property nacionalidad = "Belga"
	method leGusta(unaCerveza) = unaCerveza.cantLupulo() > 4 
	method  esPatriota() = jarrasCompradas.all({jar=>jar.cervezaEnJarra().origen() == nacionalidad}) 
}

class Checo inherits Personas{
	const  property nacionalidad = "Checo"
	method leGusta(unaCerveza) = unaCerveza.cantLupulo() > 8
	method  esPatriota() = jarrasCompradas.all({jar=>jar.cervezaEnJarra().origen() == nacionalidad})
}

class Aleman inherits Personas{
	const property nacionalidad = "Aleman"
	method leGusta(unaCerveza) = true
	override method  quiereEntrar(unaCarpa) = super(unaCarpa) and unaCarpa.cantPersonas().even()
	method  esPatriota() = jarrasCompradas.all({jar=>jar.cervezaEnJarra().origen() == nacionalidad})
}