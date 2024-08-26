extends Control

@onready var contador_item = $MarginContainer/HBoxContainer/contador_item
@onready var timer = $Timer
@onready var timer_count = $"MarginContainer/HBoxContainer2/timer count"

signal tempo_acabou() #pra recarregar no mundo

var minutos = 0
var segundos = 0

@export_range(0,2) var min_padrao = 1

@export_range(0,59) var seg_padrao = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	contador_item.text = str("%04d" %globals.somapontos)
	timer_count.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao) 
	
	minutos = min_padrao
	segundos = seg_padrao
	
	# Replace with function body.
 	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	contador_item.text = str("%04d" %globals.somapontos)
	if minutos == 0 && segundos == 0:
		emit_signal("tempo_acabou")






func _on_timer_timeout():
	if segundos == 0:
		if minutos >0:
			minutos -=1
			segundos = 60
			
	segundos -=1
	
	timer_count.text = str("%02d" % minutos) + ":" + str("%02d" % segundos) 
