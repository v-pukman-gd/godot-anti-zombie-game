extends Spatial

export (int) var life_span = 50

var is_collided = false
var zombie

onready var area = $Area

func _ready():
	area.add_to_group("obstacle")
	area.connect("area_entered", self, "_on_area_entered")

func _on_area_entered(area_entered):
	if area_entered.is_in_group("zombie"):
		zombie = area_entered.get_parent()
		if zombie and not is_collided:
			is_collided = true
			on_hit()
			
func on_hit():
	zombie.on_obstacle_hit(self)
	
func remove():
	queue_free()
