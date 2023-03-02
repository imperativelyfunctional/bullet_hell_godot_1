extends Sprite

class_name Bullet

var ang: float
var speed: int
var accelerate_speed: int = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	speed += accelerate_speed
	position += Vector2(cos(deg2rad(ang)), sin(deg2rad(ang))) * speed * delta

func _on_onScreenNotifier_screen_exited():
	queue_free() # Replace with function body # Replace with function body.
