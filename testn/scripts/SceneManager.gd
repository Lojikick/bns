extends Node

#var next_level = null
signal level_changed
var current_level: Node2D
var current_level_name = ""
@onready var anim = $AnimationPlayer

func _ready() -> void:
	# Wait for one frame to ensure all nodes are properly added to the scene
	await get_tree().process_frame
	
	current_level = get_node_or_null("game")
	
	if current_level:
		print("Game node found:", current_level.name)
		if current_level.has_signal("level_changed"):
			current_level.connect("level_changed", handle_level_changed)
		
		if "level_name" in current_level:
			current_level_name = current_level.level_name
			print("Current Level Name: ", current_level_name)
		else:
			print("Warning: 'level_name' variable not found in game node")
	else:
		print("Warning: game node not found")
		print("Available children:", get_children())
	
	# Print the scene tree for debugging
	print_scene_tree()

func handle_level_changed(new_level_name: String):
	print("Level changed to: ", new_level_name)
	# Determine next level
	var next_level

	match new_level_name:
		"Diner":
			next_level = load("res://scenes/dialogue_ui.tscn").instantiate()
		"Booth":
			next_level = load("res://scenes/game.tscn").instantiate()
		_:
			print("Unknown level: ", new_level_name)
			return
	
	if next_level:
		add_child(next_level)
		#draws underneath current level
		#next_level.layer = -1
		anim.play("fade_out")
		next_level.connect("level_changed", handle_level_changed)
		current_level.queue_free()
		#Get rid of this
		current_level = next_level

func print_scene_tree():
	print("Scene Tree:")
	_print_children(self, 0)

func _print_children(node: Node, indent: int):
	print("  ".repeat(indent) + node.name + " (" + node.get_class() + ")")
	for child in node.get_children():
		_print_children(child, indent + 1)

#func change_scene() -> void:
	#get_tree().change_scene_to_file("res://scenes/dialogue_ui.tscn")
# Called when the node enters the scene tree for the first time.

#
#avery frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#print("In the scene folder!")


#EXPERIMENTAL
#func _on_animation_player_animation_finished(anim_name):
	#match anim_name:
		#"fade_in":
			#current_level.queue_free()
			#current_level = next_level
			#current.level.layer = 1
			#next_level = null
			#anim.play("fade_out")
			#want player to see the current level till anim is complete
			#fre animation
