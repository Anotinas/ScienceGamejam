extends "res://src/NPC.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func talk():
	if current_dialogue > dialogue_lines.size() - 1:
		current_dialogue = 0
		$Background.visible = false
		$Dialogue.visible = false
	else:
		$Background.visible = true
		$Dialogue.visible = true	
		$Dialogue.text = dialogue_lines[current_dialogue]
		current_dialogue += 1
	
	if(current_dialogue == 0):
		SignalSingleton.emit_signal("unlocked_aliens")
