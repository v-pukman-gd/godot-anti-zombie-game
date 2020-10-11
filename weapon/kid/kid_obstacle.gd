extends "res://obstacle/base_obstacle.gd"


func on_destroyed():
	get_parent().remove()
