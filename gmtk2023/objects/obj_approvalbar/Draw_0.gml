

var perc = APPROVAL/APPROVAL_MAX;

var dx = vw/2+random_range(-shakeamt,shakeamt);
var dy = 60+random_range(-shakeamt,shakeamt);
shakeamt = lerp(shakeamt,0,.1);

/*
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

*/

draw_sprite_ext(sp_approval,0,dx,dy-50, 2,2,0,c_white,1);

draw_hpbar(dx,dy,APPROVAL,APPROVAL_MAX,APPROVAL_MAX,4);




