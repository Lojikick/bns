extends Node

signal dialogue_completed

var dialogues_completed = 0

@export var Player: PackedScene
@export var Velma: CharacterBody2D
@export var Strooz: CharacterBody2D
@export var Anya: CharacterBody2D
@export var Baljeet: CharacterBody2D

func _ready():
	var player_instance = Player.instantiate()
	 #need to make sure does not increase when talking to same person, later issue
	
	print(player_instance.character_name)
	print(Velma.character_name)
	print(Strooz.character_name)
	print(Anya.character_name)
	print(Baljeet.character_name)
	#Instantiate npcs
		#Set their names, as a start
	#remove instance if no longer needed
	
	#upon dialogue interaction, increase 
	#Need a system for handling
	#Dialogues Completed
		#Global Variable
	#Clues found, start with three
	
	connect("dialogue_completed", Callable(self, "_on_dialogue_completed"))
	
func _on_dialogue_completed():
	dialogues_completed += 1
	print("Dialogues completed: ", dialogues_completed)

func complete_dialogue():
	dialogue_completed.emit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
