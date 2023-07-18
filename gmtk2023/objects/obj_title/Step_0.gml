



x = xstart+sin(current_time/800)*6;
y = ystart+sin(current_time/650+246)*6;

image_angle = sin(current_time/1000+408)*8;



if anykey_pressed() {
	transition_cutscene(sp_introscene,STARTROOM);
}



