Class {
	#name : 'SenkuFicha',
	#superclass : 'BlElement',
	#instVars : [
		'casilla',
		'juego',
		'tableroVisual'
	],
	#category : 'Senku',
	#package : 'Senku'
}

{ #category : 'drawing' }
SenkuFicha >> actualizar [

	| tmp1 |
	self
		removeChildren;
		background: (Color gray alpha: 0.5).
	casilla tieneFicha ifTrue: [
			| tmp3 |
			tmp3 := BlElement new.
			tmp3 geometry: BlCircleGeometry new.
			tmp1 := tmp3 extent: 50 @ 50.
			(tableroVisual esSeleccionada: casilla)
				ifTrue: [ tmp1 background: Color green ]
				ifFalse: [ tmp1 background: (Color blue alpha: 0.9) ].
			tmp1 constraintsDo: [ :arg1 |
					arg1 frame horizontal alignCenter.
					arg1 frame vertical alignCenter ].
			self addChild: tmp1 ]
]

{ #category : 'drawing' }
SenkuFicha >> actualizarVisual [

	| tmp1 |
	self
		removeChildren;
		background: (Color gray alpha: 0.5).
	casilla tieneFicha ifTrue: [
			tmp1 := BlElement new.
			tmp1
				geometry: BlCircleGeometry new;
				extent: 50 @ 50.
			(tableroVisual esSeleccionada: casilla)
				ifTrue: [ tmp1 background: Color green ]
				ifFalse: [ tmp1 background: (Color blue alpha: 0.9) ].
			tmp1 constraintsDo: [ :arg1 |
					arg1 frame horizontal alignCenter.
					arg1 frame vertical alignCenter ].
			self addChild: tmp1 ].
	(tableroVisual esDestinoValido: casilla)
		ifTrue: [ self border: (BlBorder paint: Color yellow width: 3) ]
		ifFalse: [ self border: (BlBorder paint: Color transparent width: 0) ]
]

{ #category : 'initialization' }
SenkuFicha >> configurar: arg1 juego: arg2 visual: arg3 [

	casilla := arg1.
	juego := arg2.
	tableroVisual := arg3.
	self actualizar
]

{ #category : 'initialization' }
SenkuFicha >> initialize [

	super initialize.
	self
		extent: 64 @ 64;
		geometry: BlCircleGeometry new;
		layout: BlFrameLayout new;
		addEventHandlerOn: BlClickEvent do: [ :arg1 | tableroVisual procesarClick: casilla ]
]
