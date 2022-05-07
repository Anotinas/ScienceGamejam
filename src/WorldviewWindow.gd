extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalSingleton.connect("bookshelf_left", self, "hide")
	$RichTextLabel.text = "Worldviews selected: " + str(WorldviewManager.amount_selected) + " out of " + str(WorldviewManager.MAX_WORLDVIEWS)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if(self.)

func hide():
	for i in get_children():
		i.hide()
	
func show():
	for i in get_children():
		i.show()
	
	
func _on_CloudsButton_toggled(button_pressed):
	if (button_pressed):
		# This if check is due to a gimmick in how toggle mode works in Godot
		$HBoxContainer/CloudsButton.modulate = Color(0, 1, 0.5)
#		if (!WorldviewManager.beliefs["clouds_are_real"]):			
		WorldviewManager.set_worldview("clouds_are_real", true)
	else:
		$HBoxContainer/CloudsButton.modulate = Color(1, 1, 1)
		WorldviewManager.set_worldview("clouds_are_real", false)
	$RichTextLabel.text = "Worldviews selected: " + str(WorldviewManager.amount_selected) + " out of " + str(WorldviewManager.MAX_WORLDVIEWS)
