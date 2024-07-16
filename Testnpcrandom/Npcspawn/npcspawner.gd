extends Node2D
var npc = preload("res://Testnpcrandom/Npc/npc.tscn")

@onready var timer = $Timer
@export var timespwn : int = 1 #seconds to wwait spawning another npc

@export var npcbodycolors : PackedColorArray = [Color("ffb892"), Color("ec9a74"), Color("d77e5e"), Color("ac6758")]
@export var npceyecolors : PackedColorArray = [Color("ffb892"), Color("ec9a74"), Color("d77e5e"), Color("ac6758")]
func _ready():
	timer.start(timespwn)

func spawn():
	var instance = npc.instance()
	var pos = Vector2(position.x + randf_range(0,10), position.y)
	instance.initialize(pos, randitem(npcbodycolors), randitem(npceyecolors))
	get_tree().current_scene.add_child(instance)

func randitem(array : Array):
	randomize()
	array.shuffle()
	return array.front()

func _on_Timer_timeout():
	spawn()
