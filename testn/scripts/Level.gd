extends Node2D

signal level_changed(level_name)
# Called when the node enters the scene tree for the first time.

@export var level_name: String = "level"
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_button_pressed():
	emit_signal("level_changed", level_name)
   	#get_tree().change_scene_to_file("res://scenes/dialogue_ui.tscn")
