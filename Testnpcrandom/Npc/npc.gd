extends "res://Testnpcrandom/Wattudib/NPcTTTTT.gd"

var npcbodycolors
var npcpawcolors
var npcskincolors
var npceyecolors
var npcoutlinecolors

func initialize(_body,_paw, _skin, _eye, _outline ):
	npcbodycolors = _body
	npcpawcolors = _paw
	npcskincolors = _skin
	npceyecolors = _eye
	npcoutlinecolors = _outline
func _ready():
	body.self.modulate = npcbodycolors
	paw.self.modulate = npcpawcolors
	skin.self.modulate = npcskincolors
	eye.self.modulate = npceyecolors
	eye.self.modulate = npceyecolors

	#func _physics_process(delta):
	#velocity.y += delta
	#move_and_slide()
