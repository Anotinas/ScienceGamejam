extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var cloud_button = preload("res://CloudsButton.tscn")

const MAX_WORLDVIEWS : int = 5
var amount_selected : int = 0

var unlocked_beliefs: Array = []

var beliefs = {
				"clouds_are_real" : false,
				"hell_exists": false,
				"heaven_exists": false,
				"player_can_reincarnate": false,
				"aliens_are_real": false}


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
