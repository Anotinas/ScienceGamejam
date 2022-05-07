extends Node

func toggle_clouds(value : bool):
	get_parent().set_collision_mask_bit(2, value)
