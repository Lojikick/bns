extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("test_dialogue")
	#Dialogic.VAR.response = "yo!"
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_dialogic_signal(argument: String):
	if argument == "its a signal":
		print("A signal was fired via dialogic")
