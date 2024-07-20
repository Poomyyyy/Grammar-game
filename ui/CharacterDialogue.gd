extends MarginContainer

var PersonL 
var PersonR
var Lpos
var Rpos
var Order = true

var hide = false

func _ready():
	PersonL = $Character/PersonL
	PersonR = $Character/PersonR
	Lpos = PersonL.position
	Rpos = PersonR.position
	pass

func _load():
	pass
	
func _hide():
	hide = true
	create_tween().tween_property(PersonL, 'scale', Vector2(.5, .5), .5).set_trans(Tween.TRANS_QUINT)
	create_tween().tween_property(PersonR, 'scale', Vector2(.5, .5), .5).set_trans(Tween.TRANS_QUINT)
	await get_tree().create_timer(.5).timeout
	PersonL.visible = false
	PersonR.visible = false

func _activate():
	
	hide = false
	PersonL.visible = true
	PersonR.visible = true
	while true:
		if hide : 
			print("hiding")
			break
		create_tween().tween_property(PersonL, 'position', Vector2(Lpos.x,Lpos.y + 100), 1).set_trans(Tween.TRANS_QUAD)
		create_tween().tween_property(PersonL, 'rotation', deg_to_rad(15), .5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		create_tween().tween_property(PersonR, 'position', Vector2(Rpos.x,Rpos.y - 50), 1).set_trans(Tween.TRANS_QUAD)
		create_tween().tween_property(PersonR, 'rotation', deg_to_rad(-15), 1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		await get_tree().create_timer(1).timeout
		create_tween().tween_property(PersonL, 'position', Vector2(Lpos.x,Lpos.y - 50), 1).set_trans(Tween.TRANS_QUAD)
		create_tween().tween_property(PersonL, 'rotation', deg_to_rad(-15), 1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		create_tween().tween_property(PersonR, 'position', Vector2(Rpos.x,Rpos.y + 100), 1).set_trans(Tween.TRANS_QUAD)
		create_tween().tween_property(PersonR, 'rotation', deg_to_rad(15), .5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		await get_tree().create_timer(1).timeout
	

func _focus():
	# print("Char-Script")
	if Order: #prioritize L
		PersonL.z_index = -1
		create_tween().tween_property(PersonL, 'scale', Vector2(1.5, 1.5), 1).set_trans(Tween.TRANS_QUINT)
		create_tween().tween_property(PersonR, 'scale', Vector2(1, 1), 1).set_trans(Tween.TRANS_QUINT)
		Order = false
	else: #prioritize R
		PersonL.z_index = -2
		create_tween().tween_property(PersonL, 'scale', Vector2(1, 1), 1).set_trans(Tween.TRANS_QUINT)
		create_tween().tween_property(PersonR, 'scale', Vector2(1.5, 1.5), 1).set_trans(Tween.TRANS_QUINT)
		Order = true
		
