class_name GameInputEvents
static var direction: Vector2

static func movement_input() -> Vector2:
	direction.x = int(Input.is_action_pressed("walk_right")) - int(Input.is_action_pressed("walk_left"))
	direction.y = int(Input.is_action_pressed("walk_down")) - int(Input.is_action_pressed("walk_up"))
	return direction.normalized()

	
static func is_movement_input() -> bool:
	if direction == Vector2.ZERO:
		return false
	else:
		return true


static func use_tool() -> bool:
	if ToolsPanel.ui_open:
		return false
	var use_tool_value: bool = Input.is_action_just_pressed("hit")
	
	return use_tool_value
