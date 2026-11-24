extends Control

class_name MenuEstadisticas

var total_sesiones_completadas: int
var racha_dias: int
var mes_activo: MapaCalor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_boton_atras_pressed() -> void:
	GlobalConfig.stats_to_gatodoro()
	pass # Replace with function body.
