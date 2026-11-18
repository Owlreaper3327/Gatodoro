extends Node

class_name Stat_manager
#Tiene como función manejar las operaciones de las estadísticas

const save_path = "user://"
var estadisticas: StatSave = StatSave.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	estadisticas.mes_guardado = range(31)
	estadisticas.mes_guardado.fill(0)
	
	var loaded = _load(estadisticas.mes, estadisticas.anno)
	
	if is_instance_of(loaded, StatSave):
		
		estadisticas = loaded
	pass # Replace with function body.

func _save():
	var mes = estadisticas.mes
	var anno = estadisticas.anno
	
	var formato = "{0}-{1}.tres".format([mes, anno])
	
	ResourceSaver.save(estadisticas, save_path + formato)
	print("Estadísticas salvadas")

func _load(mes: int, anno: int):
	
	var formato = "{0}-{1}.tres".format([mes, anno])
	
	if FileAccess.file_exists(save_path + formato):
		estadisticas = ResourceLoader.load(save_path + formato).duplicate(true)
		print("Estadísticas cargadas")
		return estadisticas
	
	print("No había estadísticas que cargar")
	return null

func sesiones_completadas(indice: int) -> int:
	
	return estadisticas.mes_guardado[indice]

func save_stat(stat: StatSave):
	
	estadisticas = stat
	_save()
