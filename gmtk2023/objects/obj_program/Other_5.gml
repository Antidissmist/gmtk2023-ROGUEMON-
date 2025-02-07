

part_system_clear(ps);



music_stop();

if room==rm_over1 {
	global.overworld_mustime = 0;
	if audio_exists(global.music) {
		global.overworld_mustime = audio_sound_get_track_position(global.music);
	}
}