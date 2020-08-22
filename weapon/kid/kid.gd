extends Spatial

var stone_scn = preload("res://weapon/kid/stone.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func attack():
	var stone = stone_scn.instance()
	stone.translation = Vector3(1, 1.5, 0)
	add_child(stone)


func remove():
	queue_free()
