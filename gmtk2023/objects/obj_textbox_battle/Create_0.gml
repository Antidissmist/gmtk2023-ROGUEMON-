



//side=GAMETURN;
//text=""
tboxshake = 12;

//lifetimer = 200;
image_alpha = 1;


with obj_textbox_battle {
	if id!=other.id {
		
		if text==other.text {
			instance_destroy(other.id);
			exit;
		}
		
		if side==other.side {
			instance_destroy();
		}
	}
}




drawme = function() {


	if PRESSABLE {

		var texw = dtext_width(text)/2+48;

		var tx = texw;
		var ty = 30;
		var mx = 81;
		var my = 160;

		if side==1 {
			tx = vw-texw;
			//ty = 80;
			mx = 650;
			my = 150;
		}

		var sx = random_range(-tboxshake,tboxshake)
		var sy = random_range(-tboxshake,tboxshake)
		tboxshake = lerp(tboxshake,0,.2);
		
		tx += sx;
		ty += sy;

		draw_textbox(tx,ty,text,,mx,my,image_alpha);
	
		lifetimer--
		if lifetimer<=0 {
			image_alpha -= .05;
			if image_alpha<=0 {
				instance_destroy();
			}
		}
	
	}
	
}