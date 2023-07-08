




var percent = timer/maxtime;



if !drawingseq {
	dc(c_black);
	draw_rectangle(0,0,gw,gh*percent,false);
	dc(c_white);
}