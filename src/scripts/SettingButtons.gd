extends GridContainer

var volumeLabel
var VOLUME_TEXT = "Volume : "
var hSlider
var volume = 50
var MAX_DB = 10.0
var AMPLITUDE = 30

func _ready():
	volumeLabel = get_child(0)
	hSlider = get_child(1)
	hSlider.set_value(volume)

func _on_HSlider_value_changed(value):
	volume = hSlider.get_value()
	volumeLabel.set_text(VOLUME_TEXT + String(volume))
	SignalSingleton.sound_lvl = volume
	var volumeDB = (volume/100) * AMPLITUDE - AMPLITUDE + MAX_DB
	SignalSingleton.sound_db = volumeDB
	SignalSingleton.emit_signal("set_sound", volumeDB)
	
func getVolume() -> int:
	return volume
