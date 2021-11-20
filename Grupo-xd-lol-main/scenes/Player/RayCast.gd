extends RayCast

onready var parent = get_parent()

# Set as toplevel hace que el nodo no herede el transform(movimiento,rotacion,escala)
# del nodo padre, evitando que el raycast se rote cuando se rota la pelota
func _ready():
	set_as_toplevel(true)

# Como si nos interesa que tenga la misma posicion, hacemos que trackee la posicion
# del padre
func _physics_process(delta):
	global_transform.origin = parent.global_transform.origin
