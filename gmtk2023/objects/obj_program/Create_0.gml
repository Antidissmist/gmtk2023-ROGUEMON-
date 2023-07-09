


inst_ensure_single



shake = 0;
tboxshake = 0;

_hpress = 0;
_vpress = 0;

speaktext = "bazinga!";


ps = part_system_create();
ps_top = part_system_create();
part_system_automatic_draw(ps_top,false);


bouncedata = {};

turntime = 60*5;
turntimer = turntime;

waiting = false;
waitchecktime = 30;
waitcheck = waitchecktime;



aimlines = [];
drawlines = function() {
	var len = alen(aimlines);
	for(var i=0; i<len; i++) {
		draw_path_dotted(aimlines[i],0,0);
	}
}
clearlines = function() {
	with obj_hittable {
		hitglow = false;
	}
	//memory leak lol
	//var len = alen(aimlines);
	//for(var i=0; i<len; i++) {
		//path_delete(aimlines[i]);
	//}
	aimlines = [];
}
