extends ProgressBar

@export var player: CharacterBody2D

# Treating the anxiety bar as more of a 'tolerance' bar 
# perhaps reverse so goes up to max instead of to max?

# Also treats the anxiety bar like it's a health bar:
# does not necessarily account for "attachment" to individual "enemies"

# Called when the node enters the scene tree for the first time.
func _ready():
	player.anxChanged.connect(update)

func update():
	#Multiplies current anxiety by 100 and then divides from the max anxiety to produce a value. 
	value = player.currAnx * 100 / player.maxAnx
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
