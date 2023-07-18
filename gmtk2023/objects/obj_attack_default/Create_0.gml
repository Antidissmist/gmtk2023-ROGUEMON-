


moveable_setup();

from = noone;
fromorig = noone;
hitdmg = 1;

factor = 4.5;
path = -1;
first = true;

start = function() {
	spd *= factor;
}

faceangle = false;

objhit = {};



onmiss = function() {
	if fromorig==obj_monster_battle.id {
		approval_adjust("miss");
		if !struct_get(THINGSDONE,"defymove",false) && !struct_get(THINGSDONE,"hitenemy",false) {
			notice("miss","approval down",col_red);
		}
	}
}