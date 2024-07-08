extends Control

@export_file("*.json") var dialogue_file

func load_dialogue(): #open file to read and get text content
	var file = FileAccess.open("res://dialogue/spirit_dialog.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content

signal diag_finished
var dialogue = []
var current_dialogue_id = 0
var diag_active = false

func _ready():
	$NinePatchRect.visible = false

func start():
	if diag_active:
		return
	diag_active = true
	$NinePatchRect.visible = true
	dialogue = load_dialogue()
	current_dialogue_id = -1
	next_script()

func _input(event):
	if !diag_active:
		return
	if event.is_action_pressed("chat"):
		next_script()

func next_script():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		diag_active = false
		$NinePatchRect.visible = false
		emit_signal("diag_finished")
		return
	
	$NinePatchRect/Name.text = dialogue[current_dialogue_id]['name']
	$NinePatchRect/Text.text = dialogue[current_dialogue_id]['text']
