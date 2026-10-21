extends TextureRect

class_name Objetivo

@onready var cumplido: bool = false
@onready var cumplido_text = preload("res://Recursos/Gráficos/16x16 Objetivo diario2.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func marcar_cumplido() -> void:
	if cumplido:
		pass
	
	cumplido = true;
	texture = cumplido_text;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
