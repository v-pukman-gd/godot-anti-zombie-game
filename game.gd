extends Node

const MAX_WEAPON_DISTANCE = 15

var yard_tile = null
var weapon_id = null
var weapon_pos

func drop_weapon():		
	# Process if values present
	if yard_tile != null and yard_tile.focus_on:
		weapon_pos = yard_tile.global_transform.origin
		if weapon_id != null and weapon_id != "":
			#TODO: refactor weapon path later
			var weapon_scn = load("res://weapon/"+weapon_id+"/"+weapon_id+".tscn")
			var weapon = weapon_scn.instance()
			weapon.translation = weapon_pos
			get_node("/root/Level").add_child(weapon)
			
			yard_tile.set_focus(false)
			
			print("Spawn:", weapon_pos, weapon_id)
			
	yard_tile = null
	weapon_id = null
	
