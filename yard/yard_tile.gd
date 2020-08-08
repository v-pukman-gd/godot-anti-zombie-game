extends Spatial

onready var focus_mesh = $FocusMesh

func _on_mouse_entered():
	#print("mmouse enter!", self)
	focus_mesh.show()
	Game.weapon_pos = self.global_transform.origin
	
	print(Game.weapon_pos)

func _on_mouse_exited():
	#print("mouse exit!", self)
	focus_mesh.hide()
	Game.weapon_pos = null

