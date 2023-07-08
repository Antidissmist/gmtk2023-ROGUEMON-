


walkspeed = 1.5;
aimx = room_width/2;
aimy = room_height/2;

moveable_setup();




#region attacks

get_enemy = function() {
	return instance_nearest(x,y,obj_enemy_battle);
}


aimangle = 0;
attacktype = -1;
aimlines = [];
drawlines = function() {
	var len = alen(aimlines);
	for(var i=0; i<len; i++) {
		draw_path_dotted(aimlines[i],0,0);
	}
}
clearlines = function() {
	var len = alen(aimlines);
	for(var i=0; i<len; i++) {
		path_delete(aimlines[i]);
	}
	aimlines = [];
}

aim = function() {
	clearlines();
	method(id,attacks[$ attacktype].aim)();
}
attack = function() {
	method(id,attacks[$ attacktype].attack)();
}

attacks = {
	aimed: {
		
		aim: function() {
			var tx = 0;
			var ty = 0;
			var en = get_enemy();
			if en!=noone {
				tx = en.x;
				ty = en.y;
			}
			aimangle = point_direction(x,y,tx,ty);
			array_push(aimlines,field_raycast_path(x,y,aimangle))
		},
		
		attack: function() {
			fire_attack(x,y,aimlines[0]);
		},
	
	},
	
	
	mouse: {
		
		aim: function() {
			aimangle = point_direction(x,y,aimx,aimy)
			array_push(aimlines,field_raycast_path(x,y,aimangle))
		},
		
		attack: function() {
			fire_attack(x,y,aimlines[0]);
		},
	
	},
	
	
	beam: {
		
		aim: function() {
			aimangle = point_direction(x,y,aimx,aimy)
			array_push(aimlines,field_raycast_path(x,y,aimangle))
		},
		
		attack: function() {
			var ts = time_source_create(time_source_game,1,time_source_units_frames,method(id,function(){
				fire_attack(x,y,aimlines[0],6,obj_attack_beam);
			}),[],30);
			time_source_start(ts);
		},
	
	},


	circle: {
		aim: function() {
			aimangle = 0;
			var ang = 360/8;
			for(var i=0; i<360; i+=ang;) {
				array_push(aimlines,field_raycast_path(x,y,aimangle+i));
			}	
		},
		attack: function() {
			var len = alen(aimlines);
			for(var i=0; i<len; i++) {
				fire_attack(x,y,aimlines[i]);
			}	
		},
	},

};



#endregion