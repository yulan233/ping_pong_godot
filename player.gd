extends CharacterBody2D


@export var SPEED := 500.0
@export var JUMP_VELOCITY := 100.0
@export var is_user_input_enabled := true

var window_size:Vector2
func _ready():
	#获取窗口大小
	window_size = get_viewport_rect().size

func _physics_process(_delta: float) -> void:
	if is_user_input_enabled:
		# 移动角色
		var direction := Input.get_axis("ui_up", "ui_down")
		if direction != 0:
			velocity.y = SPEED*direction
		else:
			velocity.y = 0
		move_and_slide()
		#限制角色移动范围
		position.y = clamp(position.y, 56, window_size.y-56)
	else:
		#TODO: AI移动
		pass