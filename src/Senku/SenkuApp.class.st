Class {
	#name : 'SenkuApp',
	#superclass : 'BlElement',
	#instVars : [
		'space',
		'tipoTablero',
		'mostrarSelectorModo',
		'selector'
	],
	#category : 'Senku',
	#package : 'Senku'
}

{ #category : 'actions' }
SenkuApp >> agregarBotonVolver: arg1 [

	| tmp1 |
	tmp1 := SenkuBoton new texto: '< Menú' accion: [ self mostrarMenu ].
	tmp1
		extent: 100 @ 40;
		constraintsDo: [ :arg2 |
				arg2 frame horizontal alignLeft.
				arg2 frame vertical alignTop.
				arg2 margin: (BlInsets top: 20 left: 20) ].
	arg1 addChild: tmp1
]

{ #category : 'actions' }
SenkuApp >> cerrar [

	space ifNotNil: [ space close ]
]

{ #category : 'actions' }
SenkuApp >> iniciarJuego [

	| tmp1 tmp2 |
	self removeChildren.
	tmp1 := BlElement new.
	tmp1
		layout: BlFrameLayout new;
		constraintsDo: [ :arg1 |
				arg1 horizontal matchParent.
				arg1 vertical matchParent ];
		background: Color lightGray.
	tmp2 := SenkuVentana new.
	tmp2 juego inicializarConTipo: tipoTablero.
	tmp2
		armar;
		constraintsDo: [ :arg2 |
				arg2 frame horizontal alignCenter.
				arg2 frame vertical alignCenter ].
	self agregarBotonVolver: tmp1.
	tmp1 addChild: tmp2.
	self addChild: tmp1
]

{ #category : 'initialization' }
SenkuApp >> initialize [

	super initialize.
	self
		layout: BlFrameLayout new;
		constraintsDo: [ :arg1 |
				arg1 horizontal matchParent.
				arg1 vertical matchParent ].
	tipoTablero := #ingles.
	self mostrarMenu
]

{ #category : 'navigation' }
SenkuApp >> mostrarMenu [

	| tmp1 |
	self removeChildren.
	tmp1 := SenkuMenu new configurarConApp: self.
	self addChild: tmp1
]

{ #category : 'navigation' }
SenkuApp >> mostrarReglas [

	| tmp1 |
	self removeChildren.
	tmp1 := SenkuReglas new configurarConApp: self.
	self addChild: tmp1
]

{ #category : 'navigation' }
SenkuApp >> mostrarSelectorModo [

	| tmp1 |
	self removeChildren.
	tmp1 := SenkuModoSelector new configurarConApp: self.
	self addChild: tmp1
]

{ #category : 'navigation' }
SenkuApp >> mostrarSelectorTablero [

	| tmp1 |
	self removeChildren.
	tmp1 := SenkuSelector new configurarConApp: self.
	self addChild: tmp1
]

{ #category : 'accessing' }
SenkuApp >> setModo: arg1 [

	UIManager default alert: 'Modo ' , arg1 asString , ' seleccionado.'.
	self mostrarMenu
]

{ #category : 'accessing' }
SenkuApp >> space: arg1 [

	space := arg1
]

{ #category : 'accessing' }
SenkuApp >> tipoTablero: arg1 [

	tipoTablero := arg1
]
