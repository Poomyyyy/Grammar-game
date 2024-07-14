extends CanvasLayer

@onready var rng = RandomNumberGenerator.new()
@onready var viewsize = get_viewport()
@onready var panel = $InvestigationPanel
@onready var timer = $AppealTimer
@onready var npcL = $Character
var progress = Progression

func _ready():
	await get_tree().create_timer(0).timeout
	panel.position.y = viewsize.size.y + panel.size.y
	var InvestButton = get_node("InvestigationPanel/DialogueMegaFrame/VBoxContainer/FrameSubmit/ButtonSubmit")	
	InvestButton.connect("button_down", open_appeal)

func _on_toggle_area_button_down():
	close_appeal()
	pass # Replace with function body.

func open_dialogue():
	var ConvIndex = progress.SentenceIndex[progress.SentenceProgress]
	var SentenceProg = progress.SentenceProgress
	var TenseProg = progress.TenseProgress
	
	var OnPos = viewsize.size.y - panel.size.y - 80
	var OffPos = viewsize.size.y + panel.size.y 

	var tween = create_tween()
	tween.tween_property(panel, 'position', Vector2(0, OnPos), .6).set_trans(Tween.TRANS_QUINT)
	
	print("open dialogue")
	await dialogue_controller(TenseProg)
	print("end dialogue")
	create_tween().tween_property(panel, 'position', Vector2(0, OffPos), .6).set_trans(Tween.TRANS_QUINT)

@onready var CurrentSubject
@onready var WaitTime = 10


func open_appeal():
	var AppealPanel = $AppealingPanel
	var AppealToggle = $AppealToggle
	var AppealTimerProgress = $AppealingPanel/AppealingCanvas/Background/TimerProgress
	AppealTimerProgress.value = 0
	timer.wait_time = WaitTime
	
	var VpCenter = get_viewport().size.y / 2
	create_tween().tween_property(AppealPanel, 'position', Vector2(0,VpCenter - AppealPanel.size.y/2), .8).set_trans(Tween.TRANS_ELASTIC)
	AppealToggle.visible = true
	
	timer.start()
	create_tween().tween_property(AppealTimerProgress, 'value', 100, WaitTime)
	
	
	await timer.timeout
	close_appeal()
	
	pass

func close_appeal():
	var AppealPanel = $AppealingPanel
	var AppealToggle = $AppealToggle
	var VpCenter = get_viewport().size.y / 2
	
	create_tween().tween_property(AppealPanel, 'position', Vector2(0,VpCenter * 2), 1).set_trans(Tween.TRANS_ELASTIC)
	AppealToggle.visible = false

func dialogue_controller(DialogueProgress):
	var DialoguePath = [
		"res://assets/conversation/pasi.json",
		"res://assets/conversation/paco.json",
		"res://assets/conversation/pape.json",
		"res://assets/conversation/papc.json"
		]
	var file = FileAccess.open(DialoguePath[DialogueProgress], FileAccess.READ)
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
	
	# Dialogue displayer
	var ConvIndex = progress.SentenceIndex[progress.SentenceProgress]
	var CurrentConv = data.conversation[ConvIndex]
	
	var InvestigateBox = $InvestigationPanel
	var InvestText = get_node("InvestigationPanel/DialogueMegaFrame/VBoxContainer/DialogueFrame/Dialogue")
	
	
	for subject in CurrentConv:
		CurrentSubject = subject
		var ToggleAppeal = false
		
		
		var words = ""
		for word in subject.sentence: 
			words = words + word + " "
		InvestText.visible_ratio = 0.0
		InvestText.text = words
		
		print("run dialogue")
		create_tween().tween_property(InvestText, 
											'visible_ratio', 
											1, 
											words.length() * 0.05)
		if !ToggleAppeal:
			ToggleAppeal = true
			
		await get_tree().create_timer(words.length() * 0.05 + 3).timeout
		
		if !timer.is_stopped():
			await timer.timeout
			print("timeout")
	file.close()
	return true
	


