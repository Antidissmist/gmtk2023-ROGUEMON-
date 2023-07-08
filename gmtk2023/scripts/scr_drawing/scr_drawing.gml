



function draw_sort_y(yy=bbox_bottom) {
	depth = -yy;
}


function draw_path_dotted(path,xx,yy,stepsize=7) {
	
	
	var len = path_get_length(path);
	
	var px = xx;
	var py = yy;
	var counter = 0;
	for(var i=0; i<len; i+=stepsize;) {
		var nx = path_get_x(path,i/len);
		var ny = path_get_y(path,i/len);
		
		if counter {
			//draw_line_width_color(px,py,nx,ny,2,c_yellow,c_yellow);
			var dist = point_distance(px,py,nx,ny)/2;
			var ang = point_direction(px,py,nx,ny);
			draw_sprite_ext(sp_line,0, px,py,dist,.75, ang, c_yellow,.75);
		}
		
		px = nx;
		py = ny;
		counter = !counter;
	}
	
	
}



function draw_shadow() {
	
	var w = (bbox_width+6)/64;
	
	draw_sprite_ext(sp_circle,0, bbox_midx,bbox_bottom, w,w*.5, 0,c_black,.5);
	
	
	
}


function draw_center(h=false,v=false) {
	draw_set_halign(h ? fa_center : fa_left);
	draw_set_valign(v ? fa_middle : fa_top);
}

function dtext(x,y,str,scl=.125) {
	scl *= global.textscale;
	draw_text_transformed(x,y,str,scl,scl,0);
}
function dtext_centered(x,y,str,scl=1) {
	draw_center(1,1);
	dtext(x,y,str,scl);
	draw_center();
}