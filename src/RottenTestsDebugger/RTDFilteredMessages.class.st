"
I filter the incoming messages from a given set of messages
"
Class {
	#name : 'RTDFilteredMessages',
	#superclass : 'RTDMessages',
	#instVars : [
		'bannedMessages'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'instance creation' }
RTDFilteredMessages class >> withAssertableSelectors [ 

	^ self new 
		bannedMessages: ((TAssertable selectors union: #( assert: assert:description:) ) asSet); 
		yourself
]

{ #category : 'accessing' }
RTDFilteredMessages >> at: aCompiledMethod put: aMessageSet [

	super at: aCompiledMethod put: (aMessageSet difference: self bannedMessages )
]

{ #category : 'accessing' }
RTDFilteredMessages >> bannedMessages [

	^ bannedMessages ifNil: [ bannedMessages := Set new ]
]

{ #category : 'accessing' }
RTDFilteredMessages >> bannedMessages: aMessageSet [

	bannedMessages := aMessageSet 
]
