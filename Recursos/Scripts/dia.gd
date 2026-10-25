extends ColorRect

class_name Dia

@onready var sesiones_hechas: int = 0
@onready var objetivo: int = GlobalConfig.objetivo_diario

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color = Color.WHITE;
	cambiar_tooltip();
	pass # Replace with function body.

func elegir_calor() -> void:
	
	var porcentaje: float = float(sesiones_hechas) / float(objetivo) * 100
	
	if porcentaje == 0:
		color = Color.WHITE
		return
	
	if porcentaje > 0 and porcentaje <= 25:
		color = Color.LIGHT_PINK
		return
	
	if porcentaje > 25 and porcentaje <= 50:
		color = Color.PINK
		return
	
	if porcentaje > 50 and porcentaje <= 75:
		color = Color.HOT_PINK
		return
	
	if porcentaje > 75 and porcentaje < 100:
		color = Color.DEEP_PINK
		return
	
	color = Color.RED

func inyectar_datos(objetivo_l: int, sesiones: int) -> void:
	
	objetivo = objetivo_l
	sesiones_hechas = sesiones
	elegir_calor()
	cambiar_tooltip()

func cambiar_tooltip() -> void:
	
	tooltip_text = "Objetivo: {0}\nSesiones completadas: {1}".format([objetivo, sesiones_hechas]);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
