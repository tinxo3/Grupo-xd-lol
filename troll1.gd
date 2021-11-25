extends CSGBox
onready var anims = $anitroll
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	#material = material.duplicate(true)
	pass

# Called when the node enters the scene tree for the first time.

func _on_Area_body_entered(body):
	if body.get_name() == "Player":
		anims.play("caer")
