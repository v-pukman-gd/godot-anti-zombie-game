extends "res://weapon/base_weapon.gd"

func on_hit():
	.on_hit()
	$AnimationPlayer.play("explode") # will call hide_mesh and remove

func hide_mesh():
	$CSGMesh.hide()
