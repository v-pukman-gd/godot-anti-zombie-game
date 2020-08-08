extends Spatial

onready var focus_mesh = $FocusMesh
var focus_on = false

func _on_mouse_entered():	
	if Game.weapon_id:
		set_focus(true)
		Game.yard_tile = self

func _on_mouse_exited():	
	set_focus(false)

func set_focus(val):
	focus_on = val
	if focus_on:
		focus_mesh.show()
	else:
		focus_mesh.hide()
