extends Spatial

onready var focus_mesh = $FocusMesh
var focus_on = false

func _on_mouse_entered():	
	focus_on = true	
	focus_mesh.show()
	Game.yard_tile = self

func _on_mouse_exited():	
	focus_on = false	
	focus_mesh.hide()

