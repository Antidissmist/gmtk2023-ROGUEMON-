

onclick = do_nothing;
hovered = false;
type = -1;
active = false;
attackind = -1;
pressindex = -1;


depth = depth_ui;

drawname = "";
displayname = "";
textscale = .75;

selectme = function() {
	ATTACK_TYPE = type;
	ATTACK_TYPENAME = drawname;
	var choice = global.attack_choices[attackind];
	ATTACK_PIERCES = struct_get(choice,"pierce",false);
	ATTACK_BOUNCES = struct_get(choice,"bounce",false);
	with obj_monster_battle {
		actor_aim();
	}
}

recalc = function() {
	displayname = drawname//string(pressindex)+": "+drawname;
	
	
	var w = dtext_width(displayname,textscale)+9;
	var h = 25//dtext_height(displayname,textscale)+7;
	
	image_xscale = w/8;
	image_yscale = h/8;
	
	y = room_height-sprite_height/2-6;
	
}