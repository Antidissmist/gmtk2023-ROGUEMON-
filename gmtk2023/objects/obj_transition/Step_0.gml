




if !finished {
	if stage==0 {
		timer += spdfac;
		if timer>maxtime {
			onhalfway();
			if goesto!=-1 {
				room_goto(goesto);
			}
			stage = 1;
		}
	}
	else {
		timer--
		if timer<=0 {
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
		if layer_sequence_is_finished(seq) {
			layer_sequence_destroy(seq);
			instance_destroy();
		}
	}
	else {
		instance_destroy();
	}
}
