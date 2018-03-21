extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const MAX_ANGLE = deg2rad(40)
const MIN_ANGLE = deg2rad(-40)
const CENTER = 1080.0 / 2.0

onready var canhao = get_node("canhao")

func _input(event):
    # Mouse in viewport coordinates
    if not event is InputEventMouseButton and not event is InputEventMouseMotion:
        return
    if event.position.y > 1600:
        return
    var angle = position.angle_to_point(event.position) - (PI / 2)
    rotation = max(min(angle, MAX_ANGLE), MIN_ANGLE)

func _ready():
    set_process_input(true)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
