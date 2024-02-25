extends RigidBody2D

#自定义游戏结束信号
signal game_over

var initVelcity:=100.0
var uiSize:Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#获取界面大小
	uiSize=get_viewport_rect().size
	position=uiSize/2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if GlobalVar.isStart:
		custom_integrator=false
		linear_velocity=Vector2(500,0)
		#如果超出游戏场景就结束游戏
		if position.x<0 or position.x>uiSize.x:
			s_game_over()
			position=uiSize/2


## 触发游戏结束
func s_game_over()->void:
	emit_signal("game_over")
	print("hello")
	queue_free()
	
