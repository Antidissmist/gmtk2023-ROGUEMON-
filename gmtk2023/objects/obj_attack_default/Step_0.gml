


move_path(path,pt_rockblast);

if faceangle {
	image_angle = point_direction(xprev,yprev,x,y);
}

moveable_endstep();

if !object_in_room() || (!ATTACK_BOUNCES && place_meeting(x,y,obj_obstacle_battle)) {
	instance_destroy();
}


var hit = hittable_place(,,from);
if hit==from {
	hit = noone;
}
else if hit==noone {
	from = noone;
}
if hit!=noone {
	var canhit = true;
	
	if ATTACK_PIERCES {
		if variable_struct_exists(objhit,hit.id) {
			canhit = false; //already hit
		}
	}
	
	if canhit {
		hittable_hit(hit,hitdmg);
		if !ATTACK_PIERCES {
			instance_destroy();
		}
		else {
			objhit[$ hit.id] = true;
		}
	}
}

