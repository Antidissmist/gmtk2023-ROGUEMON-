

draw_self();

var col = c_white;

if ATTACK_TOLDNAME!="" {
	if drawname==ATTACK_TOLDNAME {
		col = #00e436;
	}
	else {
		col = #ff004d;
	}
}


dc(col);
dtext_centered(bbox_midx,bbox_midy,displayname,textscale);
dc(c_white);

