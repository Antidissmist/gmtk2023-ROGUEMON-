
with obj_transition {
	if id!=other.id {
		instance_destroy();
	}
}

if room==rm_battle {
	drawingseq = true;
	seqlay = layer_create(-9999);
	seq = layer_sequence_create(seqlay,room_width/2,room_height/2,seq_battleopen);
}

