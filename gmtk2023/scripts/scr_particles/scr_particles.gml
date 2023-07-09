




function pt_emit(xx,yy,ptype,rad=0,lo=1,hi=1,ps=obj_program.ps) {
	var amt = floor(random_range(lo,hi));
	repeat(amt) {
		var px = random_range(xx-rad,xx+rad);
		var py = random_range(yy-rad,yy+rad);
		part_particles_create(ps,px,py,ptype,1);
	}
}


function pt_rockblast(xx,yy) {
	pt_emit(xx,yy,global.part_rocks,3,1,3,obj_program.ps_top);
	fxobj_create(xx,yy,sp_fx_blast);
}


var p = part_type_create();
part_dust_yellow = p;
part_type_sprite(p,sp_p_dust,false,false,true);
part_type_orientation(p,0,360,0,0,0);
part_type_direction(p,0,360,0,0);
part_type_speed(p,.1,.5,0,0);
part_type_life(p,30,60);
part_type_color1(p,c_yellow);
part_type_alpha2(p,.5,0)

var p = part_type_create();
part_dust_beam = p;
part_type_sprite(p,sp_pixel,false,false,true);
part_type_size(p,1,1.5,0,0);
part_type_orientation(p,0,360,0,0,0);
part_type_direction(p,0,360,0,0);
part_type_speed(p,.1,.5,0,0);
part_type_life(p,30,60);
part_type_color1(p,#FF6B02);
part_type_alpha2(p,1,0);


var p = part_type_create();
part_rocks = p;
part_type_sprite(p,sp_p_rocks,false,false,true);
part_type_size(p,.8,1.5,0,0);
part_type_orientation(p,0,360,0,0,0);
part_type_direction(p,0,360,0,0);
part_type_speed(p,.7,1.5,0,0);
part_type_life(p,30,40);
part_type_alpha3(p,1,1,0);

