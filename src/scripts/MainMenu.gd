extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var game = preload("res://src/GameManager.tscn")
# TODO : remove
onready var settings = preload("res://src/SettingsMenu.tscn")
var menu
var gameInstance
# Called when the node enters the scene tree for the first time.
func _ready():
	menu = self.get_child(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	gameInstance = game.instance()
	self.remove_child(menu)
	self.add_child(gameInstance)
	#self.add_child(settings.instance())
