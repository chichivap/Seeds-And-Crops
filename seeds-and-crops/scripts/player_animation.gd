extends Node2D

@export var animation_tree: AnimationTree
@onready var player : Player = get_owner()

var last_facing_direction := Vector2(0, 1)

func _physics_process(delta: float) -> void:
	var is_moving = GameInputEvents.is_movement_input()
	
	if is_moving:
		last_facing_direction = player.player_direction
	
	
	animation_tree.set("parameters/Idle/blend_position", last_facing_direction)
	animation_tree.set("parameters/Run/blend_position", last_facing_direction)
