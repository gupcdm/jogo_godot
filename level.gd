extends Node2D

@onready var player = $player

# Called when the node enters the scene tree for the first time.
func _ready():
	player.morreu.connect(_resetar)
	 # Replace with function body.

func _resetar():
	get_tree().change_scene_to_file("res://gameover.tscn")
	globals.somapontos =0

func _process(delta):
	pass	
