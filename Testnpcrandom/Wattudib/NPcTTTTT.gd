extends CharacterBody2D
const GRAVITY = 200
const MAX_SPEED = 200
const JUMP_FORCE = 100

@onready var body = $Body
@onready var paw = $Paw
@onready var skin = $Skin
@onready var eye = $Eye
@onready var outline = $Outline

func _on_Body_frame_changed():
	sync_frames(body.frame, body.flip_h)

func sync_frames(frame, flip_h):
	body.frame = frame
	paw.frame = frame
	skin.frame = frame
	eye.frame = frame
	outline.frame = frame
	
	body.flip_h = flip_h
	paw.flip_h = flip_h
	skin.flip_h = flip_h
	eye.flip_h = flip_h
	outline.flip_h = flip_h
