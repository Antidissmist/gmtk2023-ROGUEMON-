




function pt_emit(xx,yy,ptype,rad=0,lo=1,hi=1) {
	var amt = floor(random_range(lo,hi));
	repeat(amt) {
		var px = random_range(xx-rad,xx+rad);
		var py = random_range(yy-rad,yy+rad);
		part_particles_create(obj_program.ps,px,py,ptype,1);
	}
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


