extends MarginContainer

@onready var Selection = $AppealingCanvas/VBoxContainer/FrameSelection/Selection/HFlowContainer
@onready var Origin = $AppealingCanvas/VBoxContainer/FrameSelection/Selection/Word
@onready var TextCorrection = $AppealingCanvas/VBoxContainer/FrameCorrect/Correct/VBoxContainer/FrameCorrect/Correct/LineEdit
var CurrentAppealWord
var CurrentButton

func _ready():
	pass

func _selection(word, node):
	if CurrentButton != null:
		CurrentButton.text = CurrentAppealWord
		CurrentButton.get_theme_stylebox("panel").border_width_left = 0
		CurrentButton.get_theme_stylebox("panel").border_width_right = 0
		CurrentButton.get_theme_stylebox("panel").border_width_top = 0
		CurrentButton.get_theme_stylebox("panel").border_width_bottom = 0
	CurrentAppealWord = word
	CurrentButton = node
	print(node)
	
	var style = CurrentButton.get_theme_stylebox("panel")
	style.bg_color = Color("#ffd890")
	CurrentButton.get_theme_stylebox("panel").bg_color = Color("#ffd890")
	CurrentButton.get_theme_stylebox("panel").border_width_right = 5
	CurrentButton.get_theme_stylebox("panel").border_width_top = 5
	CurrentButton.get_theme_stylebox("panel").border_width_bottom = 5
	
	TextCorrection.text = word

func _generate_sentence(subject):
	for old in Selection.get_children():
		old.queue_free()
	
	for word in subject.sentence:
		var Word = Origin.duplicate()
		Selection.add_child(Word)
		Word.text = word
		Word.visible = true

func _on_button_submit_button_down():
	
	pass

func _on_line_edit_text_changed(new_text):
	if CurrentAppealWord == null:
		TextCorrection.text = ""
		TextCorrection.placeholder_text = "Please select incorrect word above"
	else:
		if new_text == null:
			CurrentButton.text = CurrentAppealWord
		else:
			CurrentButton.text = new_text
	pass