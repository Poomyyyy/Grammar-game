extends Node2D
var npc = preload("res://Testnpcrandom/Wattudib/Npc.tscn")

@onready var timer = $Node2D/MyTimer

var timespwn : int = 1

@export var npcbodycolors : PackedColorArray = [Color("#ffb892"), Color("#ec9a74"), Color("#d77e5e"), Color("#ac6758"),
												Color("#ceced8"),Color("#adadb7"),Color("#7f7e8c"),Color("#60606a"),
												Color("#baa288"),Color("#7f6b53"),Color("#4f4231"),Color("#3f301d"),
												Color("#dec3ae"),Color("#b89c91"),Color("#956d61"),Color("#67463d"),
												Color("#f4b071"),Color("#e8892f"),Color("#ffb892"),Color("#ffb892"),
												Color("#fffaf4"),Color("#f9eeda"),Color("#d8783b"),Color("#ca5f19"),]
@export var npcpawcolors : PackedColorArray = [Color("#ffb892"), Color("#ec9a74"), Color("#d77e5e"), Color("#ac6758"),
												Color("#ceced8"),Color("#adadb7"),Color("#7f7e8c"),Color("#60606a"),
												Color("#baa288"),Color("#7f6b53"),Color("#4f4231"),Color("#3f301d"),
												Color("#dec3ae"),Color("#b89c91"),Color("#956d61"),Color("#67463d"),
												Color("#f4b071"),Color("#e8892f"),Color("#ffb892"),Color("#ffb892"),
												Color("#fffaf4"),Color("#f9eeda"),Color("#d8783b"),Color("#ca5f19"),]
@export var npcskincolors : PackedColorArray = [Color("#ffb892"), Color("#ec9a74"), Color("#d77e5e"), Color("#ac6758"),
												Color("#ceced8"),Color("#adadb7"),Color("#7f7e8c"),Color("#60606a"),
												Color("#baa288"),Color("#7f6b53"),Color("#4f4231"),Color("#3f301d"),
												Color("#dec3ae"),Color("#b89c91"),Color("#956d61"),Color("#67463d"),
												Color("#f4b071"),Color("#e8892f"),Color("#ffb892"),Color("#ffb892"),
												Color("#fffaf4"),Color("#f9eeda"),Color("#d8783b"),Color("#ca5f19"),]
@export var npceyecolors : PackedColorArray = [Color("#b02961"), Color("#833133"), Color("#b98249"), Color("#2b3596"),
												Color("#574cb4"),Color("#25737f"),Color("#218137"),]
@export var npcoutlinecolors : PackedColorArray = [Color("#ffb892"), Color("#ec9a74"), Color("#d77e5e"), Color("#ac6758"),
												Color("#ceced8"),Color("#adadb7"),Color("#7f7e8c"),Color("#60606a"),
												Color("#baa288"),Color("#7f6b53"),Color("#4f4231"),Color("#3f301d"),
												Color("#dec3ae"),Color("#b89c91"),Color("#956d61"),Color("#67463d"),
												Color("#f4b071"),Color("#e8892f"),Color("#ffb892"),Color("#ffb892"),
												Color("#fffaf4"),Color("#f9eeda"),Color("#d8783b"),Color("#ca5f19"),]

func _ready():
		timer.start(timespwn)
		
func spawn():
	var instance = npc.instance()
	var pos = Vector2(position.x + randf_range(0,10), position.y) #position spwn npc
	instance.initialize(pos, randitem(npcbodycolors), randitem(npcpawcolors),randitem(npcskincolors),randitem(npceyecolors),randitem(npcoutlinecolors))
	get_tree().current_scene.add_child(instance)

func randitem(array : Array):
	randomize()
	array.shuffle()
	return array.front()

func _on_Timer_timeout():
	spawn()
