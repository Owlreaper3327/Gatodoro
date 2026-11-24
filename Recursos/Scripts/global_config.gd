extends Node

class_name Config

@onready var objetivo_diario: int = cargar_objetivo_diario();
@onready var fecha_actual_dict: Dictionary = Time.get_date_dict_from_system(false);
@onready var sesiones_completadas: int = cargar_sesiones_completadas();
@onready var total_sesiones_completadas: int = cargar_total_sesiones_completadas();
@onready var stat_menu = preload("res://Escenas/menu_estadisticas.tscn").instantiate()
#@onready var pantalla_principal = preload("res://Escenas/pantalla_principal.tscn")

var config: Config_save = Config_save.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#Llamado cada vez que termina una sesión en el Gatodoro (antes de iniciar el descanso)
func completar_sesion() -> void:
	#Insertar código para guardar estadísticas
	
	sesiones_completadas += 1;
	total_sesiones_completadas += 1;
	
	var dia = fecha_actual_dict["day"] - 1;
	
	StatManager.estadisticas.mes_guardado[dia] = sesiones_completadas;
	StatManager.estadisticas_generales.total_sesiones_completadas = total_sesiones_completadas;
	StatManager._save()
	
#Llamado al inicio de la ejecución del script
func cargar_objetivo_diario() -> int:
	#Lógica para cargar el objetivo diario desde el archivo de configuraciones
	return 4;

func cargar_sesiones_completadas() -> int:
	
	var dia = fecha_actual_dict["day"] - 1
	var sesiones = StatManager.sesiones_completadas(dia)
	return sesiones

func cargar_total_sesiones_completadas():
	var dias = StatManager.estadisticas_generales.total_sesiones_completadas
	
	return dias

func gatodoro_to_stats():
	get_tree().change_scene_to_file("res://Escenas/menu_estadisticas.tscn")
	

func stats_to_gatodoro():
	get_tree().change_scene_to_file("res://Escenas/pantalla_principal.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
