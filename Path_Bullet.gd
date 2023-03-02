extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var path : Path2D = null
# Called when the node enters the scene tree for the first time.
func _ready():
	path = Path2D.new()
	add_child(path)
	var curve = Curve2D.new()
	curve.add_point(Vector2(0, 0))
	curve.add_point(Vector2(600, 600))
	path.curve = curve
	var path_Follow = PathFollow2D.new()
	add_child(path_Follow)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
