extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_InteractableArea_body_entered(body):
	SignalSingleton.emit_signal("bookshelf_entered")


func _on_InteractableArea_body_exited(body):
	SignalSingleton.emit_signal("bookshelf_left")
