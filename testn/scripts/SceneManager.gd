#https://claude.ai/chat/164cb3e8-375b-46ae-b343-21190f3c1649
extends Node

var next_level = null
signal level_changed
var current_level_name = ""
@onready var current_level = $game
@onready var anim = $AnimationPlayer

func _ready() -> void:
	await get_tree().process_frame
	print("We are here now")
	current_level = get_node_or_null("game")
	
	if current_level:
		print("Game node found:", current_level.name)
		if current_level.has_signal("level_changed"):
			current_level.connect("level_changed", handle_level_changed)
		0
		if "level_name" in current_level:
			current_level_name = current_level.level_name
			print("Current Level Name: ", current_level_name)
		else:
			print("Warning: 'level_name' variable not found in game node")
	else:
		print("Warning: game node not found")
		print("Available children:", get_children())
	
	print_scene_tree()

func handle_level_changed(new_level_name: String):
	print("Level changed to: ", new_level_name)
	
	var level_scene: PackedScene
	
	match new_level_name:
		"Diner":
			level_scene = preload("res://scenes/dialogue_ui.tscn")
		"Booth":
			level_scene = preload("res://scenes/game.tscn")
		_:
			print("Unknown level: ", new_level_name)
			return
	
	if level_scene:
		next_level = level_scene.instantiate()
		if next_level:
			next_level.z_index = -1
			add_child(next_level)
			anim.play("fade_in")
			
			if next_level.has_signal("level_changed"):
				next_level.connect("level_changed", handle_level_changed)
		else:
			print("Failed to instantiate new level")
	else:
		print("Level scene not found")

func print_scene_tree():
	print("Scene Tree:")
	_print_children(self, 0)

func _print_children(node: Node, indent: int):
	print("  ".repeat(indent) + node.name + " (" + node.get_class() + ")")
	for child in node.get_children():
		_print_children(child, indent + 1)

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"fade_in":
			if current_level:
				current_level.queue_free()
			current_level = next_level
			if current_level:
				current_level.z_index = 1  # Set the level to the top
			next_level = null
			anim.play("fade_out")
		"fade_out":
			print("Fade out complete")
