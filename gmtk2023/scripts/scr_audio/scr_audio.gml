


function sfx_play(snd,loops=false,gain=1,pitrange=0) {
	audio_play_sound(snd,0,loops,gain,,random_range(1-pitrange,1+pitrange));
}
function music_play(mus,loops=true,gain=1) {
	global.music = audio_play_sound(mus,10,loops,gain*global.domusic);
}
function music_stop() {
	if audio_is_playing(global.music) {
		audio_stop_sound(global.music);
	}
	global.music = -1;
}


