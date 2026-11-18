extends Node

class_name Config

@onready var objetivo_diario: int = cargar_objetivo_diario();
@onready var fecha_actual_dict: Dictionary = Time.get_date_dict_from_system(false);
@onready var sesiones_completadas: int = cargar_sesiones_completadas();

var config: Config_save = Config_save.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#Llamado cada vez que termina una sesión en el Gatodoro (antes de iniciar el descanso)
func completar_sesion() -> void:
	#Insertar código para guardar estadísticas
	
	sesiones_completadas += 1;
	
	var dia = fecha_actual_dict["day"] - 1
	
	StatManager.estadisticas.mes_guardado[dia] = sesiones_completadas
	StatManager._save()
	
#Llamado al inicio de la ejecución del script
func cargar_objetivo_diario() -> int:
	#Lógica para cargar el objetivo diario desde el archivo de configuraciones
	return 4;

func cargar_sesiones_completadas() -> int:
	
	var dia = fecha_actual_dict["day"] - 1
	var sesiones = StatManager.sesiones_completadas(dia)
	return sesiones

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
