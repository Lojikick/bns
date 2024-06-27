extends ProgressBar
@export var player: CharacterBody2D

#Similar to anxiety

# Called when the node enters the scene tree for the first time.
func _ready():
	player.trustChanged.connect(update)

func update():
	#Multiplies current anxiety by 100 and then divides from the max anxiety to produce a value. 
	value = player.currTrust * 100 / player.maxTrust
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
