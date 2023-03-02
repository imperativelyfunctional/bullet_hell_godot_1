extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 5
	timer.connect("timeout", self, "update_modulate")
	add_child(timer)

func update_modulate():
	self_modulate.b = rand_range(0, 1)
