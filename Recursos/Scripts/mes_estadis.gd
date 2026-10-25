extends Node

class_name Mes_Map

var dias_sesiones: Array
enum MES {Enero = 31, Febrero_normal = 28, Febrero_bisiesto = 29, Marzo = 31, 
Abril = 30, Mayo = 31, Junio = 30, Julio = 31, Agosto = 31, Septiembre = 30, 
Octubre = 31, Noviembre = 30, Diciembre = 31}
var dia_inicial: int
var año: int
var mes: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func inicializar_mes(mes_num: int) -> void:
	
	match mes_num:
		
		1:
			mes = MES.Enero
		2:
			var anno = Time.get_datetime_dict_from_system()
			anno = anno["year"]
			mes = MES.Febrero_bisiesto if anno % 4 == 0 and (anno % 100 == 0 and anno % 400 == 0)\
			else MES.Febrero_normal
		3:
			mes = MES.Marzo
		4:
			mes = MES.Abril
		5:
			mes = MES.Mayo
		6:
			mes = MES.Junio
		7:
			mes = MES.Julio
		8:
			mes = MES.Agosto
		9:
			mes = MES.Septiembre
		10:
			mes = MES.Octubre
		11:
			mes = MES.Noviembre
		12:
			mes = MES.Diciembre
		_:
			mes = MES.Enero
	
	_iniciar_arreglo(mes)
	_asignar_primer_dia()
	_cargar_racha()

func _iniciar_arreglo(mes: int) -> void:
	
	var contador = 0;
	
	while contador < mes:
		
		dias_sesiones.append(0);
		contador += 1;

func _cargar_racha() -> void:
	#insertar lógica para cargar los datos de dias anteriores
	pass

func _asignar_primer_dia() -> void:
	
	var fecha_completa: Dictionary = Time.get_datetime_dict_from_system()
	var dia: int = fecha_completa["day"]
	var dia_semana: int = fecha_completa["weekday"]
	
	while (dia > 1):
		
		dia -= 1;
		dia_semana = dia_semana - 1 if dia_semana != 0 else 6;
	
	dia_inicial = dia_semana;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
