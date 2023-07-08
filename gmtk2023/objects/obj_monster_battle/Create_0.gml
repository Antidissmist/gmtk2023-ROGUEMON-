


walkspeed = 1.5;

moveable_setup();




#region attacks

get_enemy = function() {
	return instance_nearest(x,y,obj_enemy_battle);
}

attack_aimed = function() {
	var tx = 0;
	var ty = 0;
	var en = get_enemy();
	if en!=noone {
		tx = en.x;
		ty = en.y;
	}
	fire_attack(x,y,point_direction(x,y,tx,ty));
}

attack_circle = function() {
	
	
	var ang = 360/8;
	
	for(var i=0; i<360; i+=ang;) {
		fire_attack(x,y,i);
	}
}



#endregion