Class {
	#name : 'Casilla',
	#superclass : 'Object',
	#instVars : [
		'fila',
		'columna',
		'estado',
		'esJugable'
	],
	#classVars : [
		'ESTADO_CON_FICHA',
		'ESTADO_NO_JUGABLE',
		'ESTADO_VACIA'
	],
	#category : 'Senku',
	#package : 'Senku'
}

{ #category : 'as yet unclassified' }
Casilla class >> ESTADO_CON_FICHA [

	ESTADO_CON_FICHA ifNil: [ ESTADO_CON_FICHA := 1 ] ifNotNil: [ ESTADO_CON_FICHA ].
	^ ESTADO_CON_FICHA
]

{ #category : 'as yet unclassified' }
Casilla class >> ESTADO_NO_JUGABLE [

	ESTADO_NO_JUGABLE ifNil: [ ESTADO_NO_JUGABLE := 2 ] ifNotNil: [ ESTADO_NO_JUGABLE ].
	^ ESTADO_NO_JUGABLE
]

{ #category : 'as yet unclassified' }
Casilla class >> ESTADO_VACIA [

	ESTADO_VACIA ifNil: [ ESTADO_VACIA := 0 ] ifNotNil: [ ESTADO_VACIA ].
	^ ESTADO_VACIA
]

{ #category : 'class initialization' }
Casilla class >> initialize [

	ESTADO_VACIA := 0.
	ESTADO_CON_FICHA := 1.
	ESTADO_NO_JUGABLE := 2
]

{ #category : 'actions' }
Casilla >> colocarFicha [

	estado := ESTADO_CON_FICHA
]

{ #category : 'accessing' }
Casilla >> columna [

	^ columna
]

{ #category : 'testing' }
Casilla >> esJugable [

	^ esJugable
]

{ #category : 'testing' }
Casilla >> estaVacia [

	^ estado = ESTADO_VACIA
]

{ #category : 'accessing' }
Casilla >> fila [

	^ fila
]

{ #category : 'initialization' }
Casilla >> initialize: arg1 with: arg2 estado: arg3 jugable: arg4 [

	fila := arg1.
	columna := arg2.
	estado := arg3.
	esJugable := arg4
]

{ #category : 'actions' }
Casilla >> quitarFicha [

	estado := ESTADO_VACIA
]

{ #category : 'testing' }
Casilla >> tieneFicha [

	^ estado = ESTADO_CON_FICHA
]
