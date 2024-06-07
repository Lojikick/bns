class_name ChoiceButton extends Button

var choice_index: int

signal choice_selected(choice_index)
# Called when the node enters the scene tree for the first time.
func _on_pressed():
	choice_selected.emit(choice_index)
	pass
