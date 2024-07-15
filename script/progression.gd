extends Node

var TenseProgress = 0 # 0 -> 12 tense
var SentenceProgress = 0 # 0 -> 15 sentence

var SentenceIndex = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]

func _ready():
	SentenceIndex.shuffle()
