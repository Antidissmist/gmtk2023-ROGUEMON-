


walkspeed = 1.5;

moveable_setup();
hittable_setup();

onhit = function(dmg) {
	PLAYERSTATS.monsterhp -= dmg;
	if PLAYERSTATS.monsterhp<=0 {
		battle_monster_dies();
	}
}
get_healthpercent = function() {
	return PLAYERSTATS.monsterhp/MONSTERHP_MAX
}


#region attacks

get_enemy = function() {
	return instance_nearest(x,y,obj_enemy_battle);
}


aimangle = 0;
aimlock = false;
aimx = room_width/2;
aimy = room_height/2;


#endregion