extends Node2D

@onready var choice_button_scn = preload("res://addons/ChoiceButton.tscn")
# Called when the node enters the scene tree for the first time.
var choice_buttons: Array[Button] = []
func _ready(): #When the game first starts, ready will be called
	add_choice("this is choice number 0")
	add_choice("this is choice number 1")
#clears up choice button

func clear_dialogue_box():
	$VBoxContainer/Label.text = ""
	for choice in choice_buttons:
		$VBoxContainer.remove_child(choice)
	choice_buttons = []
	
func add_text(text: String):
	$VBoxContainer/Label.text = text
	

func add_choice(choice_text: String):
	var button_obj: ChoiceButton = choice_button_scn.instantiate()
	button_obj.choice_index = choice_buttons.size()
	choice_buttons.push_back(button_obj)
	button_obj.text = choice_text
	button_obj.choice_selected.connect(_on_choice_selected) #Signal that connects to on cjoice selected
	$VBoxContainer.add_child(button_obj)

func _on_choice_selected(choice_index: int):
	print(choice_index)  #0 for the first choice, 1 for the second text
	($"../EzDialogue" as EzDialogue).next(choice_index)	
	pass


