

draw_self();

var col = c_white;

if ATTACK_TOLDNAME!="" {
	if drawname==ATTACK_TOLDNAME {
		col = c_lime;
	}
	else {
		col = c_red;
	}
}


dc(col);
dtext_centered(bbox_midx,bbox_midy,drawname,.5);
dc(c_white);

