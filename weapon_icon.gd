extends Node2D

export (bool) var is_static = true
export (String) var weapon_id = "mine"

var normal_color = Color("d7d7d7")
var active_color = Color("ffffff")

onready var sprite = $Sprite
var on_focus = false
var dragging = false
var orinal_pos

func _ready():
	orinal_pos = self.position
	if is_static:
		$Label.text = weapon_id
	else:
		$Label.text = ""

func _process(delta):
	if is_static:
		return
		
	if not dragging and on_focus and Input.is_action_pressed("pick_weapon"):
		#position = get_global_mouse_position()
		dragging = true
		
	if dragging and Input.is_action_just_released("pick_weapon"):
		dragging = false
		position = orinal_pos
		Game.drop_weapon()
		
	if dragging:
		position = get_global_mouse_position()
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
