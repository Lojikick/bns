extends ProgressBar

@export var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player.healthChanged.connect(update)

func update():
	#Multiplies current health by 100 and then divides from the max health to produce a value. 
	value = player.currHealth * 100 / player.maxHealth
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
