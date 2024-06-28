extends CharacterBody2D


@onready var actionable_finder: Area2D = $Direction/ActionableFinder
const JUMP_VELOCITY = -400.0
@export var speed = 200
var is_dialogue_active = false

var idle_anim = {"side": "side_idle",
				 "side_idle" : "side_idle",
				 "front_idle" : "front_idle",
				 "back_idle" : "back_idle",
				 "front": "front_idle", 
				 "back":"back_idle"}
var screen_size
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	screen_size = get_viewport_rect().size

#TBD: NICE: NOW IGNORE RESPONSES TO E BUTTOn
func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_input"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var velocity = Vector2.ZERO
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	if is_dialogue_active == false:
		var velocity = Vector2.ZERO
		if Input.is_action_pressed("right"):
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
			$AnimatedSprite2D.animation = "side"
			$AnimatedSprite2D.flip_v = false
			$AnimatedSprite2D.flip_h = velocity.x > 0
		elif velocity.y != 0:
			if velocity.y < 0:
				$AnimatedSprite2D.animation = "back"
			else:
				$AnimatedSprite2D.animation = "front"
		move_and_slide()
	

#Signal: ON DIALOGUE START:
	#dialogue = True
	
#Signal: ON DIALOGUE END:
	#dialogue = False
