extends KinematicBody2D

export (int) var speed = 350
export (int) var jump_speed = -450
export (int) var GRAVITY = 1200

var spawnpoint
var screen_bottom = OS.get_window_size().y + 200

const UP = Vector2(0,-1)
const DOUBLETAP_DELAY = .25
var velocity = Vector2()
var doubletap_timer = DOUBLETAP_DELAY

export (int) var friction = 10
var dynamic_speed = speed

var jump_count = 0
var right_count = 0
var left_count = 0
var dash_flag = false
var plunge_flag = false

func jump():
	if is_on_floor():
		jump_count = 0
	if is_on_floor() and Input.is_action_just_pressed("up"):
		velocity.y = jump_speed
	elif not is_on_floor() and jump_count == 0 and Input.is_action_just_pressed("up"):
		velocity.y = jump_speed*4/5	# less strong jump for doublejump
		jump_count = 1

func move_right():
	if Input.is_action_pressed("right"):
		print(right_count)
		velocity.x = dynamic_speed
		if doubletap_timer >= 0 and right_count == 2:
			dash_flag = true
		if dash_flag == true:
			velocity.x *= 2
	if Input.is_action_just_pressed("right"):
		right_count += 1
		doubletap_timer = DOUBLETAP_DELAY
	if Input.is_action_just_released("right"):
		dash_flag = false
		velocity.x = 0
		if right_count == 2:
			right_count = 0
			doubletap_timer = DOUBLETAP_DELAY

func move_left():
	if Input.is_action_pressed("left"):
		print(right_count)
		velocity.x = -dynamic_speed
		if doubletap_timer >= 0 and left_count == 2:
			dash_flag = true
		if dash_flag == true:
			velocity.x *= 2
	if Input.is_action_just_pressed("left"):
		left_count += 1
		doubletap_timer = DOUBLETAP_DELAY
	if Input.is_action_just_released("left"):
		dash_flag = false
		velocity.x = 0
		if left_count == 2:
			left_count = 0
			doubletap_timer = DOUBLETAP_DELAY

func crouch():
	if is_on_floor() and dash_flag == false and Input.is_action_pressed("down"):
		velocity.x *= .5

func slide():
	if dynamic_speed > 0 and is_on_floor() and dash_flag == true and Input.is_action_pressed("down"):
		dynamic_speed -= friction
	if Input.is_action_just_released("down") or not is_on_floor():
		dynamic_speed = speed

func plunge():
	if not is_on_floor():
		if Input.is_action_just_pressed("down"):
			plunge_flag = true
		if plunge_flag == true:
			if velocity.y <= 0:
				velocity.y = speed
			velocity.y *= 1.1
	
	if plunge_flag == true and is_on_floor():
		plunge_flag = false
	
func respawn_mechanic():
	if position.y >= screen_bottom:
		position.x = spawnpoint.x
		position.y = -100
		plunge_flag = false
		velocity.y = 0

func get_input():
	jump()
	move_right()
	move_left()
	respawn_mechanic()
	crouch()
	slide()
	plunge()
	if doubletap_timer < 0:
		right_count = 0
		left_count = 0

func _ready():
	spawnpoint = position

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	get_input()
	doubletap_timer -= delta
	velocity = move_and_slide(velocity, UP)
