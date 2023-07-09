


walkspeed = 1;

moveable_setup();
hittable_setup();

maxhealth = ENEMYHP_MAX;
myhealth = maxhealth;
onhit = function(dmg) {
	myhealth -= dmg;
	if myhealth <= 0 {
		approval_adjust("killenemy");
		battle_enemy_dies();
	}
	else {
		approval_adjust("hitenemy",dmg);
	}
}

get_health = function() {
	return myhealth
}
get_maxhealth = function() {
	return ENEMYHP_MAX
}



get_enemy = function() {
	return instance_nearest(x,y,obj_monster_battle);
}


aimx = room_width/2;
aimy = room_height/2;
aimangle = 0;
