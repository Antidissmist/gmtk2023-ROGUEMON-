


if keyboard_check_pressed(vk_anykey) {
	if global.cutscene_onfin==-1 {
		transition(-1,function(){
			game_restart();
		})
	}
	else {
		transition(global.cutscene_onfin);
	}
	instance_destroy();
}