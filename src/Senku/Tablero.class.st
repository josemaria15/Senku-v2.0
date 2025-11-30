Class {
	#name : 'Tablero',
	#superclass : 'Object',
	#instVars : [
		'casillas',
		'size'
	],
	#category : 'Senku',
	#package : 'Senku'
}

{ #category : 'accessing' }
Tablero >> getCasillaAtRow: arg1 column: arg2 [

	^ (casillas at: arg1) at: arg2
]

{ #category : 'initialization' }
Tablero >> inicializarTableroVacio [

	| tmp1 tmp2 tmp4 tmp5 |
	size := 7.
	casillas := Array new: size.
	tmp1 := size.
	1 to: tmp1 do: [ :tmp3 |
			tmp2 := nil.
			tmp2 := Array new: size.
			tmp4 := size.
			1 to: tmp4 do: [ :tmp6 |
					tmp5 := nil.
					tmp5 := (tmp3 between: 3 and: 5) or: [ tmp6 between: 3 and: 5 ].
					tmp2 at: tmp6 put: (Casilla new
							 initialize: tmp3
							 with: tmp6
							 estado: 0
							 jugable: tmp5) ].
			1.
			casillas at: tmp3 put: tmp2 ].
	1
]

{ #category : 'initialization' }
Tablero >> initializeDiamondBoard [

	| tmp1 tmp2 tmp4 tmp5 tmp6 tmp7 |
	size := 7.
	casillas := Array new: size.
	tmp1 := size.
	1 to: tmp1 do: [ :tmp3 |
			tmp2 := nil.
			tmp2 := Array new: size.
			tmp4 := size.
			1 to: tmp4 do: [ :tmp8 |
					tmp5 := nil.
					tmp6 := nil.
					tmp7 := nil.
					tmp7 := (tmp3 - 4) abs + (tmp8 - 4) abs.
					tmp5 := tmp7 <= 3.
					tmp6 := (tmp3 = 4 and: [ tmp8 = 4 ])
						        ifTrue: [ 0 ]
						        ifFalse: [ 1 ].
					tmp2 at: tmp8 put: (Casilla new
							 initialize: tmp3
							 with: tmp8
							 estado: tmp6
							 jugable: tmp5) ].
			1.
			casillas at: tmp3 put: tmp2 ].
	1
]

{ #category : 'initialization' }
Tablero >> initializeEnglishBoard [

	| tmp1 tmp2 tmp4 tmp5 tmp6 |
	size := 7.
	casillas := Array new: size.
	tmp1 := size.
	1 to: tmp1 do: [ :tmp3 |
			tmp2 := nil.
			tmp2 := Array new: size.
			tmp4 := size.
			1 to: tmp4 do: [ :tmp7 |
					tmp5 := nil.
					tmp6 := nil.
					tmp5 := (tmp3 between: 3 and: 5) or: [ tmp7 between: 3 and: 5 ].
					tmp6 := (tmp3 = 4 and: [ tmp7 = 4 ])
						        ifTrue: [ Casilla ESTADO_VACIA ]
						        ifFalse: [ Casilla ESTADO_CON_FICHA ].
					tmp2 at: tmp7 put: (Casilla new
							 initialize: tmp3
							 with: tmp7
							 estado: tmp6
							 jugable: tmp5) ].
			1.
			casillas at: tmp3 put: tmp2 ].
	1
]

{ #category : 'initialization' }
Tablero >> initializeEuropeanBoard [

	| tmp1 tmp2 tmp3 tmp4 tmp6 tmp7 tmp8 |
	size := 7.
	casillas := Array new: size.
	tmp1 := {
		        { 3. 4. 5 }.
		        { 2. 3. 4. 5. 6 }.
		        { 1. 2. 3. 4. 5. 6. 7 }.
		        { 1. 2. 3. 4. 5. 6. 7 }.
		        { 1. 2. 3. 4. 5. 6. 7 }.
		        { 2. 3. 4. 5. 6 }.
		        { 3. 4. 5 } }.
	tmp2 := size.
	1 to: tmp2 do: [ :tmp5 |
			tmp3 := nil.
			tmp4 := nil.
			tmp3 := Array new: size.
			tmp4 := tmp1 at: tmp5.
			tmp6 := size.
			1 to: tmp6 do: [ :tmp9 |
					tmp7 := nil.
					tmp8 := nil.
					tmp7 := tmp4 includes: tmp9.
					tmp8 := (tmp5 = 4 and: [ tmp9 = 4 ])
						        ifTrue: [ 0 ]
						        ifFalse: [ 1 ].
					tmp3 at: tmp9 put: (Casilla new
							 initialize: tmp5
							 with: tmp9
							 estado: tmp8
							 jugable: tmp7) ].
			1.
			casillas at: tmp5 put: tmp3 ].
	1
]

{ #category : 'initialization' }
Tablero >> initializeTrioStart [

	self inicializarTableroVacio.
	1 to: 7 do: [ :tmp1 |
			1 to: 7 do: [ :tmp2 |
					((tmp1 < 3 or: [ tmp1 > 5 ]) and: [ tmp2 < 3 or: [ tmp2 > 5 ] ]) ifFalse: [
						(self getCasillaAtRow: tmp1 column: tmp2) colocarFicha ] ].
			1 ].
	1.
	(self getCasillaAtRow: 4 column: 4) quitarFicha.
	(self getCasillaAtRow: 4 column: 2) quitarFicha.
	(self getCasillaAtRow: 5 column: 4) quitarFicha
]
