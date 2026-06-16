extends Node2D

#timer var
var time_left = 300
var max_time = 300
var tasks_completed = false

#correlate var
var teaCup = false
var teaTin = false
var journal = false
var tornPage = false
var pillBottle = false
var note = false
var newsPaper = false
var journal2 = false
var foxglove = false
var framedPhoto = false
var unOpenedLetter = false
var crossWord = false
var musicSheet = false
var musicTheory = false
var deskPlanner = false
var appointment = false
var phone = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer/ProgressBar.max_value = max_time
	$Timer/ProgressBar.value = time_left
	$Timer/Label.text = str(time_left)
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#change the cursor into a point hand when hoveringin an area
func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

#reverets cursor back to default cursor
func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

#this will set up the timer
func _on_timer_timeout():
	time_left -= 1
	
	if time_left <= 0:
		time_left = 0
		$Timer/ProgressBar.value = 0
		$Timer.stop
		$Timer/Label.text = "0"
		$"Timer/Game Over".visible = true
		$Evidence.visible = false
		$UI_Display.visible = false
		disable_view()
		return
	$Timer/ProgressBar.value = time_left
	$Timer/Label.text = str(time_left)



func main_view() -> void:
	disable_view()
	$"../Level Title".visible = true
	$"../UI_Display".visible = false
	$"../Evidence".visible = false
	
func disable_view() -> void:
	$Interactable_Areas/TeaCup_Area/CollisionShape2D/TeaCupAssets.visible = false
	$Interactable_Areas/TeaTin_Area/CollisionShape2D2/TeaTinAssets.visible = false
	$Interactable_Areas/Journal_Area/CollisionShape2D3/JournalAssets.visible = false
	$Interactable_Areas/TornPage_Area/CollisionShape2D/Assets.visible = false
	$Interactable_Areas/PillBottle_Area/CollisionShape2D/PillBottleAssets.visible = false
	$Interactable_Areas/Note_Area/CollisionShape2D/NoteAssets.visible = false
	$Interactable_Areas/NewsPaper_Area/CollisionShape2D/NewsPaperAssets.visible = false
	$Interactable_Areas/Foxglove_Area/CollisionShape2D/FoxgloveAssets.visible = false
	$Interactable_Areas/DeskPlanner_area/CollisionShape2D/DeskPlannerAssets.visible = false
	
func clean_view() -> void:
	disable_view()
	$"Level Title".visible = false

func clean_all() -> void:
	clean_view()
	$"Level Title".visible = true
	$UI_Display.visible = false
	$Evidence.visible = false
	
func display_evidence_ui() -> void:
	$UI_Display.visible = true
	$UI_Display/Evidence.visible = true
	
func display_evidence_ui_noButton() -> void:
	$UI_Display/Evidence.visible = false
	
func display_evidence() -> void:
	$Evidence.visible = true

func remove_evidence() -> void:
	if tornPage == true:
		$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect3.visible = false

func _treaCup_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		clean_view()
		display_evidence_ui()
		$Interactable_Areas/TeaCup_Area/CollisionShape2D/TeaCupAssets.visible = true
		if teaCup == true:
			$Interactable_Areas/TeaCup_Area/CollisionShape2D/TeaCupAssets/_Des.visible = true
			$Interactable_Areas/TeaCup_Area/CollisionShape2D/TeaCupAssets/TeaCup_Hint.visible = false


func _journal_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		clean_view()
		display_evidence_ui()
		$Interactable_Areas/Journal_Area/CollisionShape2D3/JournalAssets.visible = true
		if tornPage == true: #need step 2
			$Interactable_Areas/Journal_Area/CollisionShape2D3/JournalAssets/_Des.visible = true
			$Interactable_Areas/Journal_Area/CollisionShape2D3/JournalAssets/_Hint.visible = false
			display_evidence_ui_noButton()

func _pillBottle_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		clean_view()
		display_evidence_ui()
		$Interactable_Areas/PillBottle_Area/CollisionShape2D/PillBottleAssets.visible = true
		if pillBottle == true:
			$Interactable_Areas/PillBottle_Area/CollisionShape2D/PillBottleAssets/_Des.visible = true
			#something else here
			$Interactable_Areas/PillBottle_Area/CollisionShape2D/PillBottleAssets/_Hint.visible = false
		if pillBottle == true && journal == true:
			display_evidence_ui_noButton()

func _foxglove_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		clean_view()
		display_evidence_ui()
		$Interactable_Areas/Foxglove_Area/CollisionShape2D/FoxgloveAssets.visible = true
		if foxglove == true:
			$Interactable_Areas/Foxglove_Area/CollisionShape2D/FoxgloveAssets/_Des.visible = true
			$Interactable_Areas/Foxglove_Area/CollisionShape2D/FoxgloveAssets/_Hint.visible = false

func _deskPlanner_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		clean_view()
		display_evidence_ui()
		$Interactable_Areas/DeskPlanner_area/CollisionShape2D/DeskPlannerAssets.visible = true
		if deskPlanner == true:
			$Interactable_Areas/DeskPlanner_area/CollisionShape2D/DeskPlannerAssets/_Des.visible = true
			$Interactable_Areas/DeskPlanner_area/CollisionShape2D/DeskPlannerAssets/_Hint.visible = false




#descriptions
func tea_cup_card() -> void:
	$Interactable_Areas/TeaCup_Area/CollisionShape2D/TeaCupAssets/_Des.visible = true
	teaCup = true
	$Interactable_Areas/TeaCup_Area/CollisionShape2D/TeaCupAssets/Teacup/Blurr.visible = false
	$Interactable_Areas/TeaCup_Area/CollisionShape2D/TeaCupAssets/TeaCup_Hint.visible = false
	$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect.visible = false
	case_done()
	
func torn_page_card() -> void:
	$Interactable_Areas/Journal_Area/CollisionShape2D3/JournalAssets/_Des.visible = true
	tornPage = true
	$Interactable_Areas/Journal_Area/CollisionShape2D3/JournalAssets/Journal/Blurr.visible = false
	$Interactable_Areas/Journal_Area/CollisionShape2D3/JournalAssets/_Hint.visible = false
	$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect3.visible = false
	case_done()
	
func foreign_handwritting_card() -> void:
	pass # this is steo two of journal evidence (step 1 torn page)
	
func pill_bottle_card() -> void: #G3S1
	if $Interactable_Areas/PillBottle_Area/CollisionShape2D/PillBottleAssets.visible != true:
		time_left -= 10
	else:
		$Interactable_Areas/PillBottle_Area/CollisionShape2D/PillBottleAssets/_Des.visible = true
		pillBottle = true
		$Interactable_Areas/PillBottle_Area/CollisionShape2D/PillBottleAssets/PillBottle/Blurr.visible = false
		$Interactable_Areas/PillBottle_Area/CollisionShape2D/PillBottleAssets/_Hint.visible = false
		$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect2.visible = false
		case_done()

func journal_entry_card() -> void: #G3S2
	$Interactable_Areas/PillBottle_Area/CollisionShape2D/PillBottleAssets/_Des2.visible = true
	journal = true
	$Interactable_Areas/PillBottle_Area/CollisionShape2D/PillBottleAssets/_Hint.visible = false
	$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect10.visible = false
	case_done()

func foxglove_card() -> void: #G4S1
	$Interactable_Areas/Foxglove_Area/CollisionShape2D/FoxgloveAssets/_Des.visible = true
	foxglove = true
	$Interactable_Areas/Foxglove_Area/CollisionShape2D/FoxgloveAssets/Sprite2D/Blurr.visible = false
	$Interactable_Areas/Foxglove_Area/CollisionShape2D/FoxgloveAssets/_Hint.visible = false
	$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect6.visible = false
	case_done()

func teaTin_card() -> void: #G4S2
	$Interactable_Areas/Foxglove_Area/CollisionShape2D/FoxgloveAssets/_Des2.visible = true
	teaTin = true
	$Interactable_Areas/TeaTin_Area/CollisionShape2D2/TeaTinAssets/Teacup/Blurr.visible = false
	$Interactable_Areas/Foxglove_Area/CollisionShape2D/FoxgloveAssets/_Hint.visible = false
	$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect11.visible = false
	case_done()

func deskPlanner_card() -> void: #G5S1
	$Interactable_Areas/DeskPlanner_area/CollisionShape2D/DeskPlannerAssets/_Des.visible = true
	deskPlanner = true
	$Interactable_Areas/DeskPlanner_area/CollisionShape2D/DeskPlannerAssets/Sprite2D/Blurr.visible =false
	$Interactable_Areas/DeskPlanner_area/CollisionShape2D/DeskPlannerAssets/_Hint.visible = false
	$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect7.visible = false
	case_done()
	
func appointment_card() -> void: #G5S2
	$Interactable_Areas/DeskPlanner_area/CollisionShape2D/DeskPlannerAssets/_Des2.visible = true
	appointment = true
	$Interactable_Areas/DeskPlanner_area/CollisionShape2D/DeskPlannerAssets/_Hint.visible = false
	$Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect8.visible = false
	case_done()








#finish
func case_done() -> void:
	if teaCup == true && teaTin == true && tornPage == true && pillBottle == true && appointment == true && deskPlanner == true && journal == true && foxglove == true:
		$NewBg1Glitch.visible = false
		$Evidence.visible = false
		$UI_Display.visible = false
		$"Level Title".visible = false
		$"Level Cleared".visible = true
		$Timer/ProgressBar.visible = false
		$Timer/Label.visible = false
		clean_view()
