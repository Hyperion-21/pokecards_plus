function sc_card_cost_check(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8) {
/// @param usable_oran
/// @param usable_leppa
/// @param usable_lum
/// @param usable_enigma
/// @param cost_oran
/// @param cost_leppa
/// @param cost_lum
/// @param cost_enigma
/// @param return_used_berries
//————————————————————————————————————————————————————————————————————————————————————————————————————
var usable_oran=argument0, usable_leppa=argument1, usable_lum=argument2, usable_enigma=argument3;
var cost_oran=argument4, cost_leppa=argument5, cost_lum=argument6, cost_enigma=argument7;
var consumed_oran=0, consumed_leppa=0, consumed_lum=0, consumed_enigma=0;
//————————————————————————————————————————————————————————————————————————————————————————————————————
if cost_enigma<=usable_enigma {
	consumed_enigma+=cost_enigma;
	usable_enigma-=cost_enigma;
	cost_enigma=0;
}
else {
	consumed_enigma+=usable_enigma;
	cost_enigma-=usable_enigma;
	usable_enigma=0;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if cost_oran<=usable_oran {
	consumed_oran+=cost_oran;
	usable_oran-=cost_oran;
	cost_oran=0;
}
else {
	consumed_oran+=usable_oran;
	cost_oran-=usable_oran;
	usable_oran=0;
}
//
if cost_oran>0 and usable_enigma>0 {
	if cost_oran<=usable_enigma {
		consumed_enigma+=cost_oran;
		usable_enigma-=cost_oran;
		cost_oran=0;
	}
	else {
		consumed_enigma+=usable_enigma;
		cost_oran-=usable_enigma;
		usable_enigma=0;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if cost_leppa<=usable_leppa {
	consumed_leppa+=cost_leppa;
	usable_leppa-=cost_leppa;
	cost_leppa=0;
}
else {
	consumed_leppa+=usable_leppa;
	cost_leppa-=usable_leppa;
	usable_leppa=0;
}
//
if cost_leppa>0 and usable_enigma>0 {
	if cost_leppa<=usable_enigma {
		consumed_enigma+=cost_leppa;
		usable_enigma-=cost_leppa;
		cost_leppa=0;
	}
	else {
		consumed_enigma+=usable_enigma;
		cost_leppa-=usable_enigma;
		usable_enigma=0;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if cost_lum<=usable_lum {
	consumed_lum+=cost_lum;
	usable_lum-=cost_lum;
	cost_lum=0;
}
else {
	consumed_lum+=usable_lum;
	cost_lum-=usable_lum;
	usable_lum=0;
}
//
if cost_lum>0 and usable_enigma>0 {
	if cost_lum<=usable_enigma {
		consumed_enigma+=cost_lum;
		usable_enigma-=cost_lum;
		cost_lum=0;
	}
	else {
		consumed_enigma+=usable_enigma;
		cost_lum-=usable_enigma;
		usable_enigma=0;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument8=-1 {
	if cost_oran=0 and cost_leppa=0 and cost_lum=0 and cost_enigma=0 { return true; }
	else { return false; }
}
else if argument8=0 { return consumed_oran; }
else if argument8=1 { return consumed_leppa; }
else if argument8=2 { return consumed_lum; }
else if argument8=3 { return consumed_enigma; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
}