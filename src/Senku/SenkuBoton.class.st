Class {
	#name : 'SenkuBoton',
	#superclass : 'BlElement',
	#instVars : [
		'accion'
	],
	#category : 'Senku',
	#package : 'Senku'
}

{ #category : 'initialization' }
SenkuBoton >> initialize [

	super initialize.
	self
		layout: BlLinearLayout horizontal alignCenter;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		background: (Color blue alpha: 0.7);
		border: (BlBorder paint: Color white width: 2);
		padding: (BlInsets all: 10);
		margin: (BlInsets all: 5);
		constraintsDo: [ :arg1 |
				arg1 horizontal fitContent.
				arg1 vertical fitContent ];
		addEventHandlerOn: BlMouseEnterEvent do: [ :arg2 | self background: (Color blue alpha: 0.9) ];
		addEventHandlerOn: BlMouseLeaveEvent do: [ :arg3 | self background: (Color blue alpha: 0.7) ];
		addEventHandlerOn: BlClickEvent do: [ :arg4 | accion ifNotNil: [ accion value ] ];
		addEventHandlerOn: BlClickEvent do: [ :arg5 | accion ifNotNil: [ accion value ] ]
]

{ #category : 'initialization' }
SenkuBoton >> texto: arg1 accion: arg2 [

	| tmp1 tmp3 |
	accion := arg2.
	tmp1 := BlTextElement new.
	tmp3 := arg1 asRopedText.
	tmp3
		fontName: 'Source Sans Pro';
		fontSize: 20.
	tmp1 text: (tmp3 foreground: Color white).
	self addChild: tmp1
]
