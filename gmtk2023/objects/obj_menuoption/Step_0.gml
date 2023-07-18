
if active {
	
	//broken
	if keyboard_check_pressed(ord("1")) && pressindex==0 {
		selectme();
	}
	else if keyboard_check_pressed(ord("2")) && pressindex==1 {
		selectme();
	}
	else if keyboard_check_pressed(ord("3")) && pressindex==2 {
		selectme();
	}
	else if keyboard_check_pressed(ord("4")) && pressindex==3 {
		selectme();
	}
	else if keyboard_check_pressed(ord("5")) && pressindex==4 {
		selectme();
	}
	else if keyboard_check_pressed(ord("6")) && pressindex==5 {
		selectme();
	}
	
	while(place_meeting(x,y,obj_menuoption)) {
		x += 10;
	}

	hovered = PLAYABLE && position_meeting(mouse_x,mouse_y,id);
	
	image_index = 0;
	if hovered {
		
		image_index = 1;
	
		if mouse_l_pr {
			selectme();
		}
	}
	
	if drawname==ATTACK_TYPENAME {
		image_index = 2;
	}

}
else {
	x = 120;
}

visible = active;