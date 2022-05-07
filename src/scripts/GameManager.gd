extends Node


# Declare member variables here. Examples:

var gameInstance
var gameOverInstance
onready var gameScene = preload("res://src/GameInstance.tscn")
onready var gameOver = preload("res://src/GameOver.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalSingleton.connect("player_has_died", self, "_on_player_died")
	SignalSingleton.connect("restart_game", self, "_restart_game")
	
	gameInstance = gameScene.instance()
	self.add_child(gameInstance)


func _on_player_died():
	print("reset")

	gameInstance.queue_free() #DON'T ADD ANOTHER CHILD TO GameManager

	gameOverInstance = gameOver.instance()
	self.add_child(gameOverInstance)

func _restart_game():
	gameOverInstance.queue_free()
	
	gameInstance = gameScene.instance()
	self.add_child(gameInstance)

