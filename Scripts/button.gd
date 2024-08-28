extends Area2D

var player_in_area

func _on_body_entered(body):
	if body.name == "player":
		player_in_area = true
		Global.player_in_area = player_in_area

func _on_body_exited(body):
	if body.name == "player":
		player_in_area = false
		Global.player_in_area = player_in_area
