



function interval(frames) {
	return (current_frame % frames)==0;
}


function struct_get(str,name,def=undefined) {
	if variable_struct_exists(str,name) {
		return str[$ name];
	}
	else {
		return def;
	}
}

function debugline(xx,yy,len=10,dir) {
	var l = instance_create_depth(xx,yy,0,obj_debugline);
	l.dir = dir;
	l.len = len;
	return l;
}


/// @func lerp_angle(ang,targ,amt)
function lerp_angle(a,targ,amt) {
	return a+angle_difference(targ,a)*amt;
}

function do_nothing(){}
function return_false(){return false;}
function return_true(){return true;}


function object_in_room(inst=id) {
	return rectangle_in_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0,0,room_width,room_height);
}
function point_in_room(px,py) {
	return point_in_rectangle(px,py,0,0,room_width,room_height);
}
function point_in_battlebox(px,py) {
	return position_meeting(px,py,obj_battleboxregion);
}
function room_edge_meeting(xx,yy) {
	
	var dx = (xx-x);
	var dy = (yy-y);
	
	
	if (bbox_left+dx)<0
	|| (bbox_top+dy)<0
	|| (bbox_right+dx)>=room_width
	|| (bbox_bottom+dy)>=room_height {
		return true;
	}
	
	return false;
}


function camera_target(xx,yy,roomedge=true) {
	
	camera_set_view_size(CAM,global.vw_def,global.vh_def);
	
	var tx = xx-vw/2;
	var ty = yy-vh/2;
	
	
	if roomedge {
		tx = clamp(tx,0,room_width-vw);
		ty = clamp(ty,0,room_height-vh);
	}
	
	camera_set_view_pos(CAM,tx,ty);
	
}


function array_random(arr) {
	var ind = irandom(alen(arr)-1);
	return arr[ind];
}



function framestotime(fr) {
	return string(floor(fr/60));
}