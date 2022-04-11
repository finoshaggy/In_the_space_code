extends Node2D
var pre_game_over_screen = preload("res://game_over_screen.tscn")


func _physics_process(delta):
	position.y += 2
	$Sprite.rotation += 5 * delta


func _on_Area2D_area_entered(area):
	if area.is_in_group("jugador_señal"):
		$Area2D/CollisionShape2D.disabled = true
		$Sprite.visible = false
		$desapareser_meteorito.disabled = true
		$Particles2D.emitting = false
		yield(get_tree().create_timer(0),"timeout")
		var screen = pre_game_over_screen.instance()
		get_parent().call_deferred("add_child", screen)


func _on_desapareser_meteorito_button_down():
	$Area2D/CollisionShape2D.disabled = true
	$Sprite.visible = false
	$desapareser_meteorito.disabled = true
	$Particles2D.emitting = false
