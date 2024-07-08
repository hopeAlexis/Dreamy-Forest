extends CharacterBody2D

var speed = 40
var player_follow = false
var player = null

func _physics_process(delta):
	if player_follow == true:
		position += (player.position - position)/speed
		
	$AnimatedSprite2D.play("default")

func _on_area_2d_body_entered(body):
	player = body
	player_follow = true
	

func _on_area_2d_body_exited(body):
	player = null
	player_follow = false
