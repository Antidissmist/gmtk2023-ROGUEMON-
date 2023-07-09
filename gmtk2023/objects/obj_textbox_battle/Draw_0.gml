

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
	