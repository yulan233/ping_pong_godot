extends RigidBody2D

#自定义游戏结束信号
signal game_over
#定义一个撞击效果信号
signal impack_effect

var initVelcity:=-400.0
var uiSize:Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#获取界面大小
	uiSize=get_viewport_rect().size
	#设置球的初始位置和禁止旋转
	position=uiSize/2
	lock_rotation=true
	# 设置阻力为自己的阻力
	linear_damp_mode=DAMP_MODE_REPLACE
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if GlobalVar.isStart:
		if linear_velocity==Vector2.ZERO:
			linear_velocity=Vector2(initVelcity,0)
		#如果超出游戏场景就结束游戏
		if position.x<0 or position.x>uiSize.x:
			s_game_over()
			position=uiSize/2
		#如果球碰到上下边缘则反弹
		if position.y<=0:
			linear_velocity=linear_velocity.bounce(Vector2.DOWN)
			active_impack_effect(90)
		if position.y>=uiSize.y:
			linear_velocity=linear_velocity.bounce(Vector2.UP)
			active_impack_effect(-90)

## 触发反弹特效
func active_impack_effect(angle:float)->void:
	emit_signal("impack_effect",angle)

## 触发游戏结束
func s_game_over()->void:
	emit_signal("game_over")
	queue_free()
