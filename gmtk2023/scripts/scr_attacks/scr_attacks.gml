



function fire_attack(xf,yf,ang,spd=1) {
	var b = instance_create_depth(xf,yf,0,obj_attack);
	b.hsp = lengthdir_x(spd,ang);
	b.vsp = lengthdir_y(spd,ang);
	b.start();
	
	return b;
}







function field_raycast_path(startx,starty,startang,projrad=3) {
	
	
	var maxsteps = room_width*6;
	var stepsize = 2;
	
	var pt = path_add();
	path_set_closed(pt,false);
	path_add_point(pt,startx,starty,1); //startpoint
	
	var px = startx;
	var py = starty;
	var velang = startang;
	var hsp = lengthdir_x(stepsize,velang);
	var vsp = lengthdir_y(stepsize,velang);
	for(var i=0; i<maxsteps; i++) {
		
		if !point_in_room(px,py) {
			break;
		}
	
		
		if collision_circle(px,py,projrad,obj_obstacle_battle,true,false)!=noone {
			var pl = collision_circle(px,py,projrad,obj_rockbounce,true,false);
			if pl==noone {
				pl = instance_nearest(px,py,obj_rockbounce);
			}
			if pl!=noone {
				path_add_point(pt,px,py,1);
				velang += angle_difference(pl.image_angle+90,velang);
				hsp = lengthdir_x(stepsize,velang);
				vsp = lengthdir_y(stepsize,velang);
			}
		}
		
		
		px += hsp;
		py += vsp;
		
		
	}
	
	
	path_add_point(pt,px,py,1); //endpoint
	
	return pt;
}