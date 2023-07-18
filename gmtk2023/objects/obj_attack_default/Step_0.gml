


move_path(path,pt_rockblast);

if faceangle {
	image_angle = point_direction(xprev,yprev,x,y);
}

moveable_endstep();

if !object_in_room() || (!ATTACK_BOUNCES && place_meeting(x,y,obj_obstacle_battle)) {
	onmiss();
	instance_destroy();
}

if collision_circle(x,y,GRAZERAD,obj_monster_battle,true,false)!=noone {
	approval_adjust("grazed");
	obj_monster_battle.grazealph = 1;
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
		var firsthit = false;
		if !ATTACK_PIERCES {
			firsthit = true;
			instance_destroy();
		}
		else if !objhit[$ hit.id] {
			firsthit = true;
			objhit[$ hit.id] = true;
		}
		if firsthit && first {
			fxobj_explode(x,y)
		}
	}
}

