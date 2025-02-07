

audio_stop_all();

checkloaded = function() {
	
	if !audio_group_is_loaded(audiogroup_default) 
	|| !audio_system_is_available() {
		return;
	}
	
	room_goto(rm_title);
}
checkloaded();



