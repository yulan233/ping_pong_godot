extends Node2D

@onready var ui: Control = $UI

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 设置ui界面大小
	ui.size=get_viewport_rect().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func _on_button_pressed() -> void:
	GlobalVar.isStart=!GlobalVar.isStart
	pass # Replace with function body.
