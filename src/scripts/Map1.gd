extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var checkpoint

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalSingleton.connect("remove_heaven", self, "remove_heaven")
	checkpoint = get_child(get_child_count()-1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func remove_heaven() -> void:
	$"Heaven clouds".queue_free()
	
func set_checkpoint(var player):
	player.set_checkpoint(checkpoint.position)

