extends Node2D

func _ready():
	pass

func _on_ReincarnationButton_pressed():
	SignalSingleton.emit_signal("player_reincarnates")
