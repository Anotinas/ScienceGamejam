extends Node


# Declare member variables here. Examples:

var gameInstance
var gameOverInstance
var reincarnationScene
onready var gameScene = preload("res://src/GameInstance.tscn")
onready var gameOver = preload("res://src/GameOver.tscn")
onready var reincarnation = preload("res://src/Reincarnation.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	WorldviewManager.connect("worldview_changed", self, "_worldview_changed")
	SignalSingleton.connect("player_has_died", self, "_on_player_died")
	SignalSingleton.connect("restart_game", self, "_restart_game")
	SignalSingleton.connect("player_reincarnates", self, "_player_reincarnates")

	gameInstance = gameScene.instance()
	self.add_child(gameInstance)


func _on_player_died():
	# TODO : link up to object with world views saved
	if (WorldviewManager.beliefs["player_can_reincarnate"]):
		reincarnationScene = reincarnation.instance()
		#self.remove_child(gameInstance)
		self.add_child(reincarnationScene)
	else:
		_restart_game()

func _restart_game():
	gameOverInstance.queue_free()
	
	gameInstance = gameScene.instance()
	get_parent().add_child(gameInstance)

func _worldview_changed():
	print(str(WorldviewManager.beliefs))


func _player_reincarnates():
	gameInstance.goToLastCheckpoint()
	reincarnationScene.queue_free()
	self.add_child(gameInstance)
