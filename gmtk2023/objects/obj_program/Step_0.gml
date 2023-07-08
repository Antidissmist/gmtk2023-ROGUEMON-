

if keyboard_check_pressed(ord("R")) {
	game_restart();
}

if keyboard_check(vk_space) {
	if path_exists(path) {
		path_delete(path);
	}
	path = field_raycast_path(mouse_x,mouse_y,0);
}