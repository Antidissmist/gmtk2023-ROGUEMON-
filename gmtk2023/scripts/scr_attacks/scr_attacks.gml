


#region attack definitions


function actor_aim(inst=id) {
	if ATTACK_TYPE==-1 {
		obj_program.clearlines();
		return;
	}
	with inst {
		obj_program.clearlines();
		method(id,global.attacks[$ ATTACK_TYPE].aim)(id);
	}
}
function actor_attack(inst=id) {
	if ATTACK_TYPE==-1 {
		return;
	}
	with inst {
		onattack();
		screenshake(screenshake_attack);
		method(id,global.attacks[$ ATTACK_TYPE].attack)(id);
		ysc = .2;
	}
}


function attack_aim_choice() {
	//choice of where to attack
	
	if GAMETURN==1 {
		var tx = 0;
		var ty = 0;
		var en = get_enemy();
		with en {
			tx = bbox_midx;
			ty = bbox_midy;
		}
		aimx = tx;
		aimy = ty;
	}
	aimangle = point_direction(x,y,aimx,aimy);
}
function attack_aim_nochoice() {
	var tx = 0;
	var ty = 0;
	var en = get_enemy();
	with en {
		tx = bbox_midx;
		ty = bbox_midy;
	}
	aimx = tx;
	aimy = ty;
	aimangle = point_direction(x,y,tx,ty);
}

#macro QUICKATTACKRANGE 70
#macro QUICKATTACKTIME 55

global.attack_choices = [
	{name: "Piercing Beam", type: "beam", pierce: true, bounce: true},
	{name: "Energy Beam", type:"beam", bounce: true},
	{name: "Focus Hit", type:"aimed", bounce: true},
	{name: "Energy Sphere", type:"mouse", bounce: true},
	//{name: "Storm Blast", type:"circle"},
	//{name: "Mirror Beam", type:"beamback", bounce: true},
	{name: "Split Laser", type:"laserwave", pierce: true, bounce: true},
	{name: "Curve Ball", type:"curveball"},
	{name: "Triple Shot", type:"tripleshot"},
	{name: "Scatter Bolt", type:"scatterbolt"},
	{name: "Thunder Beam", type:"zigzag", pierce: true},
];


global.attacks = {
	aimed: {
		
		aim: function(_id) {
			attack_aim_nochoice();
			array_push(obj_program.aimlines,field_raycast_path(x,y,aimangle,,_id))
		},
		
		attack: function(_id) {
			fire_attack(x,y,obj_program.aimlines[0]);
			sfx_play(snd_shoot3,,,.2);
		},
	
	},
	
	
	mouse: {
		
		aim: function(_id) {
			attack_aim_choice();
			array_push(obj_program.aimlines,field_raycast_path(x,y,aimangle,,_id))
		},
		
		attack: function(_id) {
			fire_attack(x,y,obj_program.aimlines[0]);
			sfx_play(snd_shoot3,,,.2);
		},
	
	},
	
	curveball: {
		
		aim: function(_id) {
			attack_aim_choice();
			array_push(obj_program.aimlines,field_raycast_path(x,y,aimangle-45,,_id,function(i,ang){
				if i%5==0 {
					return ang+1;
				}
				return ang;
			}))
		},
		
		attack: function(_id) {
			fire_attack(x,y,obj_program.aimlines[0]);
			sfx_play(snd_shoot3,,,.2);
		},
	
	},
	
	scatterbolt: {
		
		aim: function(_id) {
			attack_aim_choice();
			array_push(obj_program.aimlines,field_raycast_path(x,y,aimangle,,_id,function(i,ang){
				if i%10==0 {
					random_set_seed(obj_program.turnseed+69+i);
					var ret =  ang+random_range(-10,10);
					//random_set_seed(random_get_seed()+1);
					randomize();
					return ret;
				}
				return ang;
			}))
		},
		
		attack: function(_id) {
			fire_attack(x,y,obj_program.aimlines[0]);
			sfx_play(snd_shoot3,,,.2);
		},
	
	},
	
	zigzag: {
		
		aim: function(_id) {
			attack_aim_choice();
			array_push(obj_program.aimlines,field_raycast_path(x,y,aimangle+30,,_id,function(i,ang){
				var dist = 50;
				if i%dist==0 {
					return ang + ((i%(dist*2)==0) ? -60 : 60);
				}
				return ang;
			}))
		},
		
		attack: function(_id) {
			fire_attack_repeated(x,y,obj_program.aimlines[0],,obj_attack_beam,_id,LASER_SEGMENTS);
			sfx_play(snd_laser,,,.2);
		},
	
	},
	
	tripleshot: {
		
		aim: function(_id) {
			attack_aim_choice();
			array_push(obj_program.aimlines,field_raycast_path(x,y,aimangle,,_id))
		},
		
		attack: function(_id) {
			fire_attack_repeated(x,y,obj_program.aimlines[0],,obj_attack_triple,_id,3,17);
			//sound inside
		},
	
	},
	
	
	beam: {
		
		aim: function(_id) {
			attack_aim_choice();
			array_push(obj_program.aimlines,field_raycast_path(x,y,aimangle,,_id))
		},
		
		attack: function(_id) {
			fire_attack_repeated(x,y,obj_program.aimlines[0],,obj_attack_beam,_id,LASER_SEGMENTS);
			sfx_play(snd_laser,,,.2);
			
		},
	
	},
	
	
	beamback: {
		
		aim: function(_id) {
			//no choice
			array_push(obj_program.aimlines,field_raycast_path(x,y,aimangle+180,,_id))
		},
		
		attack: function(_id) {
			fire_attack_repeated(x,y,obj_program.aimlines[0],,obj_attack_beam,_id,LASER_SEGMENTS);
			sfx_play(snd_laser,,,.2);
		},
	
	},


	circle: {
		aim: function(_id) {
			attack_aim_choice();
			var ang = 360/8;
			for(var i=0; i<360; i+=ang;) {
				array_push(obj_program.aimlines,field_raycast_path(x,y,aimangle+i,,_id));
			}	
		},
		attack: function(_id) {
			var len = alen(obj_program.aimlines);
			for(var i=0; i<len; i++) {
				fire_attack(x,y,obj_program.aimlines[i]);
				
			}	
			sfx_play(snd_shoot3,,,.2);
		},
	},

	
	laserwave: {
		aim: function(_id) {
			var ang = 8;
			attack_aim_choice();
			array_push(obj_program.aimlines,field_raycast_path(x,y,aimangle+ang,,_id));
			array_push(obj_program.aimlines,field_raycast_path(x,y,aimangle-ang,,_id));
		},
		attack: function(_id) {
			fire_attack_repeated(x,y,obj_program.aimlines[0],,obj_attack_beam,_id,LASER_SEGMENTS);
			fire_attack_repeated(x,y,obj_program.aimlines[1],,obj_attack_beam,_id,LASER_SEGMENTS);
			sfx_play(snd_laser,,,.2);
		},
	},
	
	

};
#endregion


#region reactions

global.reactions = {
	hitleader: [//--
		"ow!",
		"hey!",
		"ouch!!",
		"yow!",
	],
	
	hitenemy: [//++
		"yes!",
		"yeah!",
		"haha!",
	],
	
	defymove: [//--
		"huh?",
		"hey!",
		"what??",
	],
	
	grazed: [
		"ooh!",
		"close one!",
		"near miss!",
		"wow!",
	],
	
	miss: [ //--
		"miss!",
		"bad shot!",
		"miss!?",
		"not good enough!",
	],
	
	monsterdies: [
		"come on!!",
		"disappointing..",
		"loser!",
		"wase of my time..",
	],

};


#endregion

function fire_attack(xf,yf,path,spd=1,obj=obj_attack,from=id) {
	var b = instance_create_depth(xf,yf,0,obj);
	b.spd = spd;
	b.path = path;
	b.from = from;
	b.fromorig = from;
	b.first = true;
	b.start();
	
	return b;
}
function fire_attack_repeated(xf,yf,path,spd=1,obj=obj_attack,from=id,reps=LASER_SEGMENTS,period=1) {
	from.firstattk = true;
	var ts = time_source_create(time_source_game,period,time_source_units_frames,method(from,function(xf,yf,path,spd,obj,from){
		var t = fire_attack(xf,yf,path,spd,obj,from);
		t.first = from.firstattk;
		from.firstattk = false;
		if obj==obj_attack_triple {
			sfx_play(snd_shoot3,,,.2);
		}
	}),[xf,yf,path,spd,obj,from],reps);
	time_source_start(ts);
}



function hittable_setup() {
	onhit = do_nothing; //(dmg)
	onattack = do_nothing; //animation
	get_health = return_true;
	get_maxhealth = return_true;
	
	xsc = 1;
	ysc = 1;
	
	hitglow = false;
	
	shakeamt = 0;
	quickattacktimer = 0;
}
function hittable_hit(inst=id,dmg=1) {
	with inst {
		
		fxobj_create(x,y,sp_fx_airhit,depth-20,1.5);
		
		sfx_play(snd_hitsound,,,.2);
		
		shakeamt = 5;
		
		if global.debug && keyboard_check(ord("G")) {
			dmg = 999;
		}
	
		onhit(dmg);
		
	}
}
function hittable_meeting(xx=x,yy=y) {
	
	
	return place_meeting(xx,yy,obj_enemy_battle)
	|| place_meeting(xx,yy,obj_leader_battle)
	|| place_meeting(xx,yy,obj_monster_battle);
	
}
function hittable_place(xx=x,yy=y,exclude=noone) {
	
	var list = instplace_list;
	ds_list_clear(list);
	
	var len = 0;
	len += instance_place_list(xx,yy, obj_enemy_battle, list,false);
	len += instance_place_list(xx,yy, obj_leader_battle, list,false);
	len += instance_place_list(xx,yy, obj_monster_battle, list,false);
	var possible = noone;
	var ret = noone;
	for(var i=0; i<len; i++) {
		var en = list[| i];
		if en!=exclude {
			ret = en;
			break;
		}
		else {
			possible = en;
		}
	}
	
	if ret==noone return possible;
	
	return ret;
}

function hittable_position(xx=x,yy=y,exclude=noone,rad=2) {
	
	var list = instplace_list;
	ds_list_clear(list);
	
	var len = 0;
	len += collision_circle_list(xx,yy,rad, obj_enemy_battle, true,false,list,false);
	len += collision_circle_list(xx,yy,rad, obj_leader_battle, true,false,list,false);
	len += collision_circle_list(xx,yy,rad, obj_monster_battle, true,false,list,false);
	var ret = noone;
	var possible = noone;
	for(var i=0; i<len; i++) {
		var en = list[| i];
		if en!=exclude {
			ret = en;
			break;
		}
		else {
			possible = en;
		}
	}
	
	if ret==noone return possible;
	
	return ret;
}




function collision_bouncecheck(px,py,obj) {
	return collision_point(px,py,obj,true,false);
}
function field_raycast_path(startx,starty,startang,projrad=2,from=noone,stepfunc=-1) {
	
	
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
	
		
		var bounced = false;
		if ATTACK_BOUNCES && collision_circle(px,py,projrad,obj_obstacle_battle,true,false)!=noone {
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
				bounced = true;
			}
		}
		
		
		if !bounced {
			if stepfunc!=-1 {
				var pang = velang;
				velang = stepfunc(i,velang);
				if pang!=velang {
					path_add_point(pt,px,py,1);
					hsp = lengthdir_x(stepsize,velang);
					vsp = lengthdir_y(stepsize,velang);
				}
			}
		}
		
		var hit = hittable_position(px,py,from,projrad);
		if hit==from {
			hit = noone;
		}
		else if hit==noone {
			from = noone;
		}
		if hit!=noone {
			hit.hitglow = true;
			/*if !PLAYERSTATS.piercing {
				break;
			}*/
		}
		
		
		
		px += hsp;
		py += vsp;
		
		
	}
	
	
	path_add_point(pt,px,py,1); //endpoint
	
	//log("len",path_get_number(pt),path_get_length(pt))
	
	return pt;
}