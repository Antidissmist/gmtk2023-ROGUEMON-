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