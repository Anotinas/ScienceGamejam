extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const MAX_WORLDVIEWS : int = 5
var amount_selected : int = 0


var beliefs = {"clouds_are_real" : false, "player_can_reincarnate" : false}

signal beliefs_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_worldview(worldview_name: String, state: bool):
	beliefs[worldview_name] = state
	emit_signal("beliefs_changed")
	if (state):
		amount_selected += 1
	else:
		amount_selected -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
