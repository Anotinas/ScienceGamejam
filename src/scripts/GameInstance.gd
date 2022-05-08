extends Node2D

var player

func _ready():
	player = get_child(1)

func goToLastCheckpoint():
	player.reincarnation()
