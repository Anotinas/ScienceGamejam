extends "res://src/NPC.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	dialogue_lines = ["Did you know that if you die, you reincarnate?", "Don't believe me? Try it"]

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
		SignalSingleton.emit_signal("unlocked_reincarnation")
		SignalSingleton.emit_signal("set_checkpoint")
