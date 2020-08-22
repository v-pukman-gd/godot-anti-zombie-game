extends Node

const MAX_WEAPON_DISTANCE = 15

var yard_tile = null
var weapon_id = null
var weapon_pos

const WEAPON_SCN = {
	"mine": preload("res://weapon/mine/mine.tscn"),
	"kid": preload("res://weapon/kid/kid.tscn"),
	"block_light": preload("res://obstacle/road_block/road_block_light.tscn"),
	"block_heavy": preload("res://obstacle/road_block/road_block_heavy.tscn"),
	"chair": preload("res://obstacle/chair/chair.tscn")
}

func drop_weapon():		
	# Process if values present
	if yard_tile != null and yard_tile.focus_on:
		weapon_pos = yard_tile.global_transform.origin
		if weapon_id != null and weapon_id != "":
			#TODO: refactor weapon path later
			var weapon_scn = WEAPON_SCN[weapon_id]
			var weapon = weapon_scn.instance()
			weapon.translation = weapon_pos
			get_node("/root/Level").add_child(weapon)
			
			yard_tile.set_focus(false)
			
			print("Spawn:", weapon_pos, weapon_id)
			
	yard_tile = null
	weapon_id = null
	
