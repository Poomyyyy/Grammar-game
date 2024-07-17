extends Button

var MainDialogue
@onready var Submit = $"../../../../../.."

func _ready():
	MainDialogue = $"../../../../../../.."

func _on_button_down():
	Submit._selection(self.text, self)
