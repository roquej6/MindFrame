extends Node2D

#correlated
var teaCup = false
var pillBottle = false
var journal = false
var newsPaper = false
var musicSheet = false

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

#remove interactable UI's
func _interactable_false() -> void:
	$Interactable_Areas/Teacup_Area/CollisionShape2D/TeaCupAssets.visible = false
	$Interactable_Areas/Drug_Area/CollisionShape2D/PillBottleAssets.visible = false
	$Interactable_Areas/Journal_Area/CollisionShape2D/JournalAssets.visible = false
	$Interactable_Areas/Newspaper_Area/CollisionShape2D/NewspaperAssets.visible = false
	$Interactable_Areas/MusicSheet_Area/CollisionPolygon2D/MusicSheetAssets.visible = false

#this method remove all interactable UI's
func _default(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		_interactable_false()
		$UI_Display.visible = false
		$Evidence.visible = false
		$"Level Title".visible = true

#this method removes all interactive description UI's 
func _clear() -> void:
	_interactable_false()
	$"Level Title".visible = false
	

#same as _default method but no parameters needed
func _clear_all() -> void:
	_clear()
	$UI_Display.visible = false
	$Evidence.visible = false
	$"Level Title".visible = true

#display UI nodes
func _display_UI_bg() -> void:
	$UI_Display.visible = true
	$UI_Display/Evidence.visible = true

func _display_UI_noButton() -> void:
	$UI_Display/Evidence.visible = false

#display evidence UI
func _display_evidence() -> void:
	$Evidence.visible = true
	if teaCup == true:
		$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect.visible = false
	if pillBottle == true:
		$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect2.visible = false
	if journal == true:
		$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect3.visible = false
	if newsPaper == true:
		$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect4.visible = false
	if musicSheet == true:
		$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect5.visible = false

#this method will show description about the teacup evidence
func _teacup_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		_clear()
		_display_UI_bg()
		$Interactable_Areas/Teacup_Area/AudioStreamPlayer2D.play()
		$Interactable_Areas/Teacup_Area/CollisionShape2D/TeaCupAssets.visible = true
		if teaCup == true:
			$Interactable_Areas/Teacup_Area/CollisionShape2D/TeaCupAssets/Teacup_Description.visible = true
			_display_UI_noButton()

#this method will show description about the pillbottle evidence
func _pillbottle_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		_clear()
		_display_UI_bg()
		$Interactable_Areas/Drug_Area/CollisionShape2D/PillBottleAssets.visible = true
		if pillBottle == true:
			$Interactable_Areas/Drug_Area/CollisionShape2D/PillBottleAssets/Drug_Description.visible = true
			_display_UI_noButton()

#this method will show description about the journal evidence
func _journal_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		_clear()
		_display_UI_bg()
		$Interactable_Areas/Journal_Area/AudioStreamPlayer2D.play()
		$Interactable_Areas/Journal_Area/CollisionShape2D/JournalAssets.visible = true
		if journal == true:
			$Interactable_Areas/Journal_Area/CollisionShape2D/JournalAssets/Journal_Description.visible = true
			_display_UI_noButton()

#this method will show description about the newspaper evidence
func _newspaper_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		_clear()
		_display_UI_bg()
		$Interactable_Areas/Journal_Area/AudioStreamPlayer2D.play()
		$Interactable_Areas/Newspaper_Area/CollisionShape2D/NewspaperAssets.visible = true
		if newsPaper == true:
			$Interactable_Areas/Newspaper_Area/CollisionShape2D/NewspaperAssets/Newspaper_Description.visible = true
			_display_UI_noButton()

func _musicsheet_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		_clear()
		_display_UI_bg()
		$Interactable_Areas/Journal_Area/AudioStreamPlayer2D.play()
		$Interactable_Areas/MusicSheet_Area/CollisionPolygon2D/MusicSheetAssets.visible = true
		if musicSheet == true:
			$Interactable_Areas/MusicSheet_Area/CollisionPolygon2D/MusicSheetAssets/MusicSheet_Description.visible = true
			_display_UI_noButton()



#correlate evidence

#this method will reveal description of evidence in the Mind Dive
func _teacup_des() -> void:
	$Interactable_Areas/Teacup_Area/CollisionShape2D/TeaCupAssets/Teacup_Description.visible = true
	teaCup = true
	$Evidence.visible = false
	

#this method will reveal description of evidence in the Mind Dive
func _pillbottle_des() -> void:
	$Interactable_Areas/Drug_Area/CollisionShape2D/PillBottleAssets/Drug_Description.visible = true
	pillBottle = true
	$Evidence.visible = false


#this method will reveal description of evidence in the Mind Dive
func _journal_des() -> void:
	$Interactable_Areas/Journal_Area/CollisionShape2D/JournalAssets/Journal_Description.visible = true
	journal = true
	$Interactable_Areas/Journal_Area/CollisionShape2D/JournalAssets/Journal_Hint.visible = false
	$Evidence.visible = false


#this method will reveal description of evidence in the Mind Dive
func _newspaper_des() -> void:
	$Interactable_Areas/Newspaper_Area/CollisionShape2D/NewspaperAssets/Newspaper_Description.visible = true
	newsPaper = true
	$Evidence.visible = false


#this method will reveal description of evidence in the Mind Dive
func _musicsheet_des() -> void:
	$Interactable_Areas/MusicSheet_Area/CollisionPolygon2D/MusicSheetAssets/MusicSheet_Description.visible = true
	musicSheet = true
	$Evidence.visible = false
	$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect5/Button.visible = false
