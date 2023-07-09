


move_path(path,pt_rockblast);

if faceangle {
	image_angle = point_direction(xprev,yprev,x,y);
}

moveable_endstep();

if !object_in_room() || (!ATTACK_BOUNCES && place_meeting(x,y,obj_obstacle_battle)) {
	//if GAMETURN==1 {
	if from==obj_monster_battle {
		approval_adjust("miss");
		if !struct_get(THINGSDONE,"defymove",false) {
			notice("miss","approval down",c_red);
		}
	}
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
		if !ATTACK_PIERCES {
			instance_destroy();
		}
		else {
			objhit[$ hit.id] = true;
		}
	}
}

