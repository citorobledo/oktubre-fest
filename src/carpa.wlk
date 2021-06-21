import persona.*
import cerveza.*
class Carpas {
	const property limitePersonas =0
	var property personasEnCarpa = []
	const property tieneMusicaTrad = false
	const property marcaCerveza = ""
	const property estiloCerveza = ""

	method cantPersonas() = personasEnCarpa.size()
	method permitirIngreso(unaPersona) = self.cantPersonas() +1 <= limitePersonas and not unaPersona.estaEbria()
	method puedeEntrar(unaPersona) = unaPersona.quiereEntrar(self) and self.permitirIngreso(unaPersona)
	method ingresarACarpa(unaPersona){
		if (self.puedeEntrar(unaPersona)){
			personasEnCarpa.add(unaPersona)
			}
		else{
			self.error("la casa se reserva el derecho de admision")
			}
		}
	method cervezaAJarra(unEstilo, marca){
		var resultado = null
		if (unEstilo == "CervezaRubia"){
			resultado = new CervezaRubia(marca = marcaCerveza)
			}
		else if (unEstilo == "CervezaRoja"){
			resultado = new CervezaRoja(marca = marcaCerveza)
			}
		else{
			resultado = new CervezaNegra(marca = marcaCerveza)
		}
		return resultado
		}
	method servirJarra(unaPersona, litros){
		if (personasEnCarpa.contains(unaPersona)){
			personasEnCarpa.find({per=>per == unaPersona}).comprarJarra(
				new Jarra(capacidad=litros, cervezaEnJarra = self.cervezaAJarra(estiloCerveza, marcaCerveza)))
			}
		else {
			self.error("la persona no esta en la carpa")
			}
		}
//10.Saber cuantos ebrios empedernidos hay dentro de una carpa. Los ebrios empedernidos son los ebrios que todas las jarras que compraron, son de 1 litro ó más.

	method ebriosEmpedernidos()  {
		const ebrios = personasEnCarpa.filter({per=>per.estaEbria()})
		return ebrios.count({per=>per.jarrasCompradas().all( {jar=>jar.capacidad() >= 1}) })
		}
	method esHomogenea() = personasEnCarpa.all({per=>per.nacionalidad() == personasEnCarpa.first().nacionalidad()})
	

	
}
