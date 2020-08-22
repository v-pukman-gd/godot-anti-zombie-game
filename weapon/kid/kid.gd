extends Spatial

var stone_scn = preload("res://weapon/kid/stone.tscn")

var visible_zombies = []
var visible_zombies_count = 0
var is_attacking = false

onready var mesh_anim = $KidMesh/AnimationPlayer

func _process(delta):
	visible_zombies_count = 0
	for z in visible_zombies:
		if is_instance_valid(z):
			if not z.is_dead:
				visible_zombies_count += 1
		else:
			visible_zombies.erase(z)
	
	if visible_zombies_count > 0:
		is_attacking = true
	else:
		is_attacking = false
		
	if is_attacking and mesh_anim.current_animation != "throw_anim":
		mesh_anim.play("throw_anim")
	elif not is_attacking and mesh_anim.current_animation != "idle":
		mesh_anim.play("idle")

func attack():
	var stone = stone_scn.instance()
	stone.translation = Vector3(1, 1.5, 0)
	add_child(stone)

func remove():
	queue_free()

func _on_vision_area_entered(area_entered):
	if area_entered.is_in_group("zombie"):
		var zombie = area_entered.get_parent()
		if zombie:
			visible_zombies.append(zombie)	
