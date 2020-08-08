extends Node

var yard_tile = null
var weapon_id = null
var weapon_pos

var mine_scn = preload("res://weapon/mine.tscn")

func drop_weapon():		
	# Process if values present
	if yard_tile != null and yard_tile.focus_on:
		weapon_pos = yard_tile.global_transform.origin
		if weapon_id == "mine":
			var mine = mine_scn.instance()
			mine.translation = weapon_pos
			get_node("/root/Level").add_child(mine)
			
			yard_tile.focus_on = false
			
			print("Spawn:", weapon_pos, weapon_id)
	
