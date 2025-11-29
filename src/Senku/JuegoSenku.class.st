Class {
	#name : 'JuegoSenku',
	#superclass : 'Object',
	#instVars : [
		'tablero',
		'initialPegCount',
		'movimientos',
		'fichasRestantes'
	],
	#category : 'Senku',
	#package : 'Senku'
}

{ #category : 'game logic' }
JuegoSenku >> ejecutarMovimientoInversoDe: arg1 a: arg2 [

	(tablero getCasillaAtRow: arg1 first column: arg1 last) quitarFicha.
	(tablero getCasillaAtRow: arg2 first column: arg2 last) quitarFicha.
	(tablero getCasillaAtRow: arg1 first + arg2 first // 2 column: arg1 last + arg2 last // 2) colocarFicha.
	fichasRestantes := fichasRestantes - 1
]

{ #category : 'game logic' }
JuegoSenku >> ejecutarMovimientoNormalDe: arg1 a: arg2 [

	(tablero getCasillaAtRow: arg1 first column: arg1 last) quitarFicha.
	(tablero getCasillaAtRow: arg2 first column: arg2 last) colocarFicha.
	(tablero getCasillaAtRow: arg1 first + arg2 first // 2 column: arg1 last + arg2 last // 2) quitarFicha.
	fichasRestantes := fichasRestantes - 1
]

{ #category : 'testing' }
JuegoSenku >> estaTerminado [
    "Retorna true si NO hay movimientos posibles"
    ^ (ReglasSenku hayMovimientosPosiblesEn: tablero) not
]

{ #category : 'accessing' }
JuegoSenku >> fichasRestantes [

	^ fichasRestantes
]

{ #category : 'initialization' }
JuegoSenku >> inicializarConTipo: arg1 [

	| tmp1 tmp2 |
	arg1 = #europeo ifTrue: [ tablero := Tablero new initializeEuropeanBoard ].
	arg1 = #diamante ifTrue: [ tablero := Tablero new initializeDiamondBoard ].
	arg1 = #trio ifTrue: [ tablero := Tablero new initializeTrioStart ].
	arg1 = #normal ifTrue: [ tablero := Tablero new initializeEnglishBoard ].
	tablero ifNil: [ tablero := Tablero new initializeEnglishBoard ] ifNotNil: [ tablero ].
	tmp1 := 0.
	1 to: 7 do: [ :tmp3 |
			1 to: 7 do: [ :tmp4 |
					tmp2 := tablero getCasillaAtRow: tmp3 column: tmp4.
					(tmp2 esJugable and: [ tmp2 tieneFicha ]) ifTrue: [ tmp1 := tmp1 + 1 ] ].
			1 ].
	1.
	fichasRestantes := tmp1.
	initialPegCount := tmp1.
	movimientos := 0
]

{ #category : 'accessing' }
JuegoSenku >> initialPegCount [

	^ initialPegCount
]

{ #category : 'initialization' }
JuegoSenku >> initialize [

	super initialize.
	self inicializarConTipo: #normal
]

{ #category : 'accessing' }
JuegoSenku >> modo [

	^ '<an unprintable nonliteral value>' runtimeUndeclaredReadInContext: thisContext
]

{ #category : 'game logic' }
JuegoSenku >> moverDe: arg1 a: arg2 [

	(ReglasSenku esMovimientoValidoEn: tablero origen: arg1 destino: arg2) ifFalse: [ ^ false ].
	(tablero getCasillaAtRow: (arg1 at: 1) asInteger column: (arg1 at: 2) asInteger) quitarFicha.
	(tablero getCasillaAtRow: (arg2 at: 1) asInteger column: (arg2 at: 2) asInteger) colocarFicha.
	(tablero getCasillaAtRow: (arg1 at: 1) + (arg2 at: 1) // 2 asInteger column: (arg1 at: 2) + (arg2 at: 2) // 2 asInteger)
		quitarFicha.
	fichasRestantes := fichasRestantes - 1.
	movimientos := movimientos + 1.
	^ true
]

{ #category : 'accessing' }
JuegoSenku >> movimientos [

	^ movimientos
]

{ #category : 'game logic' }
JuegoSenku >> obtenerResultado [

	(ReglasSenku hayMovimientosPosiblesEn: self tablero) ifTrue: [ ^ #enCurso ].
	nil.
	self fichasRestantes = 1 ifTrue: [ ^ #victoria ].
	^ #derrota
]

{ #category : 'accessing' }
JuegoSenku >> tablero [

	^ tablero
]
