


hittable_setup();


onhit = function(dmg) {
	PLAYERSTATS.leaderhp -= dmg;
	approval_adjust(approval_hitleader,dmg);
	if PLAYERSTATS.leaderhp <= 0 {
		battle_leader_dies();
	}
}



get_healthpercent = function() {
	return PLAYERSTATS.leaderhp/LEADERHP_MAX
}