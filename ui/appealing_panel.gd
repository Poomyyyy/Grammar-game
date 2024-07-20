extends MarginContainer

@onready var Score = Progression.Score

@onready var AppealTimer = $"../AppealTimer"
@onready var DialogueTimer = $"../DialogueTimer"
@onready var InvestigationPanel = $"../InvestigationPanel"
@onready var DialogueController = $".."
@onready var Selection = $AppealingCanvas/VBoxContainer/FrameSelection/Selection/HFlowContainer
@onready var Origin = $AppealingCanvas/VBoxContainer/FrameSelection/Selection/Word
@onready var TextCorrection = $AppealingCanvas/VBoxContainer/FrameCorrect/Correct/VBoxContainer/FrameCorrect/Correct/LineEdit
var CurrentAppealWord
var CurrentButton
var WordLen

var Subject

func _ready():
	pass

func _selection(word, node):
	if CurrentButton != null:
		CurrentButton.text = CurrentAppealWord
		var style = CurrentButton.get_theme_stylebox("normal").duplicate()
		style.set("bg_color", Color("#f0b000"))
		CurrentButton.add_theme_stylebox_override("normal", style)
	CurrentAppealWord = word
	CurrentButton = node
	
	var style = CurrentButton.get_theme_stylebox("normal").duplicate()
	style.set("bg_color", Color("#a3bbf8"))
	CurrentButton.add_theme_stylebox_override("normal", style)
	
	TextCorrection.text = word

func _generate_sentence(subject, len):
	WordLen = len
	Subject = subject
	var indexs = 0
	for old in Selection.get_children():
		old.queue_free()
	
	for word in subject.sentence:
		var Word = Origin.duplicate()
		Selection.add_child(Word)
		Word.text = word
		Word.index = indexs
		Word.visible = true
		indexs += 1

func _on_button_submit_button_down():
	#subject
	DialogueController.close_appeal()
	print(CurrentButton.index, CurrentButton.text)
	AppealTimer.stop()
	DialogueTimer.stop()
	if Subject.err_i == CurrentButton.index and Subject.correct == CurrentButton.text:
		var scr = WordLen + WordLen * AppealTimer.time_left/AppealTimer.wait_time
		Progression.Score[0] += round(scr)
		print(round(scr))
	else:
		
		print("False")
	pass

func _on_line_edit_text_changed(new_text):
	if CurrentAppealWord == null:
		TextCorrection.text = ""
		TextCorrection.placeholder_text = "Please select incorrect word above"
	else:
		if new_text == null:
			CurrentButton.text = CurrentAppealWord
		else:
			#print(new_text)
			CurrentButton.text = new_text
	pass
