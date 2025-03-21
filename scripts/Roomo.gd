extends Node2D

var xMove:float
var yMove:float
var moveMulti:float = 2;
var stammy:float = 1;

var sprite:AnimatedSprite2D;

# Called when the node enters the scene tree for the first time.
func _ready():
	stammy = 1;
	sprite = get_node("AnimatedSprite2D");
	sprite.play("idle");
	pass # Replace with function body.


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
	
	if xMove == 0 && yMove == 0 && sprite.animation == "walk" && sprite.animation != "idle":
		sprite.play("idle");
	else:
		if xMove != 0 || yMove != 0:
			if sprite.animation != "walk":
				sprite.play("walk");
	
	pass
