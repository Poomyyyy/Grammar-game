extends Control

@onready var Background =  $ParallaxBackground
@onready var SaveLoad = $CanvasLayer/SaveLoad
@onready var BackButton = $CanvasLayer/SaveLoad/PanelContainer/MarginContainer/VSplitContainer/HBoxContainer/Panel/BackButton

func _ready():
	BackButton.connect("button_down", _back)

func _back():
	create_tween().tween_property(SaveLoad, "size", Vector2(SaveLoad.size.x, 103), 1).set_trans(Tween.TRANS_QUINT)
	create_tween().tween_property(SaveLoad, "position", Vector2(SaveLoad.position.x, 921), 1).set_trans(Tween.TRANS_QUINT)

func _on_start_button_button_down():
	create_tween().tween_property(SaveLoad, "size", Vector2(SaveLoad.size.x, 649), 1).set_trans(Tween.TRANS_QUINT)
	create_tween().tween_property(SaveLoad, "position", Vector2(SaveLoad.position.x, 370), 1).set_trans(Tween.TRANS_QUINT)


func _process(delta):
	Background.scroll_offset.x -= 100*delta
