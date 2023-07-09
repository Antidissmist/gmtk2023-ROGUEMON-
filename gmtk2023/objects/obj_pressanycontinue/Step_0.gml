


if keyboard_check_pressed(vk_anykey) {
	transition(-1,function(){
		game_restart();
	})
	instance_destroy();
}