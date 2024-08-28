extends StaticBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var npc = $"../npc"

var state = "locked"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.player_in_area == true and (Input.is_action_just_pressed("interact") == true) and state == "locked":
		get_node("CollisionShape2D").disabled = true
		state = "unlocked"
		animated_sprite_2d.animation = "open"
		
		if npc.quest_started == true:
			npc.quest_1_completed = true
		
	elif Global.player_in_area == true and (Input.is_action_just_pressed("interact") == true) and state == "unlocked":
		get_node("CollisionShape2D").disabled = false
		state = "locked"
		animated_sprite_2d.animation = "close"
