

var perc = APPROVAL/APPROVAL_MAX;

var dx = x+random_range(-shakeamt,shakeamt);
var dy = y+random_range(-shakeamt,shakeamt);
shakeamt = lerp(shakeamt,0,.1);


draw_sprite_ext(sprite_index,0,dx,dy,
image_xscale,
image_yscale,
image_angle,c_white,1

);
draw_sprite_ext(sprite_index,1,dx,dy,
image_xscale*perc,
image_yscale,
image_angle,c_white,1

);

