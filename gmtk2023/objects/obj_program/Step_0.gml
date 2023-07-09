

if global.debug {
	if keyboard_check_pressed(ord("R")) {
		game_restart();
	}
	if keyboard_check_pressed(ord("T")) {
		GAMETURN = !GAMETURN
	}
}


if room==rm_battle {

	var sx = random_range(-shake,shake);
	var sy = random_range(-shake,shake);
	camera_set_view_pos(CAM,sx,sy);
	
	
	if waiting {
		if waitcheck<=0 {
			if !instance_exists(obj_attack_default) {
				waiting = false;
				waitcheck = waitchecktime;
				battle_turnstart();
			}
		}
		else {
			waitcheck--
		}
	}
	else {
		
		//if GAMETURN==1 {
			turntimer--
			if turntimer<=0 {
				battle_endturn();
			}
		//}
		
		PLAYERSTATS.battletimer++
		if GAMETURN==0 {
			approval_adjust(approval_impatience);
		}
		
	}

}

shake = lerp(shake,0,.2);
tboxshake = lerp(tboxshake,0,.2);


