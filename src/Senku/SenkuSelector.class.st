Class {
	#name : 'SenkuSelector',
	#superclass : 'BlElement',
	#instVars : [
		'app'
	],
	#category : 'Senku',
	#package : 'Senku'
}

{ #category : 'initialization' }
SenkuSelector >> configurarConApp: arg1 [

	| tmp1 tmp2 tmp3 tmp4 tmp6 |
	app := arg1.
	tmp1 := BlTextElement new.
	tmp6 := 'ELIGE TU TABLERO' asRopedText.
	tmp6 fontSize: 40.
	tmp1
		text: (tmp6 foreground: Color white);
		margin: (BlInsets bottom: 30).
	self addChild: tmp1.
	tmp2 := SenkuBoton new texto: 'Clásico (Inglés)' accion: [
			        app
				        tipoTablero: #ingles;
				        mostrarMenu ].
	tmp3 := SenkuBoton new texto: 'Europeo (Difícil)' accion: [
			        app
				        tipoTablero: #europeo;
				        mostrarMenu ].
	tmp4 := SenkuBoton new texto: 'Diamante' accion: [
			        app
				        tipoTablero: #diamante;
				        mostrarMenu ].
	tmp2 margin: (BlInsets bottom: 10).
	tmp3 margin: (BlInsets bottom: 10).
	tmp4 margin: (BlInsets bottom: 30).
	self
		addChild: tmp2;
		addChild: tmp3;
		addChild: tmp4
]

{ #category : 'initialization' }
SenkuSelector >> initialize [

	super initialize.
	self
		layout: BlLinearLayout vertical alignCenter;
		constraintsDo: [ :arg1 |
				arg1 horizontal matchParent.
				arg1 vertical matchParent ];
		background: Color darkGray;
		padding: (BlInsets top: 50)
]
