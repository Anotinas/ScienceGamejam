extends Node


# Declare member variables here. Examples:

var gameInstance
onready var gameScene = preload("res://src/GameInstance.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalSingleton.connect("player_has_died", self, "_on_player_died")
	
	gameInstance = gameScene.instance()
	self.add_child(gameInstance)


func _on_player_died():
	
	print("reset")

	gameInstance.queue_free() #DON'T ADD ANOTHER CHILD TO GameManager

	gameInstance = gameScene.instance()
	self.add_child(gameInstance)

		
