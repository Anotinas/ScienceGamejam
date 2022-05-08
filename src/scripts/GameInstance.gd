extends Node2D

var player
var map

func _ready():
	SignalSingleton.connect("set_checkpoint", self, "_set_checkpoint")
	player = get_child(1)
	map = get_child(get_child_count()-1)

func goToLastCheckpoint():
	player.reincarnation()

func _set_checkpoint():
	map.set_checkpoint(player)
