extends RigidBody

onready var ground_sensor = $ground_sensor

var max_jumps = 1
var remaining_jumps : int = max_jumps

func doble_powerup():
	max_jumps = 2

var on_floor = false

func _integrate_forces(state):
	var jump_pressed = false
	var dir := Vector3()
	dir.x = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
	dir.z = -int(Input.is_action_pressed("ui_up")) + int(Input.is_action_pressed("ui_down"))
	dir = dir.normalized()
	dir = dir.rotated(Vector3.UP,deg2rad(45))
	dir.y = int(Input.is_action_just_pressed("ui_select"))
	jump_pressed = dir.y > 0
	state.linear_velocity.x = lerp (state.linear_velocity.x, dir.x * 1000 * state.step, 0.09 )
	state.linear_velocity.z = lerp (state.linear_velocity.z, dir.z * 1000 * state.step, 0.09 )

	if ground_sensor.is_colliding():
		if not on_floor:
			on_floor = true
			remaining_jumps = max_jumps
	else:
		on_floor = false
	
	
	if jump_pressed and remaining_jumps:
		state.linear_velocity.y = dir.y * 500 * state.step
		remaining_jumps -= 1
