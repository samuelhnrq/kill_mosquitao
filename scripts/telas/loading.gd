extends Sprite

var loader
var throttle = .1
var timer = throttle

func _ready():
    set_process(false)

func _process(delta):
    if timer < throttle:
        timer += throttle
        return
    timer = 0
    var status = loader.poll()
    if status == OK:
        return
    if status == ERR_FILE_EOF:
        print("Loaded succesfully")
        call_deferred("_change_screen")
    else:
        print("ERROR LOADING!!!")

func load_screen(path):
    set_visible(true)
    var root = get_tree().get_root()
    var current_scene = root.get_child(root.get_child_count() - 1)
    current_scene.queue_free()
    loader = ResourceLoader.load_interactive(path)
    set_process(true)

func _change_screen():
    var resource = loader.get_resource().instance()
    get_tree().get_root().add_child(resource)
    get_tree().set_current_scene(resource)
    loader = null
    hide()
    set_process(false)
