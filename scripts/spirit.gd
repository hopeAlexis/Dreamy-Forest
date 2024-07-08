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
	if State.flower_status == "gave":
		current_state = AWAKE
	if current_state == AWAKE:
		$AnimatedSprite2D.play("awake")
	else:
		$AnimatedSprite2D.play("sleep")
