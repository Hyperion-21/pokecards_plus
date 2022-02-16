function sc_keyrepcheck(argument0) {
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument0=global.k01 or
	argument0=global.k02 or
	argument0=global.k03 or
	argument0=global.k04 or
	argument0=global.k05 or
	argument0=global.k06 or
	argument0=global.k07 or
	argument0=global.k08 or
	argument0=global.k09 or
	argument0=global.kup or
	argument0=global.kdown or
	argument0=global.kleft or
	argument0=global.kright {
	return(true);
}
else {
	return(false);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}