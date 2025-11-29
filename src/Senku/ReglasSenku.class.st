Class {
	#name : 'ReglasSenku',
	#superclass : 'Object',
	#category : 'Senku',
	#package : 'Senku'
}

{ #category : 'as yet unclassified' }
ReglasSenku class >> esMovimientoInversoValidoEn: arg1 origen: arg2 destino: arg3 [

	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp1 := arg1 getCasillaAtRow: arg2 first column: arg2 last.
	tmp2 := arg1 getCasillaAtRow: arg3 first column: arg3 last.
	tmp1 tieneFicha ifFalse: [ ^ false ].
	tmp2 tieneFicha ifTrue: [ ^ false ].
	nil.
	tmp3 := (arg2 first - arg3 first) abs.
	tmp4 := (arg2 last - arg3 first) abs.
	((tmp3 = 2 and: [ tmp4 = 0 ]) or: [ tmp4 = 2 and: [ tmp3 = 0 ] ]) ifFalse: [ ^ false ].
	tmp5 := arg1 getCasillaAtRow: arg2 first + arg3 first // 2 column: arg2 last + arg3 last // 2.
	^ tmp5 estaVacia
]

{ #category : 'as yet unclassified' }
ReglasSenku class >> esMovimientoValidoEn: arg1 origen: arg2 destino: arg3 [

	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 |
	((arg3 at: 1) < 1 or: [ (arg3 at: 1) > 7 ]) ifTrue: [ ^ false ].
	nil.
	((arg3 at: 2) < 1 or: [ (arg3 at: 2) > 7 ]) ifTrue: [ ^ false ].
	nil.
	tmp6 := (arg2 at: 1) asInteger.
	tmp7 := (arg2 at: 2) asInteger.
	tmp1 := arg1 getCasillaAtRow: tmp6 column: tmp7.
	tmp2 := arg1 getCasillaAtRow: (arg3 at: 1) asInteger column: (arg3 at: 2) asInteger.
	(tmp1 tieneFicha and: [ tmp2 estaVacia ]) ifFalse: [ ^ false ].
	tmp3 := (tmp6 - (arg3 at: 1)) abs.
	tmp4 := (tmp7 - (arg3 at: 2)) abs.
	((tmp3 = 2 and: [ tmp4 = 0 ]) or: [ tmp4 = 2 and: [ tmp3 = 0 ] ]) ifFalse: [ ^ false ].
	tmp5 := arg1 getCasillaAtRow: tmp6 + (arg3 at: 1) // 2 column: tmp7 + (arg3 at: 2) // 2.
	^ tmp5 tieneFicha
]

{ #category : 'as yet unclassified' }
ReglasSenku class >> hayMovimientosPosiblesEn: arg1 [

	| tmp1 tmp5 |
	1 to: 7 do: [ :tmp3 |
			1 to: 7 do: [ :tmp4 |
					tmp1 := arg1 getCasillaAtRow: tmp3 column: tmp4.
					(tmp1 notNil and: [ tmp1 esJugable and: [ tmp1 tieneFicha ] ]) ifTrue: [
							tmp5 := {
								        tmp3.
								        tmp4 }.
							{
								{
									tmp3.
									(tmp4 + 2) }.
								{
									tmp3.
									(tmp4 - 2) }.
								{
									(tmp3 + 2).
									tmp4 }.
								{
									(tmp3 - 2).
									tmp4 } } do: [ :arg2 | (self esMovimientoValidoEn: arg1 origen: tmp5 destino: arg2) ifTrue: [ ^ true ] ] ] ].
			1 ].
	1.
	^ false
]
