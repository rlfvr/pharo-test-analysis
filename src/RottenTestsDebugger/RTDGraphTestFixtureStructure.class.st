"
I know the way to draw a test lattice graph 
"
Class {
	#name : 'RTDGraphTestFixtureStructure',
	#superclass : 'AIGraphTestFixtureStructure',
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'drawing - roassal' }
RTDGraphTestFixtureStructure >> buildGraphCanvas [

	| canvas |
	canvas := RSCanvas new.
	canvas addAll: (self nodesAsRoassalShapes).
	canvas nodes @ RSDraggable new.
	canvas @ RSCanvasController new.

	RSLineBuilder arrowedLine
		color: Color black;
		withBorderAttachPoint;
		shapes: canvas nodes;
		useAssociations:
			(edges collect: [ :each | each first -> each last ]).

	RSSugiyamaLayout on: canvas nodes.
	^ canvas
]
