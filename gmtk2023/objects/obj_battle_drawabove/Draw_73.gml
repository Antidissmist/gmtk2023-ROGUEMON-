


with obj_program {
	if PLAYABLE {

		var tx = 130;
		var ty = 60;
		var mx = 81;
		var my = 160;

		if GAMETURN==1 {
			tx = 520;
			ty = 80;
			mx = 650;
			my = 150;
		}

		var sx = random_range(-tboxshake,tboxshake)
		var sy = random_range(-tboxshake,tboxshake)
		
		tx += sx;
		ty += sy;

		draw_textbox(tx,ty,speaktext,,mx,my);
	
	}

}

