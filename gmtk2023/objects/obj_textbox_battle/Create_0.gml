



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


