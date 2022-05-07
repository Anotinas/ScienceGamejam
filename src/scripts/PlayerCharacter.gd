extends KinematicBody2D


const GRAVITY = 600
const WALK_SPEED = 200
const JUMP_FORCE = 500

var velocity = Vector2()
var screen_size
var is_dead :bool = false
var initialPosition
var camera

func _ready():
	initialPosition = position
	screen_size = get_viewport_rect().size
	camera = get_child(get_child_count()-1)

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	
	if Input.is_action_pressed("left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("right"):
		velocity.x = WALK_SPEED
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
	
	if Input.is_action_pressed("up") and is_on_floor():
		velocity.y = -JUMP_FORCE
	 
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_DeathBox_body_entered(body):
	if(!is_dead):
		SignalSingleton.emit_signal("player_has_died")
	is_dead = true


func _on_DeathBox_area_entered(area):
	if(!is_dead):
		SignalSingleton.emit_signal("player_has_died")
	is_dead = true
	
func reincarnation():
	position = initialPosition
	camera.setCurrent(true)
	is_dead = false
