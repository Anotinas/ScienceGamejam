extends KinematicBody2D


# Declare member variables here. Examples:
var speed = 150
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.dw
func _process(delta):
	var movement : Vector2

	if(Input.is_action_pressed("right")):
		movement.x = speed * delta
	elif(Input.is_action_pressed("left")):
		movement.x = -(speed * delta)

	if(Input.is_action_pressed("up")):
		movement.y = -(speed * delta)
	else:
		pass

	move_and_collide(movement)
