# Handle independent actions by guest instances
# Moving to the end of the road, chancing at visiting the booth,
# hold guest preferences and pass them to display elements

extends CharacterBody2D

@export var destination: Vector2
@export var speed: int

func set_destination(dest: Vector2) -> void:
	destination = dest
	
func set_speed(sped: int) -> void:
	speed = sped

# The guest instance will always have a destination, and will check conditions before
# it can finally be freed. Once it has completed all of its tasks, it will be deleted
# for now, this will just be walking from one end of the map to the other (default behavior)
func _physics_process(delta):
	if position.x >= -10:
		velocity = (destination - position).normalized() * speed
		move_and_slide()
	else:
		queue_free()
