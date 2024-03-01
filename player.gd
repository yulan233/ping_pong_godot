extends CharacterBody2D



@export var SPEED := 5.0
@export var JUMP_VELOCITY := 100.0
@export var is_user_input_enabled := true
@export var move_detla:=0.0

var window_size:Vector2
var ai_move_value:=0.0

func _ready():
	#获取窗口大小
	window_size = get_viewport_rect().size

func _physics_process(_delta: float) -> void:
	if GlobalVar.isStart==false:
		return
	if is_user_input_enabled:
		# 移动角色
		var direction := Input.get_axis("ui_up", "ui_down")
		if direction != 0:
			position.y += SPEED*direction
	else:
		#FIXME: AI移动，还不够好
		move_detla += _delta
		if move_detla > 0.5:
			move_detla = 0.0
			ai_move_value=ai_move()
		position.y += ai_move_value
	#限制角色移动范围
	position.y = clamp(position.y, 56, window_size.y-56)

## AI移动逻辑，并返回一个移动的速度矢量出来
func ai_move()->float:
	# 获得一个随机方向
	var direction := randi_range(-1,1)
	var new_velocity = direction * SPEED
	return new_velocity
