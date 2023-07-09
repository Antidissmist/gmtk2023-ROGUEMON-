



x = xstart+sin(current_time/800)*6;
y = ystart+sin(current_time/650+246)*6;

image_angle = sin(current_time/1000+408)*8;



if keyboard_check_pressed(vk_anykey) {
	transition_cutscene(sp_introscene,STARTROOM);
}



