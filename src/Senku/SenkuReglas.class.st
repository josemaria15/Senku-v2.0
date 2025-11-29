Class {
	#name : 'SenkuReglas',
	#superclass : 'BlElement',
	#instVars : [
		'app'
	],
	#category : 'Senku',
	#package : 'Senku'
}

{ #category : 'initialization' }
SenkuReglas >> configurarConApp: arg1 [

	| tmp1 tmp2 tmp3 tmp5 tmp7 tmp9 tmp11 tmp13 tmp15 |
	app := arg1.
	tmp1 := BlTextElement new.
	tmp5 := 'REGLAS DEL JUEGO' asRopedText.
	tmp5 fontSize: 40.
	tmp1
		text: (tmp5 foreground: Color white);
		margin: (BlInsets bottom: 30).
	self addChild: tmp1.
	tmp7 := '1. El objetivo es dejar una sola ficha en el tablero.' asRopedText.
	tmp7 fontSize: 20.
	tmp3 := BlTextElement new text: (tmp7 foreground: Color lightGray).
	tmp3
		padding: (BlInsets all: 10);
		constraintsDo: [ :arg2 | arg2 horizontal matchParent ].
	self addChild: tmp3.
	tmp9 := '2. Para comer, una ficha debe saltar sobre otra hacia un hueco vacío.' asRopedText.
	tmp9 fontSize: 20.
	tmp3 := BlTextElement new text: (tmp9 foreground: Color lightGray).
	tmp3
		padding: (BlInsets all: 10);
		constraintsDo: [ :arg3 | arg3 horizontal matchParent ].
	self addChild: tmp3.
	tmp11 := '3. Solo se puede saltar horizontal o verticalmente.' asRopedText.
	tmp11 fontSize: 20.
	tmp3 := BlTextElement new text: (tmp11 foreground: Color lightGray).
	tmp3
		padding: (BlInsets all: 10);
		constraintsDo: [ :arg4 | arg4 horizontal matchParent ].
	self addChild: tmp3.
	tmp13 := '4. La ficha saltada es eliminada (come).' asRopedText.
	tmp13 fontSize: 20.
	tmp3 := BlTextElement new text: (tmp13 foreground: Color lightGray).
	tmp3
		padding: (BlInsets all: 10);
		constraintsDo: [ :arg5 | arg5 horizontal matchParent ].
	self addChild: tmp3.
	tmp15 := '5. La partida termina cuando no quedan movimientos válidos.' asRopedText.
	tmp15 fontSize: 20.
	tmp3 := BlTextElement new text: (tmp15 foreground: Color lightGray).
	tmp3
		padding: (BlInsets top: 10 bottom: 30);
		constraintsDo: [ :arg6 | arg6 horizontal matchParent ].
	self addChild: tmp3.
	tmp2 := SenkuBoton new texto: 'Volver al Menú' accion: [ app mostrarMenu ].
	self addChild: tmp2
]

{ #category : 'initialization' }
SenkuReglas >> initialize [

	super initialize.
	self
		layout: BlLinearLayout vertical alignCenter;
		constraintsDo: [ :arg1 |
				arg1 horizontal matchParent.
				arg1 vertical matchParent ];
		background: (Color darkGray alpha: 0.9);
		padding: (BlInsets all: 50)
]
