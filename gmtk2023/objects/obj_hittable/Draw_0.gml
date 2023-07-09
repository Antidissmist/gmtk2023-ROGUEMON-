


draw_self_ext(sprite_index,image_index,
x+random_range(-shakeamt,shakeamt),
y+random_range(-shakeamt,shakeamt),xsc,ysc);

if quickattacktimer {
	gpu_set_fog(true,#ff004d,0,0);
	draw_self_ext(,,
	x+random_range(-shakeamt,shakeamt),
	y+random_range(-shakeamt,shakeamt),xsc,ysc,,,.75*(sin(current_time/30)*.5+.5));
	gpu_set_fog(false,c_white,0,0);
}
else if hitglow {
	gpu_set_fog(true,c_yellow,0,0);
	draw_self_ext(,,
	x+random_range(-shakeamt,shakeamt),
	y+random_range(-shakeamt,shakeamt),xsc,ysc,,,.75*(sin(current_time/120)*.5+.5));
	gpu_set_fog(false,c_white,0,0);
}

shakeamt = lerp(shakeamt,0,.2);
image_angle = lerp_angle(image_angle,0,.2);


//xsc = lerp(xsc,1,.2);
ysc = lerp(ysc,1,.2);