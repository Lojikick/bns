extends Area2D
#Dont undrstand why collisions arent working ugh
#convert so it works for CharacterBody2D

@export var speed = 400
var screen_size

#my own solution to idle anims, smart for now, 
#but prolly want something more elegant for later TBH LOL
var idle_anim = {"temp_side": "side_idle",
				 "side_idle" : "side_idle",
				 "up_idle" : "up_idle",
				 "down_idle" : "down_idle",
				 "temp_up": "up_idle", 
				 "temp_down":"down_idle"}
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	#if Input.is_action_pressed("ui_accept"):
		#var actionables = actionable_finder.get_overlapping_areas()
		#if actionables.size() > 0:
			#actionables[0].action()
		#return
	if Input.is_action_pressed("right"):
		print("")
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else: 
		$AnimatedSprite2D.animation = idle_anim[$AnimatedSprite2D.get_animation()]

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "temp_side"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		if velocity.y < 0:
			$AnimatedSprite2D.animation = "temp_up"
		else:
			$AnimatedSprite2D.animation = "temp_down"


		
