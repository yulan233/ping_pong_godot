extends Node2D

@onready var ui: Control = $UI
const BALL := preload("res://ball.tscn")
#添加一个撞击效果
const Effect:=preload("res://Effect/testeffect.tscn")
#获得一个类型
const Ball = preload("res://ball.gd")
var ball:Ball
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 设置ui界面大小
	ui.size=get_viewport_rect().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func s_game_over()->void:
	print("game_over")
	#游戏结束的一些处理
	GlobalVar.isStart=false
	if ball.game_over.is_connected(s_game_over):
		ball.game_over.disconnect(s_game_over)
	if ball.impack_effect.is_connected(s_impack_effect_create):
		ball.impack_effect.disconnect(s_impack_effect_create)
	ball=null
	ui.visible=true
	pass

func _on_button_pressed() -> void:
	#防止多次生成
	if ball!=null:
		return
	ui.visible=false
	GlobalVar.isStart=!GlobalVar.isStart
	ball=BALL.instantiate()
	ball.game_over.connect(s_game_over)
	ball.impack_effect.connect(s_impack_effect_create)
	add_child(ball)
	pass # Replace with function body.

func s_impack_effect_create(angle:float):
	print("impack")
	var effect:GPUParticles2D=Effect.instantiate()
	effect.rotation_degrees=angle
	effect.position=ball.position
	effect.emitting=true
	add_child(effect)
	pass