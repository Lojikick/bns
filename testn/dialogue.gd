extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("test_dialogue")
	#send signal to player
	#Dialogic.VAR.response = "yo!"
	pass

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	#send signal to player
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_dialogic_signal(argument: String):
	#Figure out how to get this called
	if argument == "its a signal":
		print("A signal was fired via dialogic")
	#Trigger end signal function
