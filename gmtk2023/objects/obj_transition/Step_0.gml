

var skiplol = (global.debug && keyboard_check(ord("P")));


if !finished {
	if stage==0 {
		timer += spdfac;
		if timer>maxtime || skiplol {
			onhalfway();
			if goesto!=-1 {
				room_goto(goesto);
			}
			stage = 1;
			timer = maxtime;
		}
	}
	else {
		timer--
		if timer<=0 || skiplol {
			onfinish();
			finished = true;
			if !drawingseq {
				instance_destroy();
			}
		}
	}
}
else if drawingseq {
	if layer_sequence_exists(seqlay,seq) {
		if layer_sequence_is_finished(seq) || skiplol {
			layer_sequence_destroy(seq);
			instance_destroy();
		}
	}
	else {
		instance_destroy();
	}
}
