extends Node2D

#func change_to_new_scene():
	#var result = get_tree().change_scene_to_file("res://scenes/game.tscn")
	#if result != OK:
		#print("An error occurred while changing scenes")
#
#func _ready():
	#print("YASS QUEEN")
	#
	## Connect to the DialogueManager's signal
	#DialogueManager.dialogue_ended.connect(self._on_dialogue_finished)
	#
	## Start the dialogue
	#DialogueManager.show_example_dialogue_balloon(load("res://dialogue/test.dialogue"), "start")
#
#func _on_dialogue_finished(_resource):
	## This function will be called when the dialogue is finished
	#change_to_new_scene()
#
#func _process(delta):
	#pass
