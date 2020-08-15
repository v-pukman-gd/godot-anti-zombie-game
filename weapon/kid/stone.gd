extends "res://weapon/base_weapon.gd"

var speed = Vector3(0, 1, -5)
var g = Vector3(0, -1, 0)

func _process(delta):
	speed += g * delta
	translation += speed * delta

func on_hit():
	.on_hit()
	remove()
