


if anykey_pressed() {
	if global.cutscene_onfin==-1 {
		transition(-1,function(){
			restartgame();
		})
	}
	else {
		transition(global.cutscene_onfin);
	}
	instance_destroy();
}