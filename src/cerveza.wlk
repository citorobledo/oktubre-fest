class Cervezas {
	var property marca = ""
	var property cantLupulo = 10 //por litro
	var property origen = ""

}
class CervezaRubia inherits Cervezas{
	var property gradAlcoholica = 5
	override method marca() = "Corona"
}
class CervezaNegra inherits Cervezas{
	const property gradReglamentaria = 5
	method gradAlcoholica() = gradReglamentaria.min( cantLupulo * 2)
	override method marca() = "Guiness"
}
class CervezaRoja inherits Cervezas{
	const property gradReglamentaria = 8
	override method marca() = "Hofbräu"
	method gradAlcoholica() = gradReglamentaria.min( cantLupulo * 2) * 1.25
}

class Jarra {
	const property capacidad = 0 //litros
	var property cervezaEnJarra = null
	method marca() = cervezaEnJarra.marca()
	
	method contAlcohol() = capacidad * (cervezaEnJarra.gradAlcoholica() / 100)
}