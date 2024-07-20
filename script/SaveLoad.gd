extends Control

#var load = $PanelContainer/MarginContainer/VSplitContainer/ScrollContainer/VBoxContainer/Save/LoadSaveButton

func _ready():
	pass

func _on_load_save_button_button_down():
	get_tree().change_scene_to_file("res://scenes/Choice.tscn")
	pass # Replace with function body.
