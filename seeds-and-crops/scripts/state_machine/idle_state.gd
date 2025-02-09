extends NodeState

@export var sprite: Sprite2D
@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	animated_sprite_2d.visible = false
	
	
func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
		
	
	if player.current_tool == DataTypes.Tools.TillGround && GameInputEvents.use_tool():
		sprite.visible= false
		transition.emit("Tilling")
	if player.current_tool == DataTypes.Tools.WaterCrops && GameInputEvents.use_tool():
		sprite.visible= false
		transition.emit("Watering")
		


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
