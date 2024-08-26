extends CanvasLayer

var game_paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		game_paused = !game_paused
		get_tree().paused = game_paused
		visible = game_paused
		
		 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().quit()# Replace with function body.                          


func _on_rein_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://level.tscn")


func _on_voltar_pressed():
	get_tree().paused = false
	visible = false
	pass # Replace with function body.
