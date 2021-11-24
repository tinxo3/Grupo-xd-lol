extends Area

signal coinCollected

func _ready():
	pass 

func _physics_process(delta):
	rotate_y(deg2rad(3))
	pass


func _on_coin_body_entered(body):
	if body.name == "Player":
		emit_signal("coinCollected")
		$Animation.play("die")
		$Timer.start()


func _on_Timer_timeout():
	queue_free()
