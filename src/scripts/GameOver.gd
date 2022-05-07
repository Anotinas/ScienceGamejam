extends Node2D

func _ready():
	pass

func _on_RestartButton_pressed():
	SignalSingleton.emit_signal("restart_game")
