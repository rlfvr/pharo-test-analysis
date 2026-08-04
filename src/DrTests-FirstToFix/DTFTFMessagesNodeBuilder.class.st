"
I override `DTRTDNodeBuilder>>#buildNode:from:` to add a browse method to each node
"
Class {
	#name : 'DTFTFMessagesNodeBuilder',
	#superclass : 'DTFTFNodeBuilder',
	#category : 'DrTests-FirstToFix-Builders',
	#package : 'DrTests-FirstToFix',
	#tag : 'Builders'
}

{ #category : 'hooks' }
DTFTFMessagesNodeBuilder >> buildNode: aTreeNode from: aMethodViewModel [

	aTreeNode subResults do: [ :messageNode | 
		messageNode browseMethod: aMethodViewModel compiledMethod ] 
]
