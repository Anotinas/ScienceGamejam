extends KinematicBody2D


const GRAVITY = 1200
const WALK_SPEED = 200
const JUMP_FORCE = 750

var velocity = Vector2()
var screen_size
var initialPosition
var camera
var is_dead :bool = false
var is_at_bookself: bool = false

var is_at_npc: bool = false
var last_npc = null



func _ready():
	$"Main Window".hide()
	initialPosition = position
	screen_size = get_viewport_rect().size
	camera = get_child(get_child_count()-1)
	SignalSingleton.connect("bookshelf_entered", self, "_on_bookshelf_entered")
	SignalSingleton.connect("bookshelf_left", self, "_on_bookshelf_left")
	
	SignalSingleton.connect("checkpoint_entered", self, "_checkpoint_entered")
	
	WorldviewManager.connect("beliefs_changed", self, "_on_beliefs_changed")


func _physics_process(delta):
	velocity.y += delta * GRAVITY
	
	if Input.is_action_pressed("left"):
		velocity.x = -WALK_SPEED
		$Sprite.play("running")		
	elif Input.is_action_pressed("right"):
		velocity.x = WALK_SPEED
		$Sprite.play("running")		
	elif Input.is_action_just_pressed("ui_accept"):
		# THIS IS DEBUG
		# WorldviewManager.set_worldview("aliens_are_real", true)
		if(is_at_bookself):
			open_bookshelf()
		if(is_at_npc):
			last_npc.talk()
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
		$Sprite.play("idle")		
		
	if velocity.x < 0:
		$Sprite.scale.x = -0.344
	else:
		$Sprite.scale.x = 0.344
	
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
	

func open_bookshelf():
	$"Main Window".show()
	

func _on_bookshelf_entered():
	#is_at_bookself = true
	pass


func _on_bookshelf_left():
	#is_at_bookself = false
	pass


func _on_beliefs_changed():
	if (WorldviewManager.beliefs["clouds_are_real"]):
		set_collision_mask_bit(2, true)
	else:
		set_collision_mask_bit(2, false)


func reincarnation():
	position = initialPosition
	camera.setCurrent(true)
	is_dead = false


func _on_InteractionBox_area_entered(area):
	if (area.is_in_group("npc")):
		print("Henlo again")
		is_at_npc = true
		last_npc = area.get_parent()
	elif (area.is_in_group("bookshelf")):
		is_at_bookself = true


func _on_InteractionBox_area_exited(area):
	if (area.is_in_group("npc")):
		print("Gubai again")			
		is_at_npc = false
		last_npc = null
	elif (area.is_in_group("bookshelf")):
		is_at_bookself = false

func _checkpoint_entered():
	if (WorldviewManager.beliefs["player_can_reincarnate"]):
		initialPosition = position

func set_checkpoint(var position):
	initialPosition = position

