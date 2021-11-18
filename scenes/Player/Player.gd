extends RigidBody

# Raycast que chequea si estamos pisando
onready var ground_sensor = $ground_sensor

# True si estamos pisando y false si no
var on_floor = false

# Velocidad maxima horizontal en el piso en unidades por segundo
var motion_speed := 18.0
# Velocidad vertical a aplicar cuando salta en unidades por segundo
var jump_speed := 23.0

# estas dos variables controlan que tan rapido cambia la velocidad del personaje
# 1 significa que llega a la velocidad maxima instantaneamente
# 0.1 significa que en cada frame avanza un 10% entre la velocidad actual y la 
# velocidad maxima
var running_accel := 0.2 
var air_accel := 0.08

# Cantidad de saltos antes de tocar el piso. Ej: 2 para tener doble salto
var max_jumps := 2

# Cantidad de saltos restantes. Se resetea al tocar el piso
var remaining_jumps : int = max_jumps

# Nodo donde esta agregada la camara. Pueden modificar el z local de la camara
# para acercarla y alejarla y la rotacion de camera_assembly para orbitar la 
# camara alrededor del personaje
onready var camera = $camera_assembly

# Para modificar la fisica del objeto en cada frame, en el caso de los RigidBody
# usamos _integrate_forces(state)
# state contiene el PhysicsDirectBodySate del objeto y es lo que modificamos
# para ajustar su estado. Ejemplo:
#  -  state.linear_velocity es la velocidad de movimiento la pelota
#  -  state.step es el tiempo entre este frame y el anterior, equivalente a
# delta en _process(delta)
func _integrate_forces(state):
	# Chequeamos si estamos en el piso o no
	if ground_sensor.is_colliding():
		# Si el ground_sensor detecta el piso y on_floor estaba en false
		# significa que acabamos de caer. Reseteamos remaining_jumps
		if not on_floor:
			on_floor = true
			remaining_jumps = max_jumps
	else:
		on_floor = false

	
	var dir := Vector3() # Direccion de movimiento en este frame
	
	# Convertimos is_action_pressed a int lo que nos da 1 si el boton esta presionado
	# y 0 si no y sumamos ambas direcciones con signos opuestos. De esta forma ambos ejes
	# nos quedan en -1, 0 o 1
	# Si quieren usar analogicos y tener movimiento 360 pueden usar Input_get_action_strength
	# en vez de is_action_pressed
	dir.x = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
	dir.z = -int(Input.is_action_pressed("ui_up")) + int(Input.is_action_pressed("ui_down"))
	
	# Normalizamos el vector(hacemos que tenga largo 1) para que el movimiento en diagonal
	# no sea mas rapido que el movimiento en un eje
	dir = dir.rotated(Vector3.UP, camera.rotation.y).normalized()
	
	# Si se acaba de presionar la tecla de saltar seteamos la direccion vertical. En este caso
	# No nos interesa normalizar porque la velocidad de salto y de movimiento son independientes
	dir.y = int(Input.is_action_just_pressed("ui_select"))
	var jump_pressed = dir.y > 0
	
	# Usamos la aceleracion que corresponda segun si esta en el piso o no
	var accel = running_accel if on_floor else air_accel
	
	# Aplicamos una interpolacion lineal entre la velocidad actual y motion_speed
	state.linear_velocity.x = lerp (state.linear_velocity.x, dir.x * motion_speed, accel )
	state.linear_velocity.z = lerp (state.linear_velocity.z, dir.z * motion_speed, accel )
	
	if jump_pressed and remaining_jumps > 0:
		# Aplicamos instantaneamente la velocidad de salto
		state.linear_velocity.y = dir.y * jump_speed
		remaining_jumps -= 1
