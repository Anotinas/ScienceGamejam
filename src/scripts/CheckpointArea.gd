extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_CheckpointArea_body_entered(body):
	SignalSingleton.emit_signal("checkpoint_entered")
