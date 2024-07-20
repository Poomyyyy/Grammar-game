extends Node

var CurrentSave = 0

var TenseProgress := 0 # 0 -> 12 tense
var SentenceProgress := 0 # 0 -> 15 sentence

var SentenceIndex := [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]

# Score
var Score := [0,0,0] # Past Present Future

func _ready():
	SentenceIndex.shuffle()

func _save_game():
	var saves = {
		"TenseProgress" : TenseProgress,
		"SentenceProgress" : SentenceProgress,
		"SentenceIndex" : SentenceIndex,
		"Score" : Score
	}
	var file = FileAccess.open("user://saves/savefile.save", FileAccess.WRITE)
	var jsonString = JSON.stringify(saves)
	
	file.store_line(jsonString)
