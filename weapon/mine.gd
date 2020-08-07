extends Spatial

var is_collided = false
var zombie

func _on_area_entered(area):
	if area.is_in_group("zombie") and not is_collided:
		is_collided = true
		zombie = area.get_parent()
		on_collided()
		
func on_collided():
	zombie.is_dead = true
	hide()
	queue_free()
