extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#change the cursor into a point hand when hoveringin an area
func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

#reverets cursor back to default cursor
func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

#this method remove all interactable UI's
func _default(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		$Black.visible = false
		$Teacup_Area/CollisionShape2D/Teacup.visible = false
		$Drug_Area/CollisionShape2D/Pillbottle.visible = false
		$Journal_Area/CollisionShape2D/Journal.visible = false
		$Newspaper_Area/CollisionShape2D/Newspaper.visible = false
		$"Level Title".visible = true

#this method removes all interactive description UI's 
func _clear() -> void:
	$Teacup_Area/CollisionShape2D/Teacup.visible = false
	$Drug_Area/CollisionShape2D/Pillbottle.visible = false
	$Journal_Area/CollisionShape2D/Journal.visible = false
	$Newspaper_Area/CollisionShape2D/Newspaper.visible = false
	$"Level Title".visible = false

#this method will show description about the teacup evidence
func _teacup_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		_clear()
		$Black.visible = true
		$Teacup_Area/CollisionShape2D/Teacup.visible = true

#this method will show description about the pillbottle evidence
func _pillbottle_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		_clear()
		$Black.visible = true
		$Drug_Area/CollisionShape2D/Pillbottle.visible = true

#this method will show description about the journal evidence
func _journal_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		_clear()
		$Black.visible = true
		$Journal_Area/CollisionShape2D/Journal.visible = true

#this method will show description about the newspaper evidence
func _newspaper_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		_clear()
		$Black.visible = true
		$Newspaper_Area/CollisionShape2D/Newspaper.visible = true
