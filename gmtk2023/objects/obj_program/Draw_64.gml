

if room==rm_over1 {
	var sc = 1;
	var ww = vw*1.5;
	var hh = vh*1.5;
	var ux = ww/2+random_range(-flshake,flshake);
	var uy = hh;
	draw_sprite_ext(sp_overui,0,ux,uy, sc,sc, 0,c_white,1);
	if hpresspressed!=0 {
		presstime = 15;
		flshake = 50;
		var s = sign(hpress);
		flxsc = s==0 ? flxsc : s;
		sfx_play(snd_slam,false,1,.2);
	}
	var flind = 1;
	if presstime>0 {
		presstime--
		flind = 2;
	}
	draw_sprite_ext(sp_overui,flind,ux,uy, flxsc*sc,sc, 0,c_white,1);
	
	if obj_over_leader.y>1350 {
		dtext_centered(ux,uy-160,"< MASH! >",2);
	}
	
	flshake = lerp(flshake,0,.3);
}

