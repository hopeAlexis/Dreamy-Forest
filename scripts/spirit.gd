extends CharacterBody2D

var current_state = SLEEP
var is_chatting = false

var player = null
var player_in_area = false

enum {
	SLEEP,
	AWAKE
}

func _ready():
	$AnimatedSprite2D.play("sleep")

func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("chat"):
			$Dialogue.start()

func _on_dialogue_diag_finished():
	is_chatting = false

func _on_detection_area_body_entered(body):
		player = body
		player_in_area = true

func _on_detection_area_body_exited(body):
		player = null
		player_in_area = false
