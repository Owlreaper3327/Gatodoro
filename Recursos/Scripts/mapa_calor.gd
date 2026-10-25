extends Control

class_name MapaCalor

var mes_asignado: Mes_Map
@onready var casilla_calor: PackedScene = preload("res://Escenas/dia.tscn")
@onready var zona_mapa = $Panel/calendario 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	iniciar_mapa()
	pass # Replace with function body.

func iniciar_mapa():
	
	mes_asignado = Mes_Map.new()
	var mes_ac = Time.get_date_dict_from_system()
	
	var m = mes_ac["month"]
	mes_asignado.inicializar_mes(m)
	var dia_ini: int = mes_asignado.dia_inicial
	var mes_cont: int = mes_asignado.mes
	var dias_necesarios: int = dia_ini + mes_cont
	var cant_casillas: int = dias_necesarios if dias_necesarios > 35 else 35 
	
	for i in range(cant_casillas):
		
		zona_mapa.add_child(casilla_calor.instantiate())
	
	var contador = 0
	#Inicializar los números y probar
	for i: Dia in zona_mapa.get_children():
		
		if contador < dia_ini:
			
			i.color = Color.BLACK
			i.tooltip_text = ""
			
		contador += 1;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
