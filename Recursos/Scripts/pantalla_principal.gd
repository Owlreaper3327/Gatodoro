extends Control

class_name Gatodoro

var minutos_sesion: int;
@onready var temporizador: Timer = $temporizador;
@onready var animador: AnimationPlayer = $animador;
@onready var gato: Gato = $Gato;
@onready var activo: bool = false
@onready var descanso: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func empezar() -> void:
	"""Inicia el temporizador del gatodoro"""
	temporizador.start(float(minutos_sesion * 60));
	#Falta el código para poner el cartelito de que ya empezó
	#Cambiar la animación del gato
	#Deshabilitar el botón de start

func empezar_descanso() -> void:
	temporizador.start(float((minutos_sesion/5) * 60));
	#Falta el código para poner el cartelito de descanso
	#Cambiar la animación del gato
	#Deshabilitar otros botones

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
