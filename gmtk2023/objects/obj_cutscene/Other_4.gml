

var sp = global.cutscenesprite;
if sp==sp_introscene {
	music_play(mus_intro);
}
else if sp==sp_scene_badge {
	music_play(mus_eternal,false);
}
else if sp==sp_scene_died {
	music_play(mus_beatup,false);
}
else if sp==sp_scene_unapproved {
	music_play(mus_upload,false);
}
else if sp==sp_scene_win {
	music_play(mus_won,false);
}
