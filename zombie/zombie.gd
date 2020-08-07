extends Spatial

var speed = Vector3(0, 0, 1)
onready var fsm = $FSM3D
onready var anim = $ZombieMesh/AnimationPlayer

var is_walking = false
var is_dead = false

func _ready():
	fsm.init()
	
func _input(event):
	if event.is_action_pressed("start"):
		is_walking = true
	elif event.is_action_pressed("ui_cancel"):
		is_dead = true

func walk(delta):
	self.translation += speed * delta
