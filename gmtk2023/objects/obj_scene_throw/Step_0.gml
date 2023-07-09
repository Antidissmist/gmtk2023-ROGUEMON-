


if layer_sequence_is_finished(seq) {
	obj_monster_battle.visible = true;
	obj_leader_battle.visible = true;
	screenshake(3);
	with obj_monster_battle {
		ysc = 0;
		fxobj_create(x,bbox_bottom,sp_ballblast,-500);
	}
	layer_sequence_destroy(seq);
	instance_destroy();
}
else {
	obj_monster_battle.visible = false;
	obj_leader_battle.visible = false;
}



