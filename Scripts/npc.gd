extends StaticBody2D

@onready var player = $player

@onready var quest_container = $quest_container
@onready var text = $quest_container/text
@onready var yes_button = $quest_container/text/yes_button
@onready var no_button = $quest_container/text/no_button
@onready var finish_button = $quest_container/text/finish_button

var area_entered : bool = false
var quest_started : bool = false
var quest_1_completed : bool = false
var quest_accepted : bool = false
var end_quest_1 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	quest_start()


func _on_detect_area_body_entered(body):
	if body.name == "player":
		area_entered = true
		
func _on_detect_area_body_exited(body):
	area_entered = false

func _on_yes_button_pressed():
	text.text = "Go and press the button to open the door."
	quest_started = true
	yes_button.visible = false
	no_button.visible = false

func _on_no_button_pressed():
	quest_container.visible = false


func _on_finish_button_pressed():
	quest_container.visible = false
	finish_button.visible = false

func quest_start():
	var has_run : bool = false
	
	if has_run == false and area_entered == true and Input.is_action_pressed("interact"):
		quest_container.visible = true
		has_run = true
		return
	
	if quest_1_completed == true and end_quest_1 == false:
		quest_container.visible = true
		text.text = "Congratulations, you finished your quest!"
		finish_button.visible = true
		print(finish_button.visible)
		end_quest_1 = true
		return

