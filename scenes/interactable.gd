extends Area2D

const Balloon = preload("res://dialogues/balloon.tscn")


@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func interact() -> void:
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)
	#DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
