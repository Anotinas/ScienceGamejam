extends "res://src/NPC.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	dialogue_lines = ["Greetings mortal, welcome to Heaven", "Kinda strange that you would come here, most humans have figured out place isn't real"]


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
		var timer = Timer.new()
		timer.set_wait_time(2)
		timer.start()
		SignalSingleton.emit_signal("remove_heaven")
