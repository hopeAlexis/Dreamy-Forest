extends CharacterBody2D

const speed = 60
var current_dir = "none"

@onready var interactable_finder: Area2D = $Marker/Interactable_Finder



func _ready(): #play animation when player spawns
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	if Input.is_action_just_pressed("chat"):
		var interactables = interactable_finder.get_overlapping_areas()
		if interactables.size() > 0:
			interactables[0].interact()
			return
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down") or Input.is_action_pressed("down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up") or Input.is_action_pressed("up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func play_anim(movement): # 1 - player moves, 0 - player stands
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		if movement == 1:
			anim.play("right_walk")
		elif movement == 0:
			anim.play("right_idle")
			
	if dir == "left":
		if movement == 1:
			anim.play("left_walk")
		elif movement == 0:
			anim.play("left_idle")
			
	if dir == "down":
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("front_idle")
			
	if dir == "up":
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")
