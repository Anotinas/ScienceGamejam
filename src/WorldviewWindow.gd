extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalSingleton.connect("bookshelf_left", self, "hide")
	$RichTextLabel.text = "Worldviews selected: " + str(WorldviewManager.amount_selected) + " out of " + str(WorldviewManager.MAX_WORLDVIEWS)
	
	if(WorldviewManager.unlocked_beliefs.has("clouds_are_real")):
		addCloudButton()
	else:
		SignalSingleton.connect("unlocked_clouds", self, "addCloudButton")
		
	if(WorldviewManager.unlocked_beliefs.has("aliens_are_real")):
		addAliensButton()
	else:
		SignalSingleton.connect("unlocked_aliens", self, "addAliensButton")

	if(WorldviewManager.unlocked_beliefs.has("heaven_is_real")):
		addHeavenButton()
	else:
		SignalSingleton.connect("unlocked_heaven", self, "addHeavenButton")
		
	if(WorldviewManager.unlocked_beliefs.has("player_reincarnates")):
		addReincarnationButton()
	else:
		SignalSingleton.connect("unlocked_reincarnation", self, "addReincarnationButton")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if(self.)

func hide():
	for i in get_children():
		i.hide()
	
func show():
	for i in get_children():
		i.show()

func unlockBelief(worldview_name: String) -> bool:
	if (!WorldviewManager.unlocked_beliefs.has(worldview_name)):
		WorldviewManager.unlocked_beliefs.append(worldview_name)
		return true
	return false

func addCloudButton() -> void:
	var success = unlockBelief("clouds_are_real")
	if (success):
		var cloud_button = WorldviewManager.cloud_button.instance()
		$HBoxContainer.add_child(cloud_button)
		cloud_button.connect("toggled", self, "_on_CloudsButton_toggled")
	
func addAliensButton() -> void:
	var success = unlockBelief("aliens_are_real")
	if (success):
		var aliens_button = WorldviewManager.aliens_button.instance()
		$HBoxContainer.add_child(aliens_button)
		aliens_button.connect("toggled", self, "_on_AliensButton_toggled")

func addHeavenButton() -> void:
	var heaven_button = WorldviewManager.heaven_button.instance()
	$HBoxContainer.add_child(heaven_button)
	heaven_button.connect("toggled", self, "_on_HeavenButton_toggled")
	
func addReincarnationButton() -> void:
	var reincarnation_button = WorldviewManager.reincarnation_button.instance()
	WorldviewManager.beliefs["player_can_reincarnate"] = true
	$HBoxContainer.add_child(reincarnation_button)
	reincarnation_button.connect("toggled", self, "_on_ReincarnationButton_toggled")

func _on_CloudsButton_toggled(button_pressed):
	print("pressed")
	if (button_pressed):
		# This if check is due to a gimmick in how toggle mode works in Godot
		$HBoxContainer/CloudsButton.modulate = Color(0, 1, 0.5)
#		if (!WorldviewManager.beliefs["clouds_are_real"]):
		WorldviewManager.set_worldview("clouds_are_real", true)
	else:
		$HBoxContainer/CloudsButton.modulate = Color(1, 1, 1)
		WorldviewManager.set_worldview("clouds_are_real", false)
	$RichTextLabel.text = "Worldviews selected: " + str(WorldviewManager.amount_selected) + " out of " + str(WorldviewManager.MAX_WORLDVIEWS)

func _on_HeavenButton_toggled(button_pressed):
	print("pressed")
	if (button_pressed):
		# This if check is due to a gimmick in how toggle mode works in Godot
		$HBoxContainer/HeavenButton.modulate = Color(0, 1, 0.5)
#		if (!WorldviewManager.beliefs["clouds_are_real"]):
		WorldviewManager.set_worldview("heaven_is_real", true)
	else:
		$HBoxContainer/HeavenButton.modulate = Color(1, 1, 1)
		WorldviewManager.set_worldview("heaven_is_real", false)
	$RichTextLabel.text = "Worldviews selected: " + str(WorldviewManager.amount_selected) + " out of " + str(WorldviewManager.MAX_WORLDVIEWS)

func _on_AliensButton_toggled(button_pressed):
	print("pressed")
	if (button_pressed):
		# This if check is due to a gimmick in how toggle mode works in Godot
		$HBoxContainer/AliensButton.modulate = Color(0, 1, 0.5)
#		if (!WorldviewManager.beliefs["clouds_are_real"]):
		WorldviewManager.set_worldview("aliens_are_real", true)
	else:
		$HBoxContainer/AliensButton.modulate = Color(1, 1, 1)
		WorldviewManager.set_worldview("aliens_are_real", false)
	$RichTextLabel.text = "Worldviews selected: " + str(WorldviewManager.amount_selected) + " out of " + str(WorldviewManager.MAX_WORLDVIEWS)


func _on_ReincarnationButton_toggled(button_pressed):
	if (button_pressed):
		# This if check is due to a gimmick in how toggle mode works in Godot
		$HBoxContainer/ReincarnationButton.modulate = Color(0, 1, 0.5)
#		if (!WorldviewManager.beliefs["clouds_are_real"]):			
		WorldviewManager.set_worldview("player_can_reincarnate", true)
	else:
		$HBoxContainer/ReincarnationButton.modulate = Color(1, 1, 1)
		WorldviewManager.set_worldview("player_can_reincarnate", false)
	$RichTextLabel.text = "Worldviews selected: " + str(WorldviewManager.amount_selected) + " out of " + str(WorldviewManager.MAX_WORLDVIEWS)
