extends Node


# Declare member variables here. Examples:

var gameInstance
var gameOverInstance
var reincarnationScene
var musicPlayer
onready var gameScene = preload("res://src/GameInstance.tscn")
onready var gameOver = preload("res://src/GameOver.tscn")
onready var reincarnation = preload("res://src/Reincarnation.tscn")
onready var winScreen = preload("res://src/WinScreen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	musicPlayer = get_child(0)
	musicPlayer.set_volume_db(SignalSingleton.sound_db)
	musicPlayer.set_autoplay(true)
	if (SignalSingleton.sound_lvl != 0):
		musicPlayer.play()
	#WorldviewManager.connect("worldview_changed", self, "_worldview_changed")
	SignalSingleton.connect("player_has_died", self, "_on_player_died")
	SignalSingleton.connect("restart_game", self, "_restart_game")
	SignalSingleton.connect("player_reincarnates", self, "_player_reincarnates")
	SignalSingleton.connect("player_wins", self, "_player_wins")
	SignalSingleton.connect("set_sound", self, "_set_sound")
	
	gameInstance = gameScene.instance()
	self.add_child(gameInstance)


func _on_player_died():
	# TODO : link up to object with world views saved
	if (WorldviewManager.beliefs["player_can_reincarnate"]):
		reincarnationScene = reincarnation.instance()
		#self.remove_child(gameInstance)
		self.add_child(reincarnationScene)
	else:
		gameOverInstance = gameOver.instance()
		self.add_child(gameOverInstance)

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

func _player_wins():
	gameInstance.queue_free()
	self.add_child(winScreen.instance())

func _set_sound(sound_db):
	if (SignalSingleton.sound_lvl != 0):
		musicPlayer.play()
	else:
		musicPlayer.stop()
	SignalSingleton.sound_db = sound_db
	musicPlayer.set_volume_db(SignalSingleton.sound_db)
