


if room==rm_over1 {
	var w = sprite_get_width(sp_overworld_megasprite);
	var h = sprite_get_height(sp_overworld_megasprite);
	var b = 15;


	var tx = sin(current_time/900)*b;
	var ty = sin(current_time/1200)*b;

	draw_sprite_stretched_ext(sp_overworld_megasprite,1,tx,ty,w+b,h+b, c_white,.25);
}

