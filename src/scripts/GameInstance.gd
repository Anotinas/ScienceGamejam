extends Node2D

var player

func _ready():
	player = get_child(0)

func goToLastCheckpoint():
	player.reincarnation()
