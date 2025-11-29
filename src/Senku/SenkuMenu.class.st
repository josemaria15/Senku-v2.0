Class {
	#name : 'SenkuMenu',
	#superclass : 'BlElement',
	#instVars : [
		'app'
	],
	#category : 'Senku',
	#package : 'Senku'
}

{ #category : 'initialization' }
SenkuMenu >> configurarConApp: arg1 [

	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 |
	app := arg1.
	tmp1 := BlTextElement new.
	tmp1 text: ('SENKU PHARO' asRopedText fontSize: 50).
	tmp1 text foreground: Color white.
	tmp1 margin: (BlInsets bottom: 40).
	self addChild: tmp1.
	tmp2 := SenkuBoton new texto: 'Iniciar Juego' accion: [ app iniciarJuego ].
	tmp3 := SenkuBoton new texto: 'Elegir Tablero' accion: [ app mostrarSelectorTablero ].
	tmp4 := SenkuBoton new texto: 'Modo de Juego' accion: [ app mostrarSelectorModo ].
	tmp5 := SenkuBoton new texto: 'Reglas del Juego' accion: [ app mostrarReglas ].
	tmp6 := SenkuBoton new texto: 'Salir' accion: [ app cerrar ].
	self
		addChild: tmp2;
		addChild: tmp3;
		addChild: tmp4;
		addChild: tmp5;
		addChild: tmp6
]

{ #category : 'initialization' }
SenkuMenu >> initialize [

	super initialize.
	self
		layout: BlLinearLayout vertical alignCenter;
		constraintsDo: [ :arg1 |
				arg1 horizontal matchParent.
				arg1 vertical matchParent ];
		background: Color darkGray;
		padding: (BlInsets top: 50)
]
