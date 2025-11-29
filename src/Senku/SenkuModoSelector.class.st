Class {
	#name : 'SenkuModoSelector',
	#superclass : 'BlElement',
	#instVars : [
		'app'
	],
	#category : 'Senku',
	#package : 'Senku'
}

{ #category : 'initialization' }
SenkuModoSelector >> configurarConApp: arg1 [

	| tmp1 tmp2 tmp3 tmp4 tmp6 |
	app := arg1.
	tmp1 := BlTextElement new.
	tmp6 := 'ELIGE MODO DE JUEGO' asRopedText.
	tmp6 fontSize: 40.
	tmp1
		text: (tmp6 foreground: Color white);
		margin: (BlInsets bottom: 30).
	self addChild: tmp1.
	tmp2 := SenkuBoton new texto: 'Modo Normal (1 Hueco Inicial)' accion: [
			        app
				        tipoTablero: #normal;
				        mostrarMenu ].
	tmp3 := SenkuBoton new texto: 'Modo Trío (3 Huecos Iniciales)' accion: [
			        app
				        tipoTablero: #trio;
				        mostrarMenu ].
	tmp4 := SenkuBoton new texto: 'Volver al Menú' accion: [ app mostrarMenu ].
	self addChildren: {
			tmp2.
			tmp3.
			tmp4 }
]

{ #category : 'ui requests' }
SenkuModoSelector >> inform: arg1 [

	UIManager default alert: arg1
]

{ #category : 'initialization' }
SenkuModoSelector >> initialize [

	super initialize.
	self
		layout: BlLinearLayout vertical alignCenter;
		constraintsDo: [ :arg1 |
				arg1 horizontal matchParent.
				arg1 vertical matchParent ];
		background: (Color darkGray alpha: 0.9);
		padding: (BlInsets all: 50)
]
