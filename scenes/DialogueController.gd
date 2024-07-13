extends CanvasLayer

@onready var rng = RandomNumberGenerator.new()

@onready var viewsize = get_viewport()
@onready var panel = $InvestigationPanel
@onready var npcL = $Character

func _ready():
	await get_tree().create_timer(0).timeout
	panel.position.y = viewsize.size.y + panel.size.y
	
	var DialoguePath = ["res://assets/conversation/paco.json"]
	var file = FileAccess.open(DialoguePath[0], FileAccess.READ)
	var json_string = file.get_as_text()
	
	var json = JSON.new()
	var error = json.parse(json_string)
	var data
	
	if error == OK:
		data = json.data
		print("OK " + DialoguePath[0])  # This will print the parsed JSON data
	else:
		data = "none"
		print("Error parsing JSON: ", json.get_error_message())
	
	print(data.conversation[0])
	file.close()
	
	
func _process(delta):
	pass

var togg = false

func _on_test_1_button_down():
	
	var pos = viewsize.size.y - panel.size.y - 80
	#print(panel.size.y)
	if togg :
		togg = false
		pos = viewsize.size.y + panel.size.y
	else :
		togg = true
		pos = viewsize.size.y - panel.size.y - 80
	#print(pos)
	var tween = create_tween()
	
	tween.tween_property(panel, 'position', Vector2(0, pos), .6).set_trans(Tween.TRANS_QUINT)
	tween.parallel().tween_property(npcL, 'scale', Vector2(6, 6), .6).set_trans(Tween.TRANS_ELASTIC)
	
	var npcLSkin = $Character/Skin
