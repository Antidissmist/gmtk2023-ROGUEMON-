///@desc setup battle




if room==rm_battle {

	var n=0;
	var spc = 26;

	var choices = global.attack_choices;
	var len = alen(choices);
	for(var i=0; i<len; i++) {
		var ch = choices[i];
		with instance_create_depth(0,vh,0,obj_menuoption) {
			type = ch.type;
			drawname = ch.name;
			attackind = i;
		}
	}


	battle_start();

}




switch (room) {
	
	
	case rm_battle:
		battleintro = true;
	break;
	
	case rm_over1:
		music_play(mus_overworld);
		audio_sound_set_track_position(global.music,global.overworld_mustime)
	break;
	
	case rm_title:
		music_play(mus_title,false);
	break;
	
}



