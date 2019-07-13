extends Position2D

export(PackedScene) var spawnScene
onready var spawnReference = load(spawnScene.get_path())

export (NodePath) var timerPath
onready var timerNode = get_node(timerPath)

export (float) var minWaitTime
export (float) var maxWaitTime

func _ready():
	randomize()
	timerNode.set_wait_time(rand_range(minWaitTime, maxWaitTime))
	timerNode.start()

func _on_timer_timeout():
	var spawnInstance = spawnReference.instance()

	get_parent().add_child(spawnInstance)
	spawnInstance.set_global_transform(get_global_transform())
	print(get_global_transform())
	
	timerNode.set_wait_time(rand_range(minWaitTime, maxWaitTime))
	timerNode.start()