

dc(col);
var sc = 1.75


var dx = x + random_range(-shake,shake);
var dy = lerp(ybottom,ytop,amt) + random_range(-shake,shake);

dtext_center_outlined(dx,dy,text,sc);
dtext_center_outlined(dx,dy+20,text2,sc/3);
dc(c_white);

shake = lerp(shake,0,.2);