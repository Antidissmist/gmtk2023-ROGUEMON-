


if global.debug {
	if keyboard_check_pressed(ord("R")) {
		game_restart();
	}
	if keyboard_check_pressed(ord("T")) {
		GAMETURN = !GAMETURN
	}
}

if keyboard_check(vk_control) && keyboard_check(ord("D")) && keyboard_check_pressed(ord("B")) {
	global.debug = !global.debug;
}


if room==rm_battle {

	if battleintro {
		if !audio_is_playing(mus_battlestart) {
			music_play(mus_battle)
			battleintro = false;
		}
	}

	var sx = random_range(-shake,shake);
	var sy = random_range(-shake,shake);
	camera_set_view_pos(CAM,sx,sy);
	
	
	if waiting {
		if waitcheck<=-30 {
			if !instance_exists(obj_attack_default) {
				if !commented {
					approval_apply();
					commented = true;
				}
				else {
					if !instance_exists(obj_attack_default) && !instance_exists(obj_textbox_battle) {
						waiting = false;
						waitcheck = waitchecktime;
						battle_turnstart();
					}
				}
			}
		}
		else {
			waitcheck--
			if waitcheck==0 {
				if reaction!="" {
					textbox_battle(reaction,0,90);
				}
			}
		}
	}
	else {
		
		if GAMETURN==1 {
			turntimer--
			if turntimer<=0 {
				battle_endturn();
			}
		}
		
		PLAYERSTATS.battletimer++
		if GAMETURN==0 {
			//approval_adjust(approval_impatience);
		}
		
	}

}

shake = lerp(shake,0,.2);
curframe++

