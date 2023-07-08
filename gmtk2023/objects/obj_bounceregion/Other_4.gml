



var r = instance_place(x,y,obj_obstacle_battle);


datarr = [];


var list = instplace_list;
ds_list_clear(list);
var len = instance_place_list(x,y,obj_rockbounce,list,false);

for(var i=0; i<len; i++) {
	var inst = list[| i];
	
	var _len = point_distance(r.x,r.y,inst.x,inst.y);
	var _dir = point_direction(r.x,r.y,inst.x,inst.y);
	
	array_push(datarr,{
		len: _len,
		dir: _dir,
		xsc: inst.image_xscale,
		ysc: inst.image_yscale,
		ang: inst.image_angle,
	});
}


obj_program.bouncedata[$ string(r.object_index)] = datarr;
setup = true;


var allset = true;
with obj_bounceregion {
	if !setup {
		allset = false;
		break;
	}
}



if allset {
	with obj_obstacle_battle {
		if place_meeting(x,y,obj_bounceregion) {
			instance_destroy();
			continue;
		}
		var arr = struct_get(obj_program.bouncedata,string(object_index),-1);
		if arr!=-1 {
			var len = alen(arr);
			for(var i=0; i<len; i++) {
				var str = arr[i];
				var ang = image_angle;
				var b = instance_create_depth(
				x+lengthdir_x(str.len,str.dir+ang),
				y+lengthdir_y(str.len,str.dir+ang),
				0,obj_rockbounce
				);
				b.image_xscale = str.xsc;
				b.image_yscale = str.ysc;
				b.image_angle = ang+str.ang;
			}
		}
	}
}