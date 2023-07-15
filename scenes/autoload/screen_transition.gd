extends CanvasLayer

@onready var color_rect = $ColorRect

signal transitioned_halfway

var skip_emit = false

func transition():
	$AnimationPlayer.play("default")
	await transitioned_halfway
	$AnimationPlayer.play_backwards("default")

func emit_transitioned_halfway():
	transitioned_halfway.emit()

func transition_to_scene(scene_path: String):
	transition()
	await transitioned_halfway
	"""
	ScreenTransition.transition()
	await ScreenTransition.transitioned_halfway
	"""
	get_tree().change_scene_to_file(scene_path)
