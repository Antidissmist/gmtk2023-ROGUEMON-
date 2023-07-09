


hittable_setup();


onhit = function(dmg) {
	PLAYERSTATS.leaderhp -= dmg;
	approval_adjust("hitleader");
	
	if PLAYERSTATS.leaderhp <= 0 {
		battle_leader_dies();
	}
}



get_health = function() {
	return PLAYERSTATS.leaderhp
}
get_maxhealth = function() {
	return LEADERHP_MAX
}