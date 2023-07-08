



function fire_attack(xf,yf,path,spd=1,obj=obj_attack) {
	var b = instance_create_depth(xf,yf,0,obj);
	b.spd = spd;
	b.path = path;
	b.start();
	
	return b;
}






function collision_bouncecheck(px,py,obj) {
	return collision_point(px,py,obj,true,false);
}
function field_raycast_path(startx,starty,startang,projrad=2) {
	
	
	var maxsteps = room_width*6;
	var stepsize = 1;
	
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
			var pl = collision_bouncecheck(px,py,obj_rockbounce);
			/*if pl==noone {
				pl = instance_nearest(px,py,obj_rockbounce);
			}*/
			if pl!=noone {
				path_add_point(pt,px,py,1);
				var perp = pl.image_angle;
				//velang += angle_difference(perp,velang);
				//velang = perp-velang//+angle_difference(velang,perp);
				
				velang = perp+abs(angle_difference(perp,velang));
				//debugline(px,py,50,velang)
				//velang = perp-angle_difference();
				
				hsp = lengthdir_x(stepsize,velang);
				vsp = lengthdir_y(stepsize,velang);
			}
		}
		
		
		px += hsp;
		py += vsp;
		
		
	}
	
	
	path_add_point(pt,px,py,1); //endpoint
	
	//log("len",path_get_number(pt),path_get_length(pt))
	
	return pt;
}