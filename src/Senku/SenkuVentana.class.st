Class {
	#name : 'SenkuVentana',
	#superclass : 'BlElement',
	#instVars : [
		'juego',
		'seleccion',
		'elementos'
	],
	#category : 'Senku',
	#package : 'Senku'
}

{ #category : 'ui building' }
SenkuVentana >> armar [

	| tmp2 tmp3 |
	self removeChildren.
	elementos ifNil: [ elementos := OrderedCollection new ] ifNotNil: [ elementos removeAll ].
	1 to: 7 do: [ :tmp1 |
			1 to: 7 do: [ :tmp4 |
					tmp2 := nil.
					tmp3 := nil.
					tmp2 := juego tablero getCasillaAtRow: tmp1 column: tmp4.
					(tmp2 notNil and: [ tmp2 esJugable ])
						ifTrue: [
								tmp3 := SenkuFicha new configurar: tmp2 juego: juego visual: self.
								elementos add: tmp3.
								self addChild: tmp3 ]
						ifFalse: [
								| tmp6 |
								tmp6 := BlElement new.
								tmp6 extent: 64 @ 64.
								self addChild: (tmp6 visibility: BlVisibility hidden) ] ].
			1 ].
	1
]

{ #category : 'game logic' }
SenkuVentana >> chequearFinDeJuego [

	| tmp1 |
	tmp1 := juego obtenerResultado.
	(tmp1 = #victoria or: [ tmp1 = #derrota ]) ifTrue: [
			self mostrarAlertaFinalSegura: tmp1.
			self children copy do: [ :arg1 | self removeChild: arg1 ] ]
]

{ #category : 'game logic' }
SenkuVentana >> esDestinoValido: arg1 [

	seleccion ifNil: [ ^ false ] ifNotNil: [ seleccion ].
	^ ReglasSenku
		  esMovimientoValidoEn: juego tablero
		  origen: {
				  seleccion fila.
				  seleccion columna }
		  destino: {
				  arg1 fila.
				  arg1 columna }
]

{ #category : 'game logic' }
SenkuVentana >> esSeleccionada: arg1 [

	^ arg1 = seleccion
]

{ #category : 'initialization' }
SenkuVentana >> initialize [

	| tmp2 |
	super initialize.
	juego := JuegoSenku new initialize.
	elementos := OrderedCollection new.
	seleccion := nil.
	self
		background: Color lightGray;
		constraintsDo: [ :arg1 |
				arg1 horizontal fitContent.
				arg1 vertical fitContent ].
	tmp2 := BlGridLayout horizontal.
	tmp2 cellSpacing: 5.
	self
		layout: (tmp2 columnCount: 7);
		armar
]

{ #category : 'accessing' }
SenkuVentana >> juego [

	^ juego
]

{ #category : 'ui building' }
SenkuVentana >> mostrarAlertaFinalSegura: arg1 [

	| tmp1 tmp2 |
	tmp1 := arg1 = #victoria
		        ifTrue: [ '¡VICTORIA! 🏆' ]
		        ifFalse: [ 'JUEGO TERMINADO: DERROTA ❌' ].
	tmp2 := 32 - juego fichasRestantes.
	UIManager default alert: (String streamContents: [ :arg2 |
				 arg2
					 nextPutAll: tmp1;
					 cr;
					 cr;
					 nextPutAll: 'Movimientos realizados: ' , juego movimientos asString;
					 cr;
					 nextPutAll: 'Fichas restantes: ' , juego fichasRestantes asString;
					 cr;
					 nextPutAll: 'Fichas comidas: ' , tmp2 asString;
					 cr ])
]

{ #category : 'ui building' }
SenkuVentana >> mostrarMensaje: arg1 [

	UIManager default alert: arg1
]

{ #category : 'event handling' }
SenkuVentana >> procesarClick: arg1 [

	seleccion ifNotNil: [
			(juego
				 moverDe: {
						 seleccion fila.
						 seleccion columna }
				 a: {
						 arg1 fila.
						 arg1 columna }) ifTrue: [
					seleccion := nil.
					self
						refrescar;
						chequearFinDeJuego.
					^ self ] ].
	arg1 tieneFicha
		ifTrue: [
				(seleccion notNil and: [ seleccion fila = arg1 fila and: [ seleccion columna = arg1 columna ] ])
					ifTrue: [ seleccion := nil ]
					ifFalse: [ seleccion := arg1 ] ]
		ifFalse: [ seleccion := nil ].
	self
		refrescar;
		chequearFinDeJuego
]

{ #category : 'ui building' }
SenkuVentana >> refrescar [

	elementos do: [ :arg1 | arg1 actualizarVisual ]
]
