


hittable_setup();


onhit = function(dmg) {
	PLAYERSTATS.leaderhp -= dmg;
	
	approval_adjust("hitleader");
	notice("trainer hit","approval down",col_red);
	
	shakeamt = 6;
	
	sprite_index = sp_leader_battle_hurt;
	image_index = 0;
	
	if PLAYERSTATS.leaderhp <= 0 {
		sprite_index = sp_leader_battle_die;
		battle_leader_dies();
	}
}



get_health = function() {
	return PLAYERSTATS.leaderhp;
}
get_maxhealth = function() {
	return LEADERHP_MAX;
}