

//goesto = room;
//startperc=0
maxtime = 30;
timer = maxtime*startperc;



onhalfway = do_nothing;
onfinish = do_nothing;


finished = false;
stage = 0;
drawingseq = false;
seqlay = -1;
seq = -1;


if timer>=maxtime/2 {
	stage = 1;
}