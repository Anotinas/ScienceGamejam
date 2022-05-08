extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dialogue_lines = ["Henlo", "Skies are nice today, aren't they?", "I wonder what it feels like to walk on clouds..."]
var current_dialogue: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Background.rect_position = $Dialogue.rect_position	
	$Background.rect_size = $Dialogue.rect_size
	
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
