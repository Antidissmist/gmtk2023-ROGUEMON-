


global.vw_def = 640;
global.vh_def = 360;
global.guiscale = 4;
global.paused = false;
#macro PAUSED global.paused
#macro PLAYABLE (!PAUSED && !instance_exists(obj_transition))


#macro APPROVAL_MAX 100
function init() {
	
	
	
	
	global.playerstats = {
		health: 100,
		approval: APPROVAL_MAX/2,
		
		inventory: [],
	};
	
	
}
#macro PLAYERSTATS global.playerstats
#macro APPROVAL PLAYERSTATS.approval


#macro KEY_LEFT (keyboard_check(vk_left) || keyboard_check(ord("A")))
#macro KEY_RIGHT (keyboard_check(vk_right) || keyboard_check(ord("D")))
#macro KEY_UP (keyboard_check(vk_up) || keyboard_check(ord("W")))
#macro KEY_DOWN (keyboard_check(vk_down) || keyboard_check(ord("S")))
#macro hpress obj_program._hpress
#macro vpress obj_program._vpress


#macro CAM view_camera[0]
#macro vx camera_get_view_x(CAM)
#macro vy camera_get_view_y(CAM)
#macro vw camera_get_view_width(CAM)
#macro vh camera_get_view_height(CAM)
#macro alen array_length
#macro dsize ds_list_size
#macro log dblog
function dblog() {
	var s = "";
	for(var i=0; i<argument_count; i++) {
		s += string(argument[i])+",";
	}
	show_debug_message(s);
}

#macro gw (vw*global.guiscale)
#macro gh (vh*global.guiscale)

#macro mouse_l_pr (mouse_check_button_pressed(mb_left) && PLAYABLE)

#macro inst_ensure_single if instance_number(object_index)>1 { instance_destroy(); exit; }
#macro bbox_width (bbox_right-bbox_left)
#macro bbox_height (bbox_bottom-bbox_top)
#macro bbox_midx (bbox_left+bbox_width/2)
#macro bbox_midy (bbox_top+bbox_height/2)
#macro dc draw_set_color
#macro da draw_set_alpha



global._instplacelist = ds_list_create(); //lol
#macro instplace_list global._instplacelist


function transition(rm) {
	if instance_exists(obj_transition) {
		return noone;
	}
	var t = instance_create_depth(0,0,0,obj_transition,{ goesto: rm });
	return t;
}




function moveable_setup() {
	hsp = 0;
	vsp = 0;
	xprev = x;
	yprev = y;
}
function moveable_endstep() {
	xprev = x;
	yprev = y;
}
function place_solid(xx,yy) {
	
	
	return place_meeting(xx,yy,obj_solid) || place_meeting(xx,yy,obj_solid_stagewall) || room_edge_meeting(xx,yy);
	
}
function place_solid_instage(xx,yy) {
	return place_meeting(xx,yy,obj_solid);
}
function move_nocollide() {
	x += hsp;
	y += vsp;
}
function movecollide(func=place_solid) {
	
	
	
	if !func(x+hsp,y) {
		x += hsp;
	}
	else {
		hsp = 0;
	}
	
	
	if !func(x,y+vsp) {
		y += vsp;
	}
	else {
		vsp = 0;
	}
	
	
	
	
	
	
}
function movecollidebounce(func=place_solid) {
	
	
	
	if !func(x+hsp,y+vsp) {
		x += hsp;
		y += vsp;
	}
	else {
		var pl = instance_place(x,y,obj_rockbounce);
		if pl==noone {
			pl = instance_nearest(x,y,obj_rockbounce);
		}
		if pl!=noone {
			var vel = point_distance(xprev,yprev,x,y);
			var ang = pl.image_angle+90;
			//debugline(x,y,50,ang);
			hsp = lengthdir_x(factor,ang);
			vsp = lengthdir_y(factor,ang);
			
			x += hsp;
			y += vsp;
			
			//nocollide = 5;
			
		}
	}
	

	
}




