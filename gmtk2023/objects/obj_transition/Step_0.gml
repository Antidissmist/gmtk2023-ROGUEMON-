





if stage==0 {
	timer++
	if timer>maxtime {
		onhalfway();
		room_goto(goesto);
		stage = 1;
	}
}
else {
	timer--
	if timer<=0 {
		onfinish();
		instance_destroy();
	}
}


