Class {
	#name : 'TSDAssertionLessResult',
	#superclass : 'TSDSmellResult',
	#instVars : [
		'isAssertionLess'
	],
	#category : 'TestSmellsDetector-Results',
	#package : 'TestSmellsDetector',
	#tag : 'Results'
}

{ #category : 'comparing' }
TSDAssertionLessResult >> <= aSmellResult [

	^ self isAssertionLess = aSmellResult isAssertionLess 
		ifTrue: [ super <= aSmellResult ] 
		ifFalse: [ self isAssertionLess ] 
]

{ #category : 'converting' }
TSDAssertionLessResult >> asResultForDrTest [

	^ DTFTFMessageNode new
		message: (String streamContents: [ :stream |
			stream 
				print: (self testClass selector: self selector);
				<< ': ';
				<< (self isAssertionLess 
					ifTrue: [ 'is assertionless' ]
					ifFalse: [ 'has assertions' ]) ]);
		browseMethod: (self testClass lookupSelector: self selector);
		yourself
]

{ #category : 'accessing' }
TSDAssertionLessResult >> isAssertionLess [

	^ isAssertionLess
]

{ #category : 'accessing' }
TSDAssertionLessResult >> isAssertionLess: anObject [

	isAssertionLess := anObject
]
