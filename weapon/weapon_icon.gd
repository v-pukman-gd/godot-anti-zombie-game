#tool
extends Node2D

# params:
var is_static = true
var weapon_id: String
var icon_scale = 1.0
var icon_texture: Texture 
#####

var normal_color = Color("d7d7d7")
var active_color = Color("ffffff")

onready var sprite = $Sprite
onready var icon_sprite = $Sprite/IconSprite

var on_focus = false
var dragging = false
var orinal_pos

var is_configured = false
var setup_completed = false

func setup():
	orinal_pos = self.position
	
	if is_static:
		if weapon_id:
			$Label.text = weapon_id
	else:
		$Label.text = ""
		
	icon_sprite.scale = Vector2(icon_scale, icon_scale)
	icon_sprite.texture = icon_texture

func _process(delta):
	if not is_configured:
		return
		
	if not setup_completed:
		setup()
		setup_completed = true
		
	if is_static:
		return
		
	if not dragging and on_focus and Input.is_action_pressed("pick_weapon") and not Game.weapon_id:
		#position = get_global_mouse_position()
		dragging = true
		
	if dragging and Input.is_action_just_released("pick_weapon"):
		dragging = false
		position = orinal_pos
		Game.drop_weapon()
		
	if dragging:
		position = get_global_mouse_position() - self.get_parent().position
		Game.weapon_id = weapon_id
		
func _on_area_mouse_entered():
	if is_static:
		sprite.modulate = normal_color # static is not highlighted
	else:
		sprite.modulate = active_color
		#sprite.scale = Vector2(1.1, 1.1)
		on_focus = true


func _on_area_mouse_exited():
	if is_static:
		sprite.modulate = normal_color # static is not highlighted
	else:
		sprite.modulate = normal_color
		#sprite.scale = Vector2(1, 1)
		on_focus = false
