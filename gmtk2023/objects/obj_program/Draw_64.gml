
var ww = vw*1.5;
var hh = vh*1.5;

if room==rm_over1 {
	var sc = 1;
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


if global.debug {
	draw_set_halign(fa_right);
	var i=1;
	var spc = 18;
	dtext(ww,hh-i++*spc,"debug mode",1);
	dtext(ww,hh-i++*spc,"ctrl+d+b to disable",1);
	dtext(ww,hh-i++*spc,"M to toggle music",1);
	dtext(ww,hh-i++*spc,"R to restart game",1);
	dtext(ww,hh-i++*spc,"P to fast walk & skip intro",1);
	
	draw_center();
}