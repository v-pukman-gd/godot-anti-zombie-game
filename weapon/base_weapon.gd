extends Spatial

export (int) var damage = 10

var is_collided = false
var zombie

onready var area = $Area

func _ready():
	area.connect("area_entered", self, "_on_area_entered")

func _on_area_entered(area_entered):
	if area_entered.is_in_group("zombie"):
		zombie = area_entered.get_parent()
		if zombie and not zombie.is_dead and not is_collided:
			is_collided = true
			on_hit()
		
func on_hit():
	zombie.on_weapon_hit(damage)
	
# TODO: add object pool. instead of destory back to pool here
func remove():
	queue_free()
