extends Area2D


func action() -> void:
	#Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("test_dialogue")
	#TBD: use dialogic files instead
