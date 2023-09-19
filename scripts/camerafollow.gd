extends Camera2D

var sprite:Node2D;
var xMove:float
var yMove:float
var moveMulti:float = 2;
var stammy:float = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	stammy = 1;
	#sprite = get_parent().get_node("Roomo");
	pass # Replace with function body.


#god this sucks so bad im not used to this at alll
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("run") && stammy > 0:
		moveMulti = 5;
		stammy -= 0.1 * delta;
	else:
		moveMulti = 2;
		
	if !Input.is_action_pressed("run") && stammy < 1:
		stammy += 0.05 * delta;
		
	xMove = 0;
	yMove = 0;
	
	if Input.is_action_pressed("up"):
		yMove -= 1;
	if Input.is_action_pressed("down"):
		yMove += 1;
	if Input.is_action_pressed("left"):
		xMove -= 1;
	if Input.is_action_pressed("right"):
		xMove += 1;
		
	position.x += xMove * moveMulti;
	position.y += yMove * moveMulti;
	pass
