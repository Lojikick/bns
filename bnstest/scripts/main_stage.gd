extends Node2D

@export var dialogue_json: JSON
@onready var state = {
	"show_only_one": false
}
# Called when the node enters the scene tree for the first time.
func _ready():
	print(state)
	#Triggers EZ Dialogue
	($EzDialogue as EzDialogue).start_dialogue(dialogue_json, state)
	#pass with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#takes in signal and populate box with dialogue and text
func _on_ez_dialogue_dialogue_generated(response):
	$DialogueBox.clear_dialogue_box()
	$DialogueBox.add_text(response.text)
	for choice in response.choices:
		$DialogueBox.add_choice(choice)
