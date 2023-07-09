

if hpresspressed!=0 {
	hsp += hpress*1.15;
}

hsp = lerp(hsp,0,.1);
if pausetimer<=0 {
	vsp = -1;
}
else {
	pausetimer--
}

if PLAYABLE {

	var tr = instance_place(x,y,obj_over_challenger1);
	if tr!=noone {
		global.overtrainers[$ tr.key] = true;
		global.battle_difficulty = tr.level;
		transition(rm_battle);
	}

}


if place_meeting(x,y,obj_over_gymdoor) {
	transition_cutscene(sp_scene_badge);
}


movecollide();

camera_target(bbox_midx,bbox_midy);

draw_sort_y()

global.overworld_x = x;
global.overworld_y = y;