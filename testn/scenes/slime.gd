extends CharacterBody2D

#hunch, something about scene hierarchy.. not entirely sure its kinda weird....
@onready var tilemap = $"../TileMap"
#BADBAD VERY BAD, JUST for testing, replace with official way later
@onready var player = %Player
var player_chase = false
var current_path: Array[Vector2i]
const speed = 25
var player_in_chat_zone = false


#
#func _process(delta):
	#if player_in_chat_zone and Input.is_key_pressed(KEY_E):
		#Dialogic.start("test_dialogue")
	
#func _physics_process(delta):
	#var dir = to_local(nav_agent.get_next_path_position()).normalized()
	#velocity = dir * speed
	#move_and_slide()
	
#on signal emit, collision or area
	#if keyinput = E
		#start dialogue



#Area ideas:
#Create an Area 2D to check for the player
	#if player in area, start creating rays
	#Create rays to check and lock into the player

##Goal right now, get the ai to chase the player without mouse clicking
#func _physics_process(delta):
	##if current path aint defined, we cant do anythoing
	#if player_chase:
		#global_position += (player.position - position)/speed
	###A* SEARCH STUFF## ---------------
	##if len(current_path) == 0:
		##return
	###if we have something on the ucrrent path, we wanna move through the path
	##var target_position = tilemap.map_to_local(current_path.front())
	###move to the target
	##global_position = global_position.move_toward(target_position, speed)#5 is the speed
		###current path contains position rel to tilepath
		##
	###if global position is in target position, then remove itt
	##if global_position == target_position:
		##current_path.pop_front()
	##pass
		#
#func _unhandled_input(event):
	#var click_position = get_global_mouse_position()
	#var player_position = player.position
	##Always detect player movement, aka while true
	##If area is in monsters range
	#if event.is_action_pressed("move_to"):
		##If player can walk to the position
		#if tilemap.is_point_walkable(player_position):
			##Get the possible paths
			#current_path = tilemap.astar.get_id_path(
				#tilemap.local_to_map(global_position),
				#tilemap.local_to_map(player_position)
			#).slice(1)
		##Function returns an array of all positions between two points
		##
## Get the gravity from the project settings to be synced with RigidBody nodes.
#
##get plyer reference
##@export var player: Node2D
##@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
###get navigation agent reference
##
##func _physics_process(delta):
	##var dir = to_local(nav_agent.get_next_path_position()).normalized()
	##velocity = dir * speed
	##move_and_slide()
##
##func makepath() -> void:
	##nav_agent.target_position = player.global_position
#
##AREA STUFF##
#func _on_detectionarea_body_entered(body):
	#player = body
	#player_in_chat_zone = true
	#
	##player_chase = true
#
#
#func _on_detectionarea_body_exited(body):
	#player = null
	#player_in_chat_zone = false
	#
	##player_chase = false
