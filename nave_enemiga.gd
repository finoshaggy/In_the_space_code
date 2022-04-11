extends Node2D




func _ready():
	$explosion.visible = false






func _physics_process(delta):
	position.y += 1.5
	if AutoCarga.tiempo > 50:
		position.y += 1.5
	if AutoCarga.tiempo > 120:
		position.y += 1.7


func _on_Area2D_area_entered(area):
	if area.is_in_group("bala_señal"):
		$explosion.visible = true
		$explosion.playing=true
		AutoCarga.update_time()
		AutoCarga.tiempo += 5
		$Sprite.visible = false
		$Area2D/CollisionShape2D2.disabled = true
		$CPUParticles2D2.emitting = false
		$CPUParticles2D3.emitting = false
		$Area2D.queue_free()
		return
		
		
	if area.is_in_group("jugador_señal"):
		$Sprite.visible = false
		$Area2D/CollisionShape2D2.disabled = true
		$CPUParticles2D2.emitting = false
		$CPUParticles2D3.emitting = false
		$Area2D.queue_free()
		return

func _on_explosion_animation_finished():
	queue_free()
