extends CanvasLayer

@onready var viewsize = get_viewport()
@onready var panel = $InvestigationPanel

func _ready():
	await get_tree().create_timer(0).timeout
	panel.position.y = viewsize.size.y + panel.size.y
	
func _process(delta):
	pass

var togg = false

func _on_test_1_button_down():
	
	var pos = viewsize.size.y - panel.size.y - 80
	print(panel.size.y)
	if togg :
		togg = false
		pos = viewsize.size.y + panel.size.y
	else :
		togg = true
		pos = viewsize.size.y - panel.size.y - 80
	print(pos)
	var tween = create_tween()
	
	tween.tween_property(panel, 'position', Vector2(0, pos), .6).set_trans(Tween.TRANS_QUINT)
