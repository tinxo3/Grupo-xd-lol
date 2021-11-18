extends Position3D

const CAMERA_FOLLOW_SPEED : float = 0.08  # entre 0.0 y 1.0
onready var parent = get_parent()

func _ready():
	# assert evalua la condicion del primer argumento y si no se cumple genera un error y muestra el 
	# texto del segundo argumento. En este caso no deja correr el juego si ponen un valor fuera de rango
	assert(CAMERA_FOLLOW_SPEED > 0.0 and CAMERA_FOLLOW_SPEED <= 1.0, "CAMERA_FOLLOW_SPEED debe estar entre 0.0 y 1.0")
	
	# Set as toplevel hace que el nodo no herede el transform(movimiento,rotacion,escala)
	# del nodo padre, evitando que la camara rote cuando se rota la pelota
	set_as_toplevel(true)

# Hacemos que camera_assembly trackee la posicion del nodo padre, pero con un lerp para que sea mas suave
# El valor de CAMERA_FOLLOW_SPEED determina que fraccion de la distancia recorre para alcanzar a la pelota
# 1.0 significa que llega instantaneamente. 0.5 significa que en cada frame recorre la mitad de la distancia
func _process(delta):
	global_transform.origin = global_transform.origin.linear_interpolate(parent.global_transform.origin, CAMERA_FOLLOW_SPEED)

