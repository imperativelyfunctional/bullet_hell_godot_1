extends AnimatedSprite

var Bullet_Scene = preload("res://bullet.tscn")
var shootTimer = Timer.new()
var run = false
var accelerate_speed: int = 30
var increase_speed = false
var base_speed:int = 50
var current_speed = base_speed
var rotate_enabled = false
const numbers = [0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180, 195, 210, 225, 240, 255, 270, 285, 300, 315, 330, 345, 360]

func _ready():
	shootTimer.wait_time = 0.1
	shootTimer.connect("timeout", self, "fire")
	shootTimer.autostart = true
	add_child(shootTimer)
	var init_timer = Timer.new()
	init_timer.one_shot = true
	init_timer.autostart = true
	init_timer.connect("timeout", self, "start")
	add_child(init_timer)
	var rotation_timer = Timer.new()
	rotation_timer.autostart = true
	rotation_timer.wait_time = 0.06
	rotation_timer.connect("timeout", self, "rotateSelf")
	add_child(rotation_timer)
	
func stop():
	run = false
	current_speed = base_speed
	var start_timer = Timer.new()
	start_timer.autostart = true
	start_timer.one_shot = true
	start_timer.wait_time = 3
	start_timer.connect("timeout", self, "start")
	rotate_enabled = !rotate_enabled
	add_child(start_timer)

func start():
	run = true
	increase_speed = !increase_speed
	var end_timer = Timer.new()
	end_timer.autostart = true
	end_timer.one_shot = true
	end_timer.wait_time = 3
	end_timer.connect("timeout", self, "stop")
	add_child(end_timer)
	
func rotateSelf():
	rotation += deg2rad(0)
	
func fire():
	if run :
		current_speed += accelerate_speed
		var r = rand_range(0, 60)
		var g = rand_range(0, 5)
		var b = rand_range(0, 10)
		for number in numbers:
			var bullet = Bullet_Scene.instance()
			bullet.ang = number + rad2deg(rotation)
			bullet.self_modulate.g = g
			bullet.self_modulate.r = r
			bullet.self_modulate.b = b
		#	if increase_speed:
		#		bullet.accelerate_speed = accelerate_speed/
			bullet.speed = current_speed
			bullet.position = position + Vector2(0 * cos(rotation), 50 * sin(rotation)) 
			get_parent().add_child(bullet)

func _process(delta):
	if rotate_enabled:
		rotation += deg2rad(1)
