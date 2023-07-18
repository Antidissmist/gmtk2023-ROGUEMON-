
if sprite_exists(global.cutscenesprite) {
	draw_sprite(global.cutscenesprite,num,0,0);
}

var dy = 45;
if global.cutscenesprite!=sp_introscene {
	dy = vh-45;
}


var skiplol = (global.debug && keyboard_check(ord("P")));

timer++
if timer>90 || skiplol {
	var sc = 2;
	
	if (((current_frame/15) % 2) < .5) {
		draw_sprite_ext(sp_pressanycontinue,0, vw/2,dy, sc,sc, 0,c_white,1);
	}
	
	if anykey_pressed() || skiplol {
		if num>=sprite_get_number(global.cutscenesprite)-1 || skiplol {
			if global.cutscene_onfin==-1 {
				transition(-1,function(){
					game_restart();
				})
			}
			else {
				transition(global.cutscene_onfin);
			}
		}
		else {
			num++
		}
		timer = 0;
	}
	
}


