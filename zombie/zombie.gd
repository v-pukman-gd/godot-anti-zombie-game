extends Spatial

var speed = Vector3(-1, 0, 0)
onready var fsm = $FSM3D
onready var anim = $ZombieMesh/AnimationPlayer

onready var flag = $ZombieMesh/Armature/Skeleton/BoneAttachment/Flag

export (bool) var with_flag = false

var life_span = 20
var attack_strength = 5

var is_walking = false
var is_dead = false
var is_stuck = false

var obstacle = null

func _ready():
	fsm.init()
	
	if with_flag:
		flag.show()
	
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

func on_obstacle_hit(obstacle):
	is_stuck = true
	self.obstacle = obstacle
	
func attack_obstacle():
	print("attack_obstacle")
	if is_stuck and obstacle:
		obstacle.on_attacked_by_zombie(attack_strength)
		if obstacle.is_destroyed:
			is_stuck = false
			obstacle = null

func on_destroyed():
	queue_free()
