///@desc setup battle




var n=0;
var spc = 26;

var names = variable_struct_get_names(obj_monster_battle.attacks);
var len = alen(names);
for(var i=0; i<len; i++) {
	with instance_create_depth(0,n++*spc,0,obj_menuoption) {
		type = names[i];
	}
}

