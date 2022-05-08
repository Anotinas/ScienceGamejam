extends GridContainer

var volumeLabel
var VOLUME_TEXT = "Volume : "
var hSlider
var volume = 50

func _ready():
	volumeLabel = get_child(0)
	hSlider = get_child(1)
	hSlider.set_value(volume)

func _on_HSlider_value_changed(value):
	volume = hSlider.get_value()
	volumeLabel.set_text(VOLUME_TEXT + String(volume))
	
func getVolume() -> int:
	return volume
