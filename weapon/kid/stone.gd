extends "res://weapon/base_weapon.gd"

var speed = Vector3(5, 1, 0)
var g = Vector3(0, -1, 0)
var distance = 0

func _process(delta):
	speed += g * delta
	translation += speed * delta
	
	distance += abs(speed.x) * delta
	if distance > Game.MAX_WEAPON_DISTANCE:
		remove()

func on_hit():
	.on_hit()
	remove()
