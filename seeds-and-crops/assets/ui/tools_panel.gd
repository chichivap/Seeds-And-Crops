class_name ToolsPanel
extends PanelContainer

static var ui_open: bool = false

@onready var tool_tilling: Button = $MarginContainer/HBoxContainer/ToolTilling
@onready var tool_watering_can: Button = $MarginContainer/HBoxContainer/ToolWateringCan
@onready var tool_corn: Button = $MarginContainer/HBoxContainer/ToolCorn

func _on_tool_tilling_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.TillGround)

	

func _on_tool_watering_can_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.WaterCrops)


func _on_tool_corn_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantCorn)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("release_tool"):
		ToolManager.select_tool(DataTypes.Tools.None)
		tool_tilling.release_focus()
		tool_watering_can.release_focus()
		tool_corn.release_focus()
	elif event:
		ui_open = false
	if !InputMap.has_action("hit"):
		InputMap.action_add_event("hit", event)
		
func _gui_input(event: InputEvent) -> void:
	ui_open = true
	InputMap.action_erase_event("hit", event)
