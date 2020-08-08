extends Node

var weapon_pos = null

var mine_scn = preload("res://weapon/mine.tscn")

func drop_weapon(weapon_id):
	if weapon_pos == null:
		return
	
	if weapon_id == "mine":
		var mine = mine_scn.instance()
		mine.translation = weapon_pos
		get_node("/root/Level").add_child(mine)
		
		weapon_pos = null
		print(weapon_pos, weapon_id)
