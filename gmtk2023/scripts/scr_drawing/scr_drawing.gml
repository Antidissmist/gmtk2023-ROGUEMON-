



function draw_sort_y(yy=bbox_bottom) {
	depth = -yy;
}

function draw_textbox(cx,cy,text,sc=1,tx,ty,alph=1) {
	
	
	var w = dtext_width(text,sc)/2;
	var h = dtext_height(text,sc)/2;
	var b = 8;
	
	var rad = 25;
	
	var pdir = point_direction(cx,cy,tx,ty);
	var pdist = point_distance(cx,cy,tx,ty);
	draw_sprite_ext(sp_textcone,0,tx,ty, pdist/64,.25, pdir+180,c_white,alph);
	
	da(alph);
	draw_roundrect_color_ext(
	cx-w-b,
	cy-h-b,
	cx+w+b,
	cy+h+b,
	rad,rad,
	c_white,c_white,false
	
	);
	
	dc(c_black);
	dtext_centered(cx,cy,text,sc);
	dc(c_white);
	da(1);
	
	
}


function draw_path_dotted(path,xx,yy,stepsize=7,alphfade=true) {
	
	
	var len = path_get_length(path);
	
	var px = xx;
	var py = yy;
	var counter = 0;
	var perc = 0;
	for(var i=0; i<len; i+=stepsize;) {
		perc = i/len;
		var nx = path_get_x(path,perc);
		var ny = path_get_y(path,perc);
		
		if counter {
			//draw_line_width_color(px,py,nx,ny,2,c_yellow,c_yellow);
			var dist = point_distance(px,py,nx,ny)/2;
			var ang = point_direction(px,py,nx,ny);
			draw_sprite_ext(sp_line,0, px,py,dist,.75, ang, col_yellow,.75*(1-perc));
		}
		
		px = nx;
		py = ny;
		counter = !counter;
	}
	
	
}

function draw_self_ext(sprite=sprite_index,subimg=image_index,xx=x,yy=y,xscale=image_xscale,yscale=image_yscale,rot=image_angle,col=image_blend,alpha=image_alpha) {
	draw_sprite_ext(
	sprite,subimg,xx,yy,xscale,yscale,rot,col,alpha
	);
}


function draw_shadow(circleme=false) {
	
	var w = (bbox_width+6)/64;
	
	draw_sprite_ext(sp_circle,0, bbox_midx,bbox_bottom, w,w*.5, 0,c_black,.5);
	if circleme {
		draw_sprite_ext(sp_circle_ring,0, bbox_midx,bbox_bottom, w,w*.5, 0,col_yellow,1);
	}
	
	
	
}


function draw_hpbar(xx,yy,hp,maxhp,maxwid=5,sc=2) {
	
	/*var w = 20;
	var h = 3;
	var col = #ff004d;
	
	draw_healthbar( xx-w,yy-h,xx+w,yy+h, percent*100,c_black, col,col, 0,true,true );*/

	var spw = sprite_get_width(sp_healthpiece);
	var sph = sprite_get_height(sp_healthpiece);
	var xoff = sprite_get_xoffset(sp_healthpiece)+1;
	var yoff = sprite_get_yoffset(sp_healthpiece)+1;
	var hspc = spw*sc;
	var vspc = sph*sc;
	
	var w = hspc*maxwid;
	var hbx = xx-w/2;
	
	var hx = 0;
	var hy = yy;
	for(var i=0; i<maxhp; i++) {
		
		
		hx += hspc;
		if i%maxwid==0 {
			hx = 0;
			hy -= vspc;
		}
		draw_sprite_ext(sp_healthpiece,1,hbx+hx+hspc/2,hy, sc,sc, 0,c_white,1);
		/*if i==floor(hp) && frac(hp)!=0  {
			draw_sprite_general(sp_healthpiece,0, 0,0,spw,sph*frac(hp), hbx+hx+hspc/2-xoff,hy-yoff, sc,sc, 0,c_white,c_white,c_white,c_white,1);
		}*/
		var frc = frac(hp);
		if i==floor(hp) && frc!=0 {
			draw_sprite_ext(sp_healthpiece,0,hbx+hx+hspc/2,hy, sc*frc,sc*frc, 0,c_white,1);
		}
		else if i<hp {
			draw_sprite_ext(sp_healthpiece,0,hbx+hx+hspc/2,hy, sc,sc, 0,c_white,1);
		}
	}
	
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
function dtext_center_outlined(x,y,str,scl=1) {
	draw_center(1,1);
	var c = draw_get_color();
	dc(c_black);
	var w = 1*scl;
	dtext(x-w,y,str,scl);
	dtext(x+w,y,str,scl);
	dtext(x,y-w,str,scl);
	dtext(x,y+w,str,scl);
	dc(c);
	dtext(x,y,str,scl);
	draw_center();
}



function dtext_width(str,sc=1) {
	return string_width(str)*global.textscale*sc;
}
function dtext_height(str,sc=1) {
	return string_height(str)*global.textscale*sc;
}









