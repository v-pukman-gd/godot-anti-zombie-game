extends Spatial

var speed = Vector3(0, 0, 1)
onready var fsm = $FSM3D
onready var anim = $ZombieMesh/AnimationPlayer

var life_span = 20

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
	
func on_weapon_hit(damage):
	if is_dead:
		return
		
	life_span -= damage
	if life_span <= 0:
		is_dead = true
