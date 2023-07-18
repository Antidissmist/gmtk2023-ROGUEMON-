


sparr = [
	sp_enemy1,
	sp_enemy2,
	sp_enemy3,
	sp_enemy4,
	sp_enemy5,
];
walkspeed = 1;

moveable_setup();
hittable_setup();

maxhealth = enemyhp_get();
myhealth = maxhealth;
onhit = function(dmg) {
	myhealth -= dmg;
	if myhealth <= 0 {
		approval_adjust("killenemy");
		if !struct_get(THINGSDONE,"defymove",false) {
			notice("defeated enemy","approval up",col_lime);
		}
		battle_enemy_dies();
	}
	else {
		approval_adjust("hitenemy",dmg);
		if !struct_get(THINGSDONE,"defymove",false) {
			notice("hit enemy","approval up",col_lime);
		}
	}
}

get_health = function() {
	return myhealth
}
get_maxhealth = function() {
	return enemyhp_get();
}


targx = x;
targy = y;
checktimer = 0;
state = 0;


get_enemy = function() {
	return instance_nearest(x,y,obj_monster_battle);
}


aimx = room_width/2;
aimy = room_height/2;
aimangle = 0;


sprite_index = array_random(sparr);
mask_index = sprite_index;
image_speed = 1;
