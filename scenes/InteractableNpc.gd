extends CharacterBody2D

@onready var DialogueScript = $"../DialogueController"
var toggle = false

func _ready():
	pass

func _on_interact_button_button_down():
	if !toggle :
		toggle = true
		await DialogueScript.open_dialogue()
		toggle = false
	else :
		pass # Replace with function body.
