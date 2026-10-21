extends Control

class_name Gatodoro

var minutos_sesion: int;
var objetivo_diario: int;
@onready var temporizador: Timer = $temporizador;
@onready var animador: AnimationPlayer = $animador;
@onready var gato: Gato = $Gato;
@onready var activo: bool = false;
@onready var descanso: bool = false;
@onready var marcador_tiempo: Label = $panel/contenedor_gatodoro/marcador_tiempo;
var nombre_tarea: String;
@onready var segundoss_restantes: int = 0;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	minutos_sesion = 25;
	marcador_tiempo.text = "{0}:00".format([minutos_sesion]);
	$panel/layout_botones/boton_pausa.disabled = true;
	iniciar_iconos_obj_diario();
	actualizar_obj_diario();
	pass # Replace with function body.

func empezar() -> void:
	"""Inicia el temporizador del gatodoro"""
	temporizador.start(float(minutos_sesion * 60));
	$panel/layout_botones/boton_play.disabled = true;
	$panel/layout_botones/boton_pausa.disabled = false;
	activo = true;
	#Falta el código para poner el cartelito de que ya empezó
	#Cambiar la animación del gato
	#Deshabilitar el botón de start

func pausar() -> void:
	segundoss_restantes = temporizador.time_left
	temporizador.stop();
	$panel/layout_botones/boton_play.disabled = false;
	$panel/layout_botones/boton_pausa.disabled = true;
	#Código por si se quiere poner una animación del gato

func reanudar() -> void:
		temporizador.start(segundoss_restantes);
		$panel/layout_botones/boton_play.disabled = true;
		$panel/layout_botones/boton_pausa.disabled = false;

func empezar_descanso() -> void:
	temporizador.start(float((minutos_sesion/5) * 60));
	descanso = true;
	actualizar_obj_diario();
	#Falta el código para poner el cartelito de descanso
	#Cambiar la animación del gato
	#Deshabilitar otros botones

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !temporizador.is_stopped():
		var tiempo_restante = temporizador.time_left;
		var minutos_restantes = int(floor((tiempo_restante/60)));
		var segundos_restantes = int(tiempo_restante) % 60;
		
		minutos_restantes = "{0}".format([minutos_restantes]) if \
		minutos_restantes >= 10 else "0{0}".format([minutos_restantes]);
		
		segundos_restantes = "{0}".format([int(segundos_restantes)]) if \
		segundos_restantes >= 10 else "0{0}".format([segundos_restantes]);
		
		marcador_tiempo.text = "{0}:{1}".format([minutos_restantes, segundos_restantes]);
	pass

func reiniciar() -> void:
	marcador_tiempo.text = "{0}:00".format([minutos_sesion]);
	$panel/layout_botones/boton_pausa.disabled = true;
	$panel/layout_botones/boton_play.disabled = false;
	temporizador.stop();
	activo = false;
	descanso = false;
	segundoss_restantes = 0;

func iniciar_iconos_obj_diario() -> void:
	var contenedor: HBoxContainer = $panel/contenedor_gatodoro/numero_objetivos;
	
	var cantidad: int = GlobalConfig.objetivo_diario;
	
	for i in range(0, cantidad, 1):
		var hijo: PackedScene = load("res://Escenas/marcador_objetivo.tscn");
		contenedor.add_child(hijo.instantiate())

func actualizar_obj_diario() -> void:
	var contenedor: HBoxContainer = $panel/contenedor_gatodoro/numero_objetivos;
	
	var objetivo: int = GlobalConfig.objetivo_diario; 
	var cantidad: int = GlobalConfig.sesiones_completadas if GlobalConfig.sesiones_completadas <= objetivo\
	else objetivo;
	var contador = 0;
	
	for i: Objetivo in contenedor.get_children():
		
		if contador != cantidad:
			i.marcar_cumplido();
			contador += 1;


func _on_boton_play_pressed() -> void:
	if !activo && segundoss_restantes == 0:
		empezar();
		
	elif segundoss_restantes > 0:
		reanudar();
	pass # Replace with function body.


func _on_boton_pausa_pressed() -> void:
	if activo or segundoss_restantes > 0:
		pausar();
	pass # Replace with function body.


func _on_temporizador_timeout() -> void:
	if !descanso:
		empezar_descanso();
		descanso = true;
		#Falta el código para cambiar la animación del gato
		#Así como la que te pone como que ya cumpliste un objetivo del día
		#Etc
	else:
		#Falta el código para agregar estadísticas
		#Cambiar la animación del gato, etc
		GlobalConfig.completar_sesion();
		reiniciar();
	pass # Replace with function body.


func _on_boton_reset_pressed() -> void:
	reiniciar();
	pass # Replace with function body.


func _on_boton_skip_pressed() -> void:
	if !descanso:
		GlobalConfig.completar_sesion();
		empezar_descanso();
	else:
		reiniciar();
	pass # Replace with function body.
