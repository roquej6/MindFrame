extends Node2D

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
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func main_view() -> void:
	disable_view()
	$"../Level Title".visible = true
	$"../UI_Display".visible = false
	$"../Evidence".visible = false
	
func disable_view() -> void:
	$TeaCup_Area/CollisionShape2D/TeaCupAssets.visible = false
	$TeaTin_Area/CollisionShape2D2/TeaTinAssets.visible = false
	$Journal_Area/CollisionShape2D3/JournalAssets.visible = false
	$TornPage_Area/CollisionShape2D/Assets.visible = false
	$PillBottle_Area/CollisionShape2D/PillBottleAssets.visible = false
	$Note_Area/CollisionShape2D/NoteAssets.visible = false
	$NewsPaper_Area/CollisionShape2D/NewsPaperAssets.visible = false
	$Foxglove_Area/CollisionShape2D/FoxgloveAssets.visible = false
	
func clean_view() -> void:
	disable_view()
	$"../Level Title".visible = false

func clean_all() -> void:
	clean_view()
	$"../Level Title".visible = true
	$"../UI_Display".visible = false
	$"../Evidence".visible = false
	
func display_evidence() -> void:
	$"../UI_Display".visible = true
	$"../UI_Display/Evidence".visible = true
	
func display_evidence_noButton() -> void:
	$"../UI_Display/Evidence".visible = false

func remove_evidence() -> void:
	if tornPage == true:
		$"../Evidence/Gathered/ScrollContainer/VBoxContainer/TextureRect3".visible = false
	
func _journal_view(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		clean_view()
		display_evidence()
		$Journal_Area/CollisionShape2D3/JournalAssets.visible = true
		if tornPage == true:
			$Journal_Area/CollisionShape2D3/JournalAssets/_Des.visble = true
			$Journal_Area/CollisionShape2D3/JournalAssets/_Hint.visble = false
			display_evidence_noButton()
