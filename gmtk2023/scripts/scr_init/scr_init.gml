


global.debug = true;//
global.skiptitle = true;//
#macro STARTROOM rm_battle//rm_over1//

global.vw_def = 640;
global.vh_def = 360;
global.guiscale = 4;
global.textscale = .5;
global.paused = false;
global.button_hovered = false;
#macro PAUSED global.paused
#macro PLAYABLE (!PAUSED && !instance_exists(obj_transition) && !obj_program.waiting)
#macro PRESSABLE (!PAUSED && !instance_exists(obj_transition))


#macro depth_ui (-(global.vh_def+50))


#macro approval_defymove -1
#macro approval_hitenemy 1
#macro approval_killenemy 1
#macro approval_hitleader -1
#macro approval_impatience -1/400

#macro LASER_SEGMENTS 30
#macro GRAZERAD 40

#macro APPROVAL_MAX 6
#macro LEADERHP_MAX 20
#macro MONSTERHP_MAX 4
#macro ENEMYHP_MAX 4

function init() {
	
	randomize();
	
	draw_set_font(fnt_default);
	
	
	global.playerstats = {
		monsterhp: MONSTERHP_MAX,
		leaderhp: LEADERHP_MAX,
		approval: APPROVAL_MAX/2,
		
		inventory: [],
		
		battletimer: 0,
		gameturn: 0,
		
		attacktold: -1,
		attacktoldname: "",
		attacktype: -1,
		attacktypename: "",
		piercing: false,
		bouncing: false,
		
		thingsdone: {},
	};
	
	
}
function battle_start() {
	
	PLAYERSTATS.battletimer = 0;
	GAMETURN = 0;
	PLAYERSTATS.monsterhp = MONSTERHP_MAX;
	
	obj_program.waiting = true;
	obj_program.waitcheck = 90;
	//battle_turnstart();
	
	
	textbox_battle("Go, froglizard!",0,90)
	
}
#macro GAMETURN PLAYERSTATS.gameturn
#macro PLAYERSTATS global.playerstats
#macro APPROVAL PLAYERSTATS.approval
#macro ATTACK_PIERCES PLAYERSTATS.piercing
#macro ATTACK_BOUNCES PLAYERSTATS.bouncing
#macro ATTACK_TYPE PLAYERSTATS.attacktype
#macro ATTACK_TYPENAME PLAYERSTATS.attacktypename
#macro ATTACK_TOLD PLAYERSTATS.attacktold
#macro ATTACK_TOLDNAME PLAYERSTATS.attacktoldname
#macro THINGSDONE PLAYERSTATS.thingsdone

#macro screenshake_attack 5


function react(str) {
	//obj_program.reaction = str;
	textbox_battle(str,0,60)
}

function approval_adjust(name) {

	THINGSDONE[$ name] = true;
	
}
function approval_apply() {
	
	
	var hitleader = struct_get(THINGSDONE,"hitleader",false);
	var killenemy = struct_get(THINGSDONE,"killenemy",false);
	var hitenemy = struct_get(THINGSDONE,"hitenemy",false);
	var defymove = struct_get(THINGSDONE,"defymove",false);
	var grazed = struct_get(THINGSDONE,"grazed",false);
	var miss = struct_get(THINGSDONE,"miss",false);
	
	if defymove {
		APPROVAL--
		react(array_random(global.reactions.defymove));
	}
	else {
		if hitenemy || killenemy {
			APPROVAL++
			react(array_random(global.reactions.hitenemy));
		}
		else if miss {
			APPROVAL--
			react(array_random(global.reactions.miss));
		}
		else if hitleader {
			APPROVAL--
			react(array_random(global.reactions.hitleader));
		}
	}
	
	THINGSDONE = {};
	
}

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
#macro mouse_l (mouse_check_button(mb_left) && PLAYABLE)

#macro inst_ensure_single if instance_number(object_index)>1 { instance_destroy(); exit; }
#macro bbox_width (bbox_right-bbox_left)
#macro bbox_height (bbox_bottom-bbox_top)
#macro bbox_midx (bbox_left+bbox_width/2)
#macro bbox_midy (bbox_top+bbox_height/2)
#macro dc draw_set_color
#macro da draw_set_alpha



global._instplacelist = ds_list_create(); //lol
#macro instplace_list global._instplacelist

function textbox_battle(text,side=GAMETURN,lifetimer=120) {
	return instance_create_depth(0,0,0,obj_textbox_battle,{ text: text, side: side, lifetimer: lifetimer });
}

function transition(rm,onhalf=do_nothing) {
	if instance_exists(obj_transition) {
		return noone;
	}
	var t = instance_create_depth(0,0,0,obj_transition,{ goesto: rm });
	t.onhalfway = onhalf;
	return t;
}
function transition_cutscene(spr) {
	global.cutscenesprite = spr;
	return transition(rm_cutscene);
}

function fxobj_create(xx,yy,spr,dep=0,sc=1,reps=1) {
	return instance_create_depth(xx,yy,dep,obj_fx,{ 
		sprite_index: spr, 
		image_xscale: sc,
		image_yscale: sc,
		reps: reps,
	});
}


function screenshake(amt=1) {
	obj_program.shake = max(obj_program.shake,amt);
}



function moveable_setup() {
	hsp = 0;
	vsp = 0;
	spd = 0;
	xprev = x;
	yprev = y;
	pathamt = 0;
	pointnum = 0;
	nocollide = 0;
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
			var velang = point_direction(xprev,yprev,x,y);
			var perp = pl.image_angle;
			
			velang = perp+abs(angle_difference(perp,velang));
			
			//debugline(x,y,50,ang);
			hsp = lengthdir_x(factor,velang);
			vsp = lengthdir_y(factor,velang);
			
			x += hsp;
			y += vsp;
			
			//nocollide = 5;
			
		}
	}
	

	
}


function path_point_meeting(xx,yy,path,rad=2,edges=true) {
	var n = path_get_number(path);
	var start = edges ? 0 : 1;
	var fin = edges ? n : n-1;
	for(var i=start; i<fin; i++) {
		if point_in_circle(xx,yy,path_get_point_x(path,i),path_get_point_y(path,i),rad) {
			return true;
		}
	}
	return false;
}

function move_path(p,onbounce=do_nothing) {
	if !path_exists(p) {
		return;
	}
	
	
	x = path_get_x(p,pathamt);
	y = path_get_y(p,pathamt);
	
	if path_point_meeting(x,y,p,2,false) {
		onbounce(x,y);
	}
	
	pathamt += spd/path_get_length(p);
	
	if pathamt>1 {
		instance_destroy();
	}
	
}


