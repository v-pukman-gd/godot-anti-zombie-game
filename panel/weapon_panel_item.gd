#tool
extends Node2D

export (String) var weapon_id = ""
export (float) var icon_scale = 1
export(Texture) var icon_texture 

onready var icon_static = $WeaponIconStatic
onready var icon = $WeaponIcon

var setup_completed = false

func _process(delta):
	if not setup_completed:
		setup()
		setup_completed = true
	
func setup():
	icon_static.is_static = true
	icon_static.weapon_id = weapon_id
	icon_static.icon_scale = icon_scale
	icon_static.icon_texture = icon_texture
	icon_static.is_configured = true
	
	icon.is_static = false
	icon.weapon_id = weapon_id
	icon.icon_scale = icon_scale
	icon.icon_texture = icon_texture
	icon.is_configured = true
