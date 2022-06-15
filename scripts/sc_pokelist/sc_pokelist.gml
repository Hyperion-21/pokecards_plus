function sc_pokelist() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
//00 normal, 01 grass, 02 fire, 03 water, 04 electric, 05 flying, 06 fighting, 07 psychic, 08 fairy
//09 ground, 10 rock, 11 bug, 12 poison, 13 ice, 14 dragon, 15 steel, 16 ghost, 17 dark
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_id<=386 { card_sheet=sp_poke_a; }
else if card_id<=2000 { card_sheet=sp_poke_b; }
else { card_sheet=sp_poke_c; }
var i=0;
repeat (8) {
	card_evo[i]=-1;
	i++;
}
//
card_enigma=false;
card_pseudo=false;
card_fossil=false;
card_starter=false;
//
card_secret=false;
card_environment=false;
//————————————————————————————————————————————————————————————————————————————————————————————————————
switch (card_id) {
	case 001:
		card_name="Bulbasaur";
		card_stage=1; card_evo[0]=002; card_starter=true;
		card_type_a=01; card_type_b=12;
		card_base_hp=45; card_base_atk=49+65; card_base_def=49+65;
		card_grid_x=1; card_grid_y=1; break;
	case 002:
		card_name="Ivysaur";
		card_stage=2; card_evo[0]=003; card_starter=true;
		card_type_a=01; card_type_b=12;
		card_base_hp=60; card_base_atk=62+80; card_base_def=63+80;
		card_grid_x=2; card_grid_y=1; break;
	case 003:
		card_name="Venusaur";
		card_stage=3; card_starter=true;
		card_type_a=01; card_type_b=12;
		card_base_hp=80; card_base_atk=82+100; card_base_def=83+100;
		card_grid_x=3; card_grid_y=1; break;
	case 004:
		card_name="Charmander";
		card_stage=1; card_evo[0]=005; card_starter=true;
		card_type_a=02; card_type_b=-1;
		card_base_hp=39; card_base_atk=52+60; card_base_def=43+50;
		card_grid_x=5; card_grid_y=1; break;
	case 005:
		card_name="Charmeleon";
		card_stage=2; card_evo[0]=006; card_starter=true;
		card_type_a=02; card_type_b=-1;
		card_base_hp=58; card_base_atk=64+80; card_base_def=58+65;
		card_grid_x=6; card_grid_y=1; break;
	case 006:
		card_name="Charizard";
		card_stage=3; card_starter=true;
		card_type_a=02; card_type_b=05;
		card_base_hp=78; card_base_atk=84+109; card_base_def=78+85;
		card_grid_x=7; card_grid_y=1; break;
	case 007:
		card_name="Squirtle";
		card_stage=1; card_evo[0]=008; card_starter=true;
		card_type_a=03; card_type_b=-1;
		card_base_hp=44; card_base_atk=48+50; card_base_def=65+64;
		card_grid_x=10; card_grid_y=1; break;
	case 008:
		card_name="Wartortle";
		card_stage=2; card_evo[0]=009; card_starter=true;
		card_type_a=03; card_type_b=-1;
		card_base_hp=59; card_base_atk=63+65; card_base_def=80+80;
		card_grid_x=11; card_grid_y=1; break;
	case 009:
		card_name="Blastoise";
		card_stage=3; card_starter=true;
		card_type_a=03; card_type_b=-1;
		card_base_hp=79; card_base_atk=83+85; card_base_def=100+105;
		card_grid_x=12; card_grid_y=1; break;
	case 010:
		card_name="Caterpie";
		card_stage=1; card_evo[0]=011;
		card_type_a=11; card_type_b=-1;
		card_base_hp=45; card_base_atk=30+20; card_base_def=35+20;
		card_grid_x=14; card_grid_y=1; break;
	case 011:
		card_name="Metapod";
		card_stage=2; card_evo[0]=012;
		card_type_a=11; card_type_b=-1;
		card_base_hp=50; card_base_atk=20+25; card_base_def=55+25;
		card_grid_x=15; card_grid_y=1; break;
	case 012:
		card_name="Butterfree";
		card_stage=3;
		card_type_a=11; card_type_b=05;
		card_base_hp=60; card_base_atk=45+90; card_base_def=50+80;
		card_grid_x=1; card_grid_y=2; break;
	case 013:
		card_name="Weedle";
		card_stage=1; card_evo[0]=014;
		card_type_a=11; card_type_b=12;
		card_base_hp=40; card_base_atk=35+20; card_base_def=30+20;
		card_grid_x=2; card_grid_y=2; break;
	case 014:
		card_name="Kakuna";
		card_stage=2; card_evo[0]=015;
		card_type_a=11; card_type_b=12;
		card_base_hp=45; card_base_atk=25+25; card_base_def=50+25;
		card_grid_x=3; card_grid_y=2; break;
	case 015:
		card_name="Beedrill";
		card_stage=3;
		card_type_a=11; card_type_b=12;
		card_base_hp=65; card_base_atk=90+45; card_base_def=40+80;
		card_grid_x=4; card_grid_y=2; break;
	case 016:
		card_name="Pidgey";
		card_stage=1; card_evo[0]=017;
		card_type_a=00; card_type_b=05;
		card_base_hp=40; card_base_atk=45+35; card_base_def=40+35;
		card_grid_x=6; card_grid_y=2; break;
	case 017:
		card_name="Pidgeotto";
		card_stage=2; card_evo[0]=018;
		card_type_a=00; card_type_b=05;
		card_base_hp=63; card_base_atk=60+50; card_base_def=55+50;
		card_grid_x=7; card_grid_y=2; break;
	case 018:
		card_name="Pidgeot";
		card_stage=3;
		card_type_a=00; card_type_b=05;
		card_base_hp=83; card_base_atk=80+70; card_base_def=75+70;
		card_grid_x=8; card_grid_y=2; break;
	case 019:
		card_name="Rattata";
		card_stage=1; card_evo[0]=020;
		card_type_a=00; card_type_b=-1;
		card_base_hp=30; card_base_atk=56+25; card_base_def=35+35;
		card_grid_x=10; card_grid_y=2; break;
	case 020:
		card_name="Raticate";
		card_stage=2;
		card_type_a=00; card_type_b=-1;
		card_base_hp=55; card_base_atk=81+50; card_base_def=60+70;
		card_grid_x=12; card_grid_y=2; break;
	case 021:
		card_name="Spearow";
		card_stage=1; card_evo[0]=022;
		card_type_a=00; card_type_b=05;
		card_base_hp=40; card_base_atk=60+31; card_base_def=30+31;
		card_grid_x=14; card_grid_y=2; break;
	case 022:
		card_name="Fearow";
		card_stage=2;
		card_type_a=00; card_type_b=05;
		card_base_hp=65; card_base_atk=90+61; card_base_def=65+61;
		card_grid_x=15; card_grid_y=2; break;
	case 023:
		card_name="Ekans";
		card_stage=1; card_evo[0]=024;
		card_type_a=12; card_type_b=-1;
		card_base_hp=35; card_base_atk=60+40; card_base_def=44+54;
		card_grid_x=1; card_grid_y=3; break;
	case 024:
		card_name="Arbok";
		card_stage=2;
		card_type_a=12; card_type_b=-1;
		card_base_hp=60; card_base_atk=95+65; card_base_def=69+79;
		card_grid_x=2; card_grid_y=3; break;
	case 025:
		card_name="Pikachu";
		card_stage=1; card_evo[0]=026;
		card_type_a=04; card_type_b=-1;
		card_base_hp=35; card_base_atk=55+50; card_base_def=40+50;
		card_grid_x=3; card_grid_y=3; break;
	case 026:
		card_name="Raichu";
		card_stage=2;
		card_type_a=04; card_type_b=-1;
		card_base_hp=60; card_base_atk=90+90; card_base_def=55+80;
		card_grid_x=13; card_grid_y=3; break;
	case 027:
		card_name="Sandshrew";
		card_stage=1; card_evo[0]=028;
		card_type_a=09; card_type_b=-1;
		card_base_hp=50; card_base_atk=75+20; card_base_def=85+30;
		card_grid_x=15; card_grid_y=3; break;
	case 028:
		card_name="Sandslash";
		card_stage=2;
		card_type_a=09; card_type_b=-1;
		card_base_hp=75; card_base_atk=100+45; card_base_def=110+55;
		card_grid_x=2; card_grid_y=4; break;
	case 029:
		card_name="Nidoran F";
		card_stage=1; card_evo[0]=030;
		card_type_a=12; card_type_b=-1;
		card_base_hp=55; card_base_atk=47+40; card_base_def=52+40;
		card_grid_x=4; card_grid_y=4; break;
	case 030:
		card_name="Nidorina";
		card_stage=2; card_evo[0]=031;
		card_type_a=12; card_type_b=-1;
		card_base_hp=70; card_base_atk=62+55; card_base_def=67+55;
		card_grid_x=5; card_grid_y=4; break;
	case 031:
		card_name="Nidoqueen";
		card_stage=3;
		card_type_a=12; card_type_b=09;
		card_base_hp=90; card_base_atk=92+75; card_base_def=87+85;
		card_grid_x=6; card_grid_y=4; break;
	case 032:
		card_name="Nidoran M";
		card_stage=1; card_evo[0]=033;
		card_type_a=12; card_type_b=-1;
		card_base_hp=46; card_base_atk=57+40; card_base_def=40+40;
		card_grid_x=7; card_grid_y=4; break;
	case 033:
		card_name="Nidorino";
		card_stage=2; card_evo[0]=034;
		card_type_a=12; card_type_b=-1;
		card_base_hp=61; card_base_atk=72+55; card_base_def=57+55;
		card_grid_x=8; card_grid_y=4; break;
	case 034:
		card_name="Nidoking";
		card_stage=3;
		card_type_a=12; card_type_b=09;
		card_base_hp=81; card_base_atk=102+85; card_base_def=77+75;
		card_grid_x=9; card_grid_y=4; break;
	case 035:
		card_name="Clefairy";
		card_stage=1; card_evo[0]=036;
		card_type_a=08; card_type_b=-1;
		card_base_hp=70; card_base_atk=45+60; card_base_def=48+65;
		card_grid_x=10; card_grid_y=4; break;
	case 036:
		card_name="Clefable";
		card_stage=2;
		card_type_a=08; card_type_b=-1;
		card_base_hp=95; card_base_atk=70+95; card_base_def=73+90;
		card_grid_x=12; card_grid_y=4; break;
	case 037:
		card_name="Vulpix";
		card_stage=1; card_evo[0]=038;
		card_type_a=02; card_type_b=-1;
		card_base_hp=38; card_base_atk=41+50; card_base_def=40+65;
		card_grid_x=14; card_grid_y=4; break;
	case 038:
		card_name="Ninetales";
		card_stage=2;
		card_type_a=02; card_type_b=-1;
		card_base_hp=73; card_base_atk=76+81; card_base_def=75+100;
		card_grid_x=1; card_grid_y=5; break;
	case 039:
		card_name="Jigglypuff";
		card_stage=1; card_evo[0]=040;
		card_type_a=00; card_type_b=08;
		card_base_hp=115; card_base_atk=45+45; card_base_def=20+25;
		card_grid_x=3; card_grid_y=5; break;
	case 040:
		card_name="Wigglytuff";
		card_stage=2;
		card_type_a=00; card_type_b=08;
		card_base_hp=140; card_base_atk=70+85; card_base_def=45+50;
		card_grid_x=5; card_grid_y=5; break;
	case 041:
		card_name="Zubat";
		card_stage=1; card_evo[0]=042;
		card_type_a=12; card_type_b=05;
		card_base_hp=40; card_base_atk=45+30; card_base_def=35+40;
		card_grid_x=7; card_grid_y=5; break;
	case 042:
		card_name="Golbat";
		card_stage=2; card_evo[0]=169;
		card_type_a=12; card_type_b=05;
		card_base_hp=75; card_base_atk=80+65; card_base_def=70+75;
		card_grid_x=8; card_grid_y=5; break;
	case 043:
		card_name="Oddish";
		card_stage=1; card_evo[0]=044;
		card_type_a=01; card_type_b=12;
		card_base_hp=45; card_base_atk=50+75; card_base_def=55+65;
		card_grid_x=9; card_grid_y=5; break;
	case 044:
		card_name="Gloom";
		card_stage=2; card_evo[0]=045; card_evo[1]=182;
		card_type_a=01; card_type_b=12;
		card_base_hp=60; card_base_atk=65+85; card_base_def=70+75;
		card_grid_x=10; card_grid_y=5; break;
	case 045:
		card_name="Vileplume";
		card_stage=3;
		card_type_a=01; card_type_b=12;
		card_base_hp=75; card_base_atk=80+110; card_base_def=85+90;
		card_grid_x=11; card_grid_y=5; break;
	case 046:
		card_name="Paras";
		card_stage=1; card_evo[0]=047;
		card_type_a=11; card_type_b=01;
		card_base_hp=35; card_base_atk=70+45; card_base_def=55+55;
		card_grid_x=12; card_grid_y=5; break;
	case 047:
		card_name="Parasect";
		card_stage=2;
		card_type_a=11; card_type_b=01;
		card_base_hp=60; card_base_atk=95+60; card_base_def=80+80;
		card_grid_x=13; card_grid_y=5; break;
	case 048:
		card_name="Venonat";
		card_stage=1; card_evo[0]=049;
		card_type_a=11; card_type_b=12;
		card_base_hp=60; card_base_atk=55+40; card_base_def=50+55;
		card_grid_x=14; card_grid_y=5; break;
	case 049:
		card_name="Venomoth";
		card_stage=2;
		card_type_a=11; card_type_b=12;
		card_base_hp=70; card_base_atk=65+90; card_base_def=60+75;
		card_grid_x=15; card_grid_y=5; break;
	case 050:
		card_name="Diglett";
		card_stage=1; card_evo[0]=051;
		card_type_a=09; card_type_b=-1;
		card_base_hp=10; card_base_atk=55+35; card_base_def=25+45;
		card_grid_x=1; card_grid_y=6; break;
	case 051:
		card_name="Dugtrio";
		card_stage=2;
		card_type_a=09; card_type_b=-1;
		card_base_hp=35; card_base_atk=100+50; card_base_def=50+70;
		card_grid_x=3; card_grid_y=6; break;
	case 052:
		card_name="Meowth";
		card_stage=1; card_evo[0]=053;
		card_type_a=00; card_type_b=-1;
		card_base_hp=40; card_base_atk=45+40; card_base_def=35+40;
		card_grid_x=6; card_grid_y=6; break;
	case 053:
		card_name="Persian";
		card_stage=2;
		card_type_a=00; card_type_b=-1;
		card_base_hp=65; card_base_atk=70+65; card_base_def=60+65;
		card_grid_x=8; card_grid_y=6; break;
	case 054:
		card_name="Psyduck";
		card_stage=1; card_evo[0]=055;
		card_type_a=03; card_type_b=-1;
		card_base_hp=50; card_base_atk=52+65; card_base_def=48+50;
		card_grid_x=10; card_grid_y=6; break;
	case 055:
		card_name="Golduck";
		card_stage=2;
		card_type_a=03; card_type_b=-1;
		card_base_hp=80; card_base_atk=82+95; card_base_def=78+80;
		card_grid_x=11; card_grid_y=6; break;
	case 056:
		card_name="Mankey";
		card_stage=1; card_evo[0]=057;
		card_type_a=06; card_type_b=-1;
		card_base_hp=40; card_base_atk=80+35; card_base_def=35+45;
		card_grid_x=12; card_grid_y=6; break;
	case 057:
		card_name="Primeape";
		card_stage=2;
		card_type_a=06; card_type_b=-1;
		card_base_hp=65; card_base_atk=105+60; card_base_def=60+70;
		card_grid_x=13; card_grid_y=6; break;
	case 058:
		card_name="Growlithe";
		card_stage=1; card_evo[0]=059;
		card_type_a=02; card_type_b=-1;
		card_base_hp=55; card_base_atk=70+70; card_base_def=45+50;
		card_grid_x=14; card_grid_y=6; break;
	case 059:
		card_name="Arcanine";
		card_stage=2;
		card_type_a=02; card_type_b=-1;
		card_base_hp=90; card_base_atk=110+100; card_base_def=80+80;
		card_grid_x=15; card_grid_y=6; break;
	case 060:
		card_name="Poliwag";
		card_stage=1; card_evo[0]=061;
		card_type_a=03; card_type_b=-1;
		card_base_hp=40; card_base_atk=50+40; card_base_def=40+40;
		card_grid_x=1; card_grid_y=7; break;
	case 061:
		card_name="Poliwhirl";
		card_stage=2; card_evo[0]=062; card_evo[1]=186;
		card_type_a=03; card_type_b=-1;
		card_base_hp=65; card_base_atk=65+50; card_base_def=65+50;
		card_grid_x=2; card_grid_y=7; break;
	case 062:
		card_name="Poliwrath";
		card_stage=3;
		card_type_a=03; card_type_b=06;
		card_base_hp=90; card_base_atk=95+70; card_base_def=95+90;
		card_grid_x=4; card_grid_y=7; break;
	case 063:
		card_name="Abra";
		card_stage=1; card_evo[0]=064;
		card_type_a=07; card_type_b=-1;
		card_base_hp=25; card_base_atk=20+105; card_base_def=15+55;
		card_grid_x=6; card_grid_y=7; break;
	case 064:
		card_name="Kadabra";
		card_stage=2; card_evo[0]=065;
		card_type_a=07; card_type_b=-1;
		card_base_hp=40; card_base_atk=35+120; card_base_def=30+70;
		card_grid_x=7; card_grid_y=7; break;
	case 065:
		card_name="Alakazam";
		card_stage=3;
		card_type_a=07; card_type_b=-1;
		card_base_hp=55; card_base_atk=50+135; card_base_def=45+95;
		card_grid_x=8; card_grid_y=7; break;
	case 066:
		card_name="Machop";
		card_stage=1; card_evo[0]=067;
		card_type_a=06; card_type_b=-1;
		card_base_hp=70; card_base_atk=80+35; card_base_def=50+35;
		card_grid_x=10; card_grid_y=7; break;
	case 067:
		card_name="Machoke";
		card_stage=2; card_evo[0]=068;
		card_type_a=06; card_type_b=-1;
		card_base_hp=80; card_base_atk=100+50; card_base_def=70+60;
		card_grid_x=11; card_grid_y=7; break;
	case 068:
		card_name="Machamp";
		card_stage=3;
		card_type_a=06; card_type_b=-1;
		card_base_hp=90; card_base_atk=130+65; card_base_def=80+85;
		card_grid_x=12; card_grid_y=7; break;
	case 069:
		card_name="Bellsprout";
		card_stage=1; card_evo[0]=070;
		card_type_a=01; card_type_b=12;
		card_base_hp=50; card_base_atk=75+70; card_base_def=35+30;
		card_grid_x=13; card_grid_y=7; break;
	case 070:
		card_name="Weepinbell";
		card_stage=2; card_evo[0]=071;
		card_type_a=01; card_type_b=12;
		card_base_hp=65; card_base_atk=90+85; card_base_def=50+45;
		card_grid_x=14; card_grid_y=7; break;
	case 071:
		card_name="Victreebel";
		card_stage=3;
		card_type_a=01; card_type_b=12;
		card_base_hp=80; card_base_atk=105+100; card_base_def=65+70;
		card_grid_x=15; card_grid_y=7; break;
	case 072:
		card_name="Tentacool";
		card_stage=1; card_evo[0]=073;
		card_type_a=03; card_type_b=12;
		card_base_hp=40; card_base_atk=40+50; card_base_def=35+100;
		card_grid_x=1; card_grid_y=8; break;
	case 073:
		card_name="Tentacruel";
		card_stage=2;
		card_type_a=03; card_type_b=12;
		card_base_hp=80; card_base_atk=70+80; card_base_def=65+120;
		card_grid_x=2; card_grid_y=8; break;
	case 074:
		card_name="Geodude";
		card_stage=1; card_evo[0]=075;
		card_type_a=10; card_type_b=09;
		card_base_hp=40; card_base_atk=80+30; card_base_def=100+30;
		card_grid_x=3; card_grid_y=8; break;
	case 075:
		card_name="Graveler";
		card_stage=2; card_evo[0]=076;
		card_type_a=10; card_type_b=09;
		card_base_hp=55; card_base_atk=95+45; card_base_def=115+45;
		card_grid_x=5; card_grid_y=8; break;
	case 076:
		card_name="Golem";
		card_stage=3;
		card_type_a=10; card_type_b=09;
		card_base_hp=80; card_base_atk=120+55; card_base_def=130+65;
		card_grid_x=7; card_grid_y=8; break;
	case 077:
		card_name="Ponyta";
		card_stage=1; card_evo[0]=078;
		card_type_a=02; card_type_b=-1;
		card_base_hp=50; card_base_atk=85+65; card_base_def=55+65;
		card_grid_x=9; card_grid_y=8; break;
	case 078:
		card_name="Rapidash";
		card_stage=2;
		card_type_a=02; card_type_b=-1;
		card_base_hp=65; card_base_atk=100+80; card_base_def=70+80;
		card_grid_x=10; card_grid_y=8; break;
	case 079:
		card_name="Slowpoke";
		card_stage=1; card_evo[0]=080; card_evo[1]=199;
		card_type_a=03; card_type_b=07;
		card_base_hp=90; card_base_atk=65+40; card_base_def=65+40;
		card_grid_x=11; card_grid_y=8; break;
	case 080:
		card_name="Slowbro";
		card_stage=2;
		card_type_a=03; card_type_b=07;
		card_base_hp=95; card_base_atk=75+100; card_base_def=110+80;
		card_grid_x=12; card_grid_y=8; break;
	case 081:
		card_name="Magnemite";
		card_stage=1; card_evo[0]=082;
		card_type_a=04; card_type_b=15;
		card_base_hp=23; card_base_atk=35+95; card_base_def=70+55;
		card_grid_x=14; card_grid_y=8; break;
	case 082:
		card_name="Magneton";
		card_stage=2; card_evo[0]=462;
		card_type_a=04; card_type_b=15;
		card_base_hp=50; card_base_atk=60+120; card_base_def=95+70;
		card_grid_x=15; card_grid_y=8; break;
	case 083:
		card_name="Farfetch'd";
		card_stage=1; card_evo[0]=865;
		card_type_a=00; card_type_b=05;
		card_base_hp=52; card_base_atk=90+58; card_base_def=55+62;
		card_grid_x=1; card_grid_y=9; break;
	case 084:
		card_name="Doduo";
		card_stage=1; card_evo[0]=085;
		card_type_a=00; card_type_b=05;
		card_base_hp=35; card_base_atk=85+35; card_base_def=45+35;
		card_grid_x=2; card_grid_y=9; break;
	case 085:
		card_name="Dodrio";
		card_stage=2;
		card_type_a=00; card_type_b=05;
		card_base_hp=60; card_base_atk=110+60; card_base_def=70+60;
		card_grid_x=3; card_grid_y=9; break;
	case 086:
		card_name="Seel";
		card_stage=1; card_evo[0]=087;
		card_type_a=03; card_type_b=-1;
		card_base_hp=65; card_base_atk=45+45; card_base_def=55+70;
		card_grid_x=4; card_grid_y=9; break;
	case 087:
		card_name="Dewgong";
		card_stage=2;
		card_type_a=03; card_type_b=13;
		card_base_hp=90; card_base_atk=70+70; card_base_def=80+95;
		card_grid_x=5; card_grid_y=9; break;
	case 088:
		card_name="Grimer";
		card_stage=1; card_evo[0]=089;
		card_type_a=12; card_type_b=-1;
		card_base_hp=80; card_base_atk=80+40; card_base_def=50+50;
		card_grid_x=6; card_grid_y=9; break;
	case 089:
		card_name="Muk";
		card_stage=2;
		card_type_a=12; card_type_b=-1;
		card_base_hp=105; card_base_atk=105+65; card_base_def=75+100;
		card_grid_x=8; card_grid_y=9; break;
	case 090:
		card_name="Shellder";
		card_stage=1; card_evo[0]=091;
		card_type_a=03; card_type_b=-1;
		card_base_hp=30; card_base_atk=65+45; card_base_def=100+25;
		card_grid_x=11; card_grid_y=9; break;
	case 091:
		card_name="Cloyster";
		card_stage=2;
		card_type_a=03; card_type_b=13;
		card_base_hp=50; card_base_atk=95+85; card_base_def=180+45;
		card_grid_x=12; card_grid_y=9; break;
	case 092:
		card_name="Gastly";
		card_stage=1; card_evo[0]=093;
		card_type_a=16; card_type_b=12;
		card_base_hp=30; card_base_atk=35+100; card_base_def=30+35;
		card_grid_x=13; card_grid_y=9; break;
	case 093:
		card_name="Haunter";
		card_stage=2; card_evo[0]=094;
		card_type_a=16; card_type_b=12;
		card_base_hp=45; card_base_atk=50+115; card_base_def=45+55;
		card_grid_x=14; card_grid_y=9; break;
	case 094:
		card_name="Gengar";
		card_stage=3;
		card_type_a=16; card_type_b=12;
		card_base_hp=60; card_base_atk=65+130; card_base_def=60+75;
		card_grid_x=15; card_grid_y=9; break;
	case 095:
		card_name="Onix";
		card_stage=1; card_evo[0]=208;
		card_type_a=10; card_type_b=09;
		card_base_hp=35; card_base_atk=45+30; card_base_def=160+45;
		card_grid_x=2; card_grid_y=10; break;
	case 096:
		card_name="Drowzee";
		card_stage=1; card_evo[0]=097;
		card_type_a=07; card_type_b=-1;
		card_base_hp=60; card_base_atk=48+43; card_base_def=45+90;
		card_grid_x=3; card_grid_y=10; break;
	case 097:
		card_name="Hypno";
		card_stage=2;
		card_type_a=07; card_type_b=-1;
		card_base_hp=85; card_base_atk=73+73; card_base_def=70+115;
		card_grid_x=4; card_grid_y=10; break;
	case 098:
		card_name="Krabby";
		card_stage=1; card_evo[0]=099;
		card_type_a=03; card_type_b=-1;
		card_base_hp=30; card_base_atk=105+25; card_base_def=90+25;
		card_grid_x=5; card_grid_y=10; break;
	case 099:
		card_name="Kingler";
		card_stage=2;
		card_type_a=03; card_type_b=-1;
		card_base_hp=55; card_base_atk=130+50; card_base_def=115+50;
		card_grid_x=6; card_grid_y=10; break;
	case 100:
		card_name="Voltorb";
		card_stage=1; card_evo[0]=101;
		card_type_a=04; card_type_b=-1;
		card_base_hp=40; card_base_atk=30+55; card_base_def=50+55;
		card_grid_x=8; card_grid_y=10; break;
	case 101:
		card_name="Electrode";
		card_stage=2;
		card_type_a=04; card_type_b=-1;
		card_base_hp=60; card_base_atk=50+80; card_base_def=70+80;
		card_grid_x=9; card_grid_y=10; break;
	case 102:
		card_name="Exeggcute";
		card_stage=1; card_evo[0]=103;
		card_type_a=01; card_type_b=07;
		card_base_hp=60; card_base_atk=40+60; card_base_def=80+45;
		card_grid_x=10; card_grid_y=10; break;
	case 103:
		card_name="Exeggutor";
		card_stage=2;
		card_type_a=01; card_type_b=07;
		card_base_hp=95; card_base_atk=95+125; card_base_def=85+75;
		card_grid_x=11; card_grid_y=10; break;
	case 104:
		card_name="Cubone";
		card_stage=1; card_evo[0]=105;
		card_type_a=09; card_type_b=-1;
		card_base_hp=50; card_base_atk=50+40; card_base_def=95+50;
		card_grid_x=13; card_grid_y=10; break;
	case 105:
		card_name="Marowak";
		card_stage=2;
		card_type_a=09; card_type_b=-1;
		card_base_hp=60; card_base_atk=80+50; card_base_def=110+80;
		card_grid_x=14; card_grid_y=10; break;
	case 106:
		card_name="Hitmonlee";
		card_stage=1;
		card_type_a=06; card_type_b=-1;
		card_base_hp=50; card_base_atk=120+35; card_base_def=53+110;
		card_grid_x=1; card_grid_y=11; break;
	case 107:
		card_name="Hitmonchan";
		card_stage=1;
		card_type_a=06; card_type_b=-1;
		card_base_hp=50; card_base_atk=105+35; card_base_def=79+110;
		card_grid_x=2; card_grid_y=11; break;
	case 108:
		card_name="Lickitung";
		card_stage=1; card_evo[0]=463;
		card_type_a=00; card_type_b=-1;
		card_base_hp=90; card_base_atk=55+60; card_base_def=75+75;
		card_grid_x=3; card_grid_y=11; break;
	case 109:
		card_name="Koffing";
		card_stage=1; card_evo[0]=110;
		card_type_a=12; card_type_b=-1;
		card_base_hp=40; card_base_atk=65+60; card_base_def=95+45;
		card_grid_x=4; card_grid_y=11; break;
	case 110:
		card_name="Weezing";
		card_stage=2;
		card_type_a=12; card_type_b=-1;
		card_base_hp=65; card_base_atk=90+85; card_base_def=120+70;
		card_grid_x=5; card_grid_y=11; break;
	case 111:
		card_name="Rhyhorn";
		card_stage=1; card_evo[0]=112;
		card_type_a=09; card_type_b=10;
		card_base_hp=80; card_base_atk=85+30; card_base_def=95+30;
		card_grid_x=6; card_grid_y=11; break;
	case 112:
		card_name="Rhydon";
		card_stage=2; card_evo[0]=464;
		card_type_a=09; card_type_b=10;
		card_base_hp=105; card_base_atk=130+45; card_base_def=120+45;
		card_grid_x=7; card_grid_y=11; break;
	case 113:
		card_name="Chansey";
		card_stage=1; card_evo[0]=242;
		card_type_a=00; card_type_b=-1;
		card_base_hp=250; card_base_atk=5+35; card_base_def=5+105;
		card_grid_x=8; card_grid_y=11; break;
	case 114:
		card_name="Tangela";
		card_stage=1; card_evo[0]=465;
		card_type_a=01; card_type_b=-1;
		card_base_hp=65; card_base_atk=55+100; card_base_def=115+40;
		card_grid_x=9; card_grid_y=11; break;
	case 115:
		card_name="Kangaskhan";
		card_stage=1;
		card_type_a=00; card_type_b=-1;
		card_base_hp=105; card_base_atk=95+40; card_base_def=80+80;
		card_grid_x=10; card_grid_y=11; break;
	case 116:
		card_name="Horsea";
		card_stage=1; card_evo[0]=117;
		card_type_a=03; card_type_b=-1;
		card_base_hp=30; card_base_atk=40+70; card_base_def=70+25;
		card_grid_x=12; card_grid_y=11; break;
	case 117:
		card_name="Seadra";
		card_stage=2; card_evo[0]=230;
		card_type_a=03; card_type_b=-1;
		card_base_hp=55; card_base_atk=65+95; card_base_def=95+45;
		card_grid_x=13; card_grid_y=11; break;
	case 118:
		card_name="Goldeen";
		card_stage=1; card_evo[0]=119;
		card_type_a=03; card_type_b=-1;
		card_base_hp=45; card_base_atk=67+35; card_base_def=60+50;
		card_grid_x=14; card_grid_y=11; break;
	case 119:
		card_name="Seaking";
		card_stage=2;
		card_type_a=03; card_type_b=-1;
		card_base_hp=80; card_base_atk=92+65; card_base_def=65+80;
		card_grid_x=15; card_grid_y=11; break;
	case 120:
		card_name="Staryu";
		card_stage=1; card_evo[0]=121;
		card_type_a=03; card_type_b=-1;
		card_base_hp=30; card_base_atk=45+70; card_base_def=55+55;
		card_grid_x=1; card_grid_y=12; break;
	case 121:
		card_name="Starmie";
		card_stage=2;
		card_type_a=03; card_type_b=07;
		card_base_hp=60; card_base_atk=75+100; card_base_def=85+85;
		card_grid_x=2; card_grid_y=12; break;
	case 122:
		card_name="Mr. Mime";
		card_stage=1;
		card_type_a=07; card_type_b=08;
		card_base_hp=40; card_base_atk=45+100; card_base_def=65+120;
		card_grid_x=3; card_grid_y=12; break;
	case 123:
		card_name="Scyther";
		card_stage=1; card_evo[0]=212; card_evo[1]=900;
		card_type_a=11; card_type_b=05;
		card_base_hp=70; card_base_atk=110+55; card_base_def=80+80;
		card_grid_x=4; card_grid_y=12; break;
	case 124:
		card_name="Jynx";
		card_stage=1;
		card_type_a=13; card_type_b=07;
		card_base_hp=65; card_base_atk=50+115; card_base_def=35+95;
		card_grid_x=5; card_grid_y=12; break;
	case 125:
		card_name="Electabuzz";
		card_stage=1; card_evo[0]=466;
		card_type_a=04; card_type_b=-1;
		card_base_hp=65; card_base_atk=83+95; card_base_def=57+85;
		card_grid_x=6; card_grid_y=12; break;
	case 126:
		card_name="Magmar";
		card_stage=1; card_evo[0]=467;
		card_type_a=02; card_type_b=-1;
		card_base_hp=65; card_base_atk=95+100; card_base_def=57+85;
		card_grid_x=7; card_grid_y=12; break;
	case 127:
		card_name="Pinsir";
		card_stage=1;
		card_type_a=11; card_type_b=-1;
		card_base_hp=65; card_base_atk=125+55; card_base_def=100+70;
		card_grid_x=8; card_grid_y=12; break;
	case 128:
		card_name="Tauros";
		card_stage=1;
		card_type_a=00; card_type_b=-1;
		card_base_hp=75; card_base_atk=100+40; card_base_def=95+70;
		card_grid_x=10; card_grid_y=12; break;
	case 129:
		card_name="Magikarp";
		card_stage=1; card_evo[0]=130;
		card_type_a=03; card_type_b=-1;
		card_base_hp=20; card_base_atk=10+15; card_base_def=55+20;
		card_grid_x=11; card_grid_y=12; break;
	case 130:
		card_name="Gyarados";
		card_stage=2;
		card_type_a=03; card_type_b=05;
		card_base_hp=95; card_base_atk=125+60; card_base_def=79+100;
		card_grid_x=12; card_grid_y=12; break;
	case 131:
		card_name="Lapras";
		card_stage=1;
		card_type_a=03; card_type_b=13;
		card_base_hp=130; card_base_atk=85+85; card_base_def=80+95;
		card_grid_x=14; card_grid_y=12; break;
	case 132:
		card_name="Ditto";
		card_stage=1;
		card_type_a=00; card_type_b=-1;
		card_base_hp=48; card_base_atk=48+48; card_base_def=48+48;
		card_grid_x=15; card_grid_y=12; break;
	case 133:
		card_name="Eevee";
		card_stage=1; card_evo[0]=134; card_evo[1]=135; card_evo[2]=136; card_evo[3]=196; card_evo[4]=197; card_evo[5]=470; card_evo[6]=471; card_evo[7]=700;
		card_type_a=00; card_type_b=-1;
		card_base_hp=55; card_base_atk=55+45; card_base_def=50+65;
		card_grid_x=1; card_grid_y=13; break;
	case 134:
		card_name="Vaporeon";
		card_stage=2;
		card_type_a=03; card_type_b=-1;
		card_base_hp=130; card_base_atk=65+110; card_base_def=60+95;
		card_grid_x=2; card_grid_y=13; break;
	case 135:
		card_name="Jolteon";
		card_stage=2;
		card_type_a=04; card_type_b=-1;
		card_base_hp=65; card_base_atk=65+110; card_base_def=60+95;
		card_grid_x=3; card_grid_y=13; break;
	case 136:
		card_name="Flareon";
		card_stage=2;
		card_type_a=02; card_type_b=-1;
		card_base_hp=65; card_base_atk=130+95; card_base_def=60+110;
		card_grid_x=4; card_grid_y=13; break;
	case 137:
		card_name="Porygon";
		card_stage=1; card_evo[0]=233;
		card_type_a=00; card_type_b=-1;
		card_base_hp=65; card_base_atk=60+85; card_base_def=70+75;
		card_grid_x=5; card_grid_y=13; break;
	case 138:
		card_name="Omanyte";
		card_stage=1; card_evo[0]=139; card_fossil=true;
		card_type_a=10; card_type_b=03;
		card_base_hp=35; card_base_atk=40+90; card_base_def=100+55;
		card_grid_x=6; card_grid_y=13; break;
	case 139:
		card_name="Omastar";
		card_stage=2; card_fossil=true;
		card_type_a=10; card_type_b=03;
		card_base_hp=70; card_base_atk=60+115; card_base_def=125+70;
		card_grid_x=7; card_grid_y=13; break;
	case 140:
		card_name="Kabuto";
		card_stage=1; card_evo[0]=141; card_fossil=true;
		card_type_a=10; card_type_b=03;
		card_base_hp=30; card_base_atk=80+55; card_base_def=90+45;
		card_grid_x=8; card_grid_y=13; break;
	case 141:
		card_name="Kabutops";
		card_stage=2; card_fossil=true;
		card_type_a=10; card_type_b=03;
		card_base_hp=60; card_base_atk=115+65; card_base_def=105+70;
		card_grid_x=9; card_grid_y=13; break;
	case 142:
		card_name="Aerodactyl";
		card_stage=1; card_fossil=true;
		card_type_a=10; card_type_b=05;
		card_base_hp=80; card_base_atk=105+60; card_base_def=65+75;
		card_grid_x=10; card_grid_y=13; break;
	case 143:
		card_name="Snorlax";
		card_stage=1;
		card_type_a=00; card_type_b=-1;
		card_base_hp=160; card_base_atk=110+65; card_base_def=65+110;
		card_grid_x=12; card_grid_y=13; break;
	case 144:
		card_name="Articuno";
		card_stage=1; card_enigma=true;
		card_type_a=13; card_type_b=05;
		card_base_hp=90; card_base_atk=85+95; card_base_def=100+125;
		card_grid_x=13; card_grid_y=13; break;
	case 145:
		card_name="Zapdos";
		card_stage=1; card_enigma=true;
		card_type_a=04; card_type_b=05;
		card_base_hp=90; card_base_atk=90+125; card_base_def=85+90;
		card_grid_x=14; card_grid_y=13; break;
	case 146:
		card_name="Moltres";
		card_stage=1; card_enigma=true;
		card_type_a=02; card_type_b=05;
		card_base_hp=90; card_base_atk=100+125; card_base_def=90+85;
		card_grid_x=15; card_grid_y=13; break;
	case 147:
		card_name="Dratini";
		card_stage=1; card_evo[0]=148; card_pseudo=true;
		card_type_a=14; card_type_b=-1;
		card_base_hp=41; card_base_atk=64+50; card_base_def=45+50;
		card_grid_x=1; card_grid_y=14; break;
	case 148:
		card_name="Dragonair";
		card_stage=2; card_evo[0]=149; card_pseudo=true;
		card_type_a=14; card_type_b=-1;
		card_base_hp=61; card_base_atk=84+70; card_base_def=65+70;
		card_grid_x=2; card_grid_y=14; break;
	case 149:
		card_name="Dragonite";
		card_stage=3; card_pseudo=true;
		card_type_a=14; card_type_b=05;
		card_base_hp=91; card_base_atk=134+100; card_base_def=95+100;
		card_grid_x=3; card_grid_y=14; break;
	case 150:
		card_name="Mewtwo";
		card_stage=1; card_enigma=true;
		card_type_a=07; card_type_b=-1;
		card_base_hp=106; card_base_atk=110+154; card_base_def=90+90;
		card_grid_x=4; card_grid_y=14; break;
	case 151:
		card_name="Mew";
		card_stage=1; card_enigma=true;
		card_type_a=07; card_type_b=-1;
		card_base_hp=100; card_base_atk=100+100; card_base_def=100+100;
		card_grid_x=7; card_grid_y=14; break;
	case 152:
		card_name="Chikorita";
		card_stage=1; card_evo[0]=153; card_starter=true;
		card_type_a=01; card_type_b=-1;
		card_base_hp=45; card_base_atk=49+49; card_base_def=65+65;
		card_grid_x=1; card_grid_y=15; break;
	case 153:
		card_name="Bayleef";
		card_stage=2; card_evo[0]=154; card_starter=true;
		card_type_a=01; card_type_b=-1;
		card_base_hp=60; card_base_atk=62+63; card_base_def=80+80;
		card_grid_x=2; card_grid_y=15; break;
	case 154:
		card_name="Meganium";
		card_stage=3; card_starter=true;
		card_type_a=01; card_type_b=-1;
		card_base_hp=80; card_base_atk=82+83; card_base_def=100+100;
		card_grid_x=3; card_grid_y=15; break;
	case 155:
		card_name="Cyndaquil";
		card_stage=1; card_evo[0]=156; card_starter=true;
		card_type_a=02; card_type_b=-1;
		card_base_hp=39; card_base_atk=52+60; card_base_def=43+50;
		card_grid_x=4; card_grid_y=15; break;
	case 156:
		card_name="Quilava";
		card_stage=2; card_evo[0]=157; card_starter=true;
		card_type_a=02; card_type_b=-1;
		card_base_hp=58; card_base_atk=64+80; card_base_def=58+65;
		card_grid_x=5; card_grid_y=15; break;
	case 157:
		card_name="Typhlosion";
		card_stage=3; card_starter=true;
		card_type_a=02; card_type_b=-1;
		card_base_hp=78; card_base_atk=84+109; card_base_def=78+85;
		card_grid_x=6; card_grid_y=15; break;
	case 158:
		card_name="Totodile";
		card_stage=1; card_evo[0]=159; card_starter=true;
		card_type_a=03; card_type_b=-1;
		card_base_hp=50; card_base_atk=65+44; card_base_def=64+48;
		card_grid_x=7; card_grid_y=15; break;
	case 159:
		card_name="Croconaw";
		card_stage=2; card_evo[0]=160; card_starter=true;
		card_type_a=03; card_type_b=-1;
		card_base_hp=65; card_base_atk=80+59; card_base_def=80+63;
		card_grid_x=8; card_grid_y=15; break;
	case 160:
		card_name="Feraligatr";
		card_stage=3; card_starter=true;
		card_type_a=03; card_type_b=-1;
		card_base_hp=85; card_base_atk=105+79; card_base_def=100+83;
		card_grid_x=10; card_grid_y=15; break;
	case 161:
		card_name="Sentret";
		card_stage=1; card_evo[0]=162;
		card_type_a=00; card_type_b=-1;
		card_base_hp=35; card_base_atk=46+35; card_base_def=34+45;
		card_grid_x=11; card_grid_y=15; break;
	case 162:
		card_name="Furret";
		card_stage=2;
		card_type_a=00; card_type_b=-1;
		card_base_hp=85; card_base_atk=76+45; card_base_def=64+55;
		card_grid_x=12; card_grid_y=15; break;
	case 163:
		card_name="Hoothoot";
		card_stage=1; card_evo[0]=164;
		card_type_a=00; card_type_b=05;
		card_base_hp=60; card_base_atk=30+36; card_base_def=30+56;
		card_grid_x=13; card_grid_y=15; break;
	case 164:
		card_name="Noctowl";
		card_stage=2;
		card_type_a=00; card_type_b=05;
		card_base_hp=100; card_base_atk=50+86; card_base_def=50+96;
		card_grid_x=14; card_grid_y=15; break;
	case 165:
		card_name="Ledyba";
		card_stage=1; card_evo[0]=166;
		card_type_a=11; card_type_b=05;
		card_base_hp=40; card_base_atk=20+40; card_base_def=30+80;
		card_grid_x=15; card_grid_y=15; break;
	case 166:
		card_name="Ledian";
		card_stage=2;
		card_type_a=11; card_type_b=05;
		card_base_hp=55; card_base_atk=35+55; card_base_def=50+110;
		card_grid_x=1; card_grid_y=16; break;
	case 167:
		card_name="Spinarak";
		card_stage=1; card_evo[0]=168;
		card_type_a=11; card_type_b=12;
		card_base_hp=40; card_base_atk=60+40; card_base_def=40+40;
		card_grid_x=2; card_grid_y=16; break;
	case 168:
		card_name="Ariados";
		card_stage=2;
		card_type_a=11; card_type_b=12;
		card_base_hp=70; card_base_atk=90+60; card_base_def=70+70;
		card_grid_x=3; card_grid_y=16; break;
	case 169:
		card_name="Crobat";
		card_stage=3;
		card_type_a=12; card_type_b=05;
		card_base_hp=85; card_base_atk=90+70; card_base_def=80+80;
		card_grid_x=4; card_grid_y=16; break;
	case 170:
		card_name="Chinchou";
		card_stage=1; card_evo[0]=171;
		card_type_a=03; card_type_b=04;
		card_base_hp=75; card_base_atk=38+56; card_base_def=38+56;
		card_grid_x=5; card_grid_y=16; break;
	case 171:
		card_name="Lanturn";
		card_stage=2;
		card_type_a=03; card_type_b=04;
		card_base_hp=125; card_base_atk=58+76; card_base_def=58+76;
		card_grid_x=6; card_grid_y=16; break;
	case 172:
		card_name="Pichu";
		card_stage=0; card_evo[0]=025;
		card_type_a=04; card_type_b=-1;
		card_base_hp=20; card_base_atk=40+35; card_base_def=15+35;
		card_grid_x=7; card_grid_y=16; break;
	case 173:
		card_name="Cleffa";
		card_stage=0; card_evo[0]=035;
		card_type_a=08; card_type_b=-1;
		card_base_hp=50; card_base_atk=25+45; card_base_def=28+55;
		card_grid_x=8; card_grid_y=16; break;
	case 174:
		card_name="Igglybuff";
		card_stage=0; card_evo[0]=039;
		card_type_a=00; card_type_b=08;
		card_base_hp=90; card_base_atk=30+40; card_base_def=15+20;
		card_grid_x=10; card_grid_y=16; break;
	case 175:
		card_name="Togepi";
		card_stage=0; card_evo[0]=176;
		card_type_a=08; card_type_b=-1;
		card_base_hp=35; card_base_atk=20+40; card_base_def=65+65;
		card_grid_x=12; card_grid_y=16; break;
	case 176:
		card_name="Togetic";
		card_stage=1; card_evo[0]=468;
		card_type_a=08; card_type_b=05;
		card_base_hp=55; card_base_atk=40+80; card_base_def=85+105;
		card_grid_x=13; card_grid_y=16; break;
	case 177:
		card_name="Natu";
		card_stage=1; card_evo[0]=178;
		card_type_a=07; card_type_b=05;
		card_base_hp=40; card_base_atk=50+70; card_base_def=45+45;
		card_grid_x=14; card_grid_y=16; break;
	case 178:
		card_name="Xatu";
		card_stage=2;
		card_type_a=07; card_type_b=05;
		card_base_hp=65; card_base_atk=75+95; card_base_def=70+70;
		card_grid_x=15; card_grid_y=16; break;
	case 179:
		card_name="Mareep";
		card_stage=1; card_evo[0]=180;
		card_type_a=04; card_type_b=-1;
		card_base_hp=55; card_base_atk=40+65; card_base_def=40+45;
		card_grid_x=1; card_grid_y=17; break;
	case 180:
		card_name="Flaaffy";
		card_stage=2; card_evo[0]=181;
		card_type_a=04; card_type_b=-1;
		card_base_hp=70; card_base_atk=55+80; card_base_def=55+60;
		card_grid_x=2; card_grid_y=17; break;
	case 181:
		card_name="Ampharos";
		card_stage=3;
		card_type_a=04; card_type_b=-1;
		card_base_hp=90; card_base_atk=75+115; card_base_def=85+90;
		card_grid_x=3; card_grid_y=17; break;
	case 182:
		card_name="Bellossom";
		card_stage=3;
		card_type_a=01; card_type_b=-1;
		card_base_hp=75; card_base_atk=80+90; card_base_def=95+100;
		card_grid_x=5; card_grid_y=17; break;
	case 183:
		card_name="Marill";
		card_stage=1; card_evo[0]=184;
		card_type_a=03; card_type_b=08;
		card_base_hp=70; card_base_atk=20+20; card_base_def=50+50;
		card_grid_x=6; card_grid_y=17; break;
	case 184:
		card_name="Azumarill";
		card_stage=2;
		card_type_a=03; card_type_b=08;
		card_base_hp=100; card_base_atk=50+60; card_base_def=80+80;
		card_grid_x=7; card_grid_y=17; break;
	case 185:
		card_name="Sudowoodo";
		card_stage=1;
		card_type_a=10; card_type_b=-1;
		card_base_hp=70; card_base_atk=100+30; card_base_def=115+65;
		card_grid_x=8; card_grid_y=17; break;
	case 186:
		card_name="Politoed";
		card_stage=3;
		card_type_a=03; card_type_b=-1;
		card_base_hp=90; card_base_atk=75+90; card_base_def=75+100;
		card_grid_x=9; card_grid_y=17; break;
	case 187:
		card_name="Hoppip";
		card_stage=1; card_evo[0]=188;
		card_type_a=01; card_type_b=05;
		card_base_hp=35; card_base_atk=35+35; card_base_def=40+55;
		card_grid_x=11; card_grid_y=17; break;
	case 188:
		card_name="Skiploom";
		card_stage=2; card_evo[0]=189;
		card_type_a=01; card_type_b=05;
		card_base_hp=55; card_base_atk=45+45; card_base_def=50+65;
		card_grid_x=12; card_grid_y=17; break;
	case 189:
		card_name="Jumpluff";
		card_stage=3;
		card_type_a=01; card_type_b=05;
		card_base_hp=75; card_base_atk=55+55; card_base_def=70+95;
		card_grid_x=13; card_grid_y=17; break;
	case 190:
		card_name="Aipom";
		card_stage=1; card_evo[0]=424;
		card_type_a=00; card_type_b=-1;
		card_base_hp=55; card_base_atk=70+40; card_base_def=55+55;
		card_grid_x=14; card_grid_y=17; break;
	case 191:
		card_name="Sunkern";
		card_stage=1; card_evo[0]=192;
		card_type_a=01; card_type_b=-1;
		card_base_hp=30; card_base_atk=30+30; card_base_def=30+30;
		card_grid_x=15; card_grid_y=17; break;
	case 192:
		card_name="Sunflora";
		card_stage=2;
		card_type_a=01; card_type_b=-1;
		card_base_hp=75; card_base_atk=75+105; card_base_def=55+85;
		card_grid_x=1; card_grid_y=18; break;
	case 193:
		card_name="Yanma";
		card_stage=1; card_evo[0]=469;
		card_type_a=11; card_type_b=05;
		card_base_hp=65; card_base_atk=65+75; card_base_def=45+45;
		card_grid_x=2; card_grid_y=18; break;
	case 194:
		card_name="Wooper";
		card_stage=1; card_evo[0]=195;
		card_type_a=03; card_type_b=09;
		card_base_hp=55; card_base_atk=45+25; card_base_def=45+25;
		card_grid_x=3; card_grid_y=18; break;
	case 195:
		card_name="Quagsire";
		card_stage=2;
		card_type_a=03; card_type_b=09;
		card_base_hp=95; card_base_atk=85+65; card_base_def=85+65;
		card_grid_x=4; card_grid_y=18; break;
	case 196:
		card_name="Espeon";
		card_stage=2;
		card_type_a=07; card_type_b=-1;
		card_base_hp=65; card_base_atk=65+130; card_base_def=60+95;
		card_grid_x=5; card_grid_y=18; break;
	case 197:
		card_name="Umbreon";
		card_stage=2;
		card_type_a=17; card_type_b=-1;
		card_base_hp=95; card_base_atk=65+60; card_base_def=110+130;
		card_grid_x=6; card_grid_y=18; break;
	case 198:
		card_name="Murkrow";
		card_stage=1; card_evo[0]=430;
		card_type_a=17; card_type_b=05;
		card_base_hp=60; card_base_atk=85+85; card_base_def=42+42;
		card_grid_x=7; card_grid_y=18; break;
	case 199:
		card_name="Slowking";
		card_stage=2;
		card_type_a=03; card_type_b=07;
		card_base_hp=95; card_base_atk=75+100; card_base_def=80+110;
		card_grid_x=8; card_grid_y=18; break;
	case 200:
		card_name="Misdreavus";
		card_stage=1; card_evo[0]=429;
		card_type_a=16; card_type_b=-1;
		card_base_hp=60; card_base_atk=60+85; card_base_def=60+85;
		card_grid_x=9; card_grid_y=18; break;
	case 201:
		card_name="Unown";
		card_stage=1;
		card_type_a=07; card_type_b=-1;
		card_base_hp=48; card_base_atk=72+72; card_base_def=48+48;
		if card_form_value<38 { card_grid_x=10; card_grid_y=18; }
		else if card_form_value<76 { card_grid_x=11; card_grid_y=18; }
		else if card_form_value<114 { card_grid_x=13; card_grid_y=18; }
		else if card_form_value<152 { card_grid_x=15; card_grid_y=18; }
		else if card_form_value<190 { card_grid_x=2; card_grid_y=19; }
		else if card_form_value<228 { card_grid_x=4; card_grid_y=19; }
		else if card_form_value<266 { card_grid_x=6; card_grid_y=19; }
		else if card_form_value<304 { card_grid_x=8; card_grid_y=19; }
		else if card_form_value<342 { card_grid_x=10; card_grid_y=19; }
		else if card_form_value<380 { card_grid_x=11; card_grid_y=19; }
		else if card_form_value<418 { card_grid_x=13; card_grid_y=19; }
		else if card_form_value<456 { card_grid_x=15; card_grid_y=19; }
		else if card_form_value<494 { card_grid_x=2; card_grid_y=20; }
		else if card_form_value<532 { card_grid_x=3; card_grid_y=20; }
		else if card_form_value<570 { card_grid_x=5; card_grid_y=20; }
		else if card_form_value<608 { card_grid_x=6; card_grid_y=20; }
		else if card_form_value<646 { card_grid_x=8; card_grid_y=20; }
		else if card_form_value<684 { card_grid_x=10; card_grid_y=20; }
		else if card_form_value<722 { card_grid_x=12; card_grid_y=20; }
		else if card_form_value<760 { card_grid_x=14; card_grid_y=20; }
		else if card_form_value<798 { card_grid_x=15; card_grid_y=20; }
		else if card_form_value<836 { card_grid_x=1; card_grid_y=21; }
		else if card_form_value<874 { card_grid_x=3; card_grid_y=21; }
		else if card_form_value<912 { card_grid_x=4; card_grid_y=21; }
		else if card_form_value<950 { card_grid_x=5; card_grid_y=21; }
		else if card_form_value<988 { card_grid_x=6; card_grid_y=21; }
		else if card_form_value<994 { card_grid_x=8; card_grid_y=21; }
		else if card_form_value<1000 { card_grid_x=9; card_grid_y=21; }
		break;
	case 202:
		card_name="Wobbuffet";
		card_stage=1;
		card_type_a=07; card_type_b=-1;
		card_base_hp=190; card_base_atk=33+33; card_base_def=58+58;
		card_grid_x=11; card_grid_y=21; break;
	case 203:
		card_name="Girafarig";
		card_stage=1;
		card_type_a=00; card_type_b=07;
		card_base_hp=70; card_base_atk=80+90; card_base_def=65+65;
		card_grid_x=12; card_grid_y=21; break;
	case 204:
		card_name="Pineco";
		card_stage=1; card_evo[0]=205;
		card_type_a=11; card_type_b=-1;
		card_base_hp=50; card_base_atk=65+35; card_base_def=90+35;
		card_grid_x=13; card_grid_y=21; break;
	case 205:
		card_name="Forretress";
		card_stage=2;
		card_type_a=11; card_type_b=15;
		card_base_hp=75; card_base_atk=90+60; card_base_def=140+60;
		card_grid_x=14; card_grid_y=21; break;
	case 206:
		card_name="Dunsparce";
		card_stage=1;
		card_type_a=00; card_type_b=-1;
		card_base_hp=100; card_base_atk=70+65; card_base_def=70+65;
		card_grid_x=15; card_grid_y=21; break;
	case 207:
		card_name="Gligar";
		card_stage=1; card_evo[0]=472;
		card_type_a=09; card_type_b=05;
		card_base_hp=65; card_base_atk=75+35; card_base_def=105+65;
		card_grid_x=1; card_grid_y=22; break;
	case 208:
		card_name="Steelix";
		card_stage=2;
		card_type_a=15; card_type_b=09;
		card_base_hp=75; card_base_atk=85+55; card_base_def=200+65;
		card_grid_x=2; card_grid_y=22; break;
	case 209:
		card_name="Snubbull";
		card_stage=1; card_evo[0]=210;
		card_type_a=08; card_type_b=-1;
		card_base_hp=60; card_base_atk=80+40; card_base_def=50+40;
		card_grid_x=4; card_grid_y=22; break;
	case 210:
		card_name="Granbull";
		card_stage=2;
		card_type_a=08; card_type_b=-1;
		card_base_hp=90; card_base_atk=120+60; card_base_def=75+60;
		card_grid_x=5; card_grid_y=22; break;
	case 211:
		card_name="Qwilfish";
		card_stage=1;
		card_type_a=03; card_type_b=12;
		card_base_hp=65; card_base_atk=95+55; card_base_def=85+55;
		card_grid_x=6; card_grid_y=22; break;
	case 212:
		card_name="Scizor";
		card_stage=2;
		card_type_a=11; card_type_b=15;
		card_base_hp=70; card_base_atk=130+55; card_base_def=100+80;
		card_grid_x=7; card_grid_y=22; break;
	case 213:
		card_name="Shuckle";
		card_stage=1;
		card_type_a=11; card_type_b=10;
		card_base_hp=20; card_base_atk=10+10; card_base_def=230+230;
		card_grid_x=9; card_grid_y=22; break;
	case 214:
		card_name="Heracross";
		card_stage=1;
		card_type_a=11; card_type_b=06;
		card_base_hp=80; card_base_atk=125+40; card_base_def=75+95;
		card_grid_x=10; card_grid_y=22; break;
	case 215:
		card_name="Sneasel";
		card_stage=1; card_evo[0]=461;
		card_type_a=17; card_type_b=13;
		card_base_hp=55; card_base_atk=95+35; card_base_def=55+75;
		card_grid_x=12; card_grid_y=22; break;
	case 216:
		card_name="Teddiursa";
		card_stage=1; card_evo[0]=217;
		card_type_a=00; card_type_b=-1;
		card_base_hp=60; card_base_atk=80+50; card_base_def=50+50;
		card_grid_x=14; card_grid_y=22; break;
	case 217:
		card_name="Ursaring";
		card_stage=2; card_evo[0]=901;
		card_type_a=00; card_type_b=-1;
		card_base_hp=90; card_base_atk=130+75; card_base_def=75+75;
		card_grid_x=1; card_grid_y=23; break;
	case 218:
		card_name="Slugma";
		card_stage=1; card_evo[0]=219;
		card_type_a=02; card_type_b=-1;
		card_base_hp=40; card_base_atk=40+70; card_base_def=40+40;
		card_grid_x=2; card_grid_y=23; break;
	case 219:
		card_name="Magcargo";
		card_stage=2;
		card_type_a=02; card_type_b=10;
		card_base_hp=60; card_base_atk=50+90; card_base_def=120+80;
		card_grid_x=3; card_grid_y=23; break;
	case 220:
		card_name="Swinub";
		card_stage=1; card_evo[0]=221;
		card_type_a=13; card_type_b=09;
		card_base_hp=50; card_base_atk=50+30; card_base_def=40+30;
		card_grid_x=4; card_grid_y=23; break;
	case 221:
		card_name="Piloswine";
		card_stage=2; card_evo[0]=473;
		card_type_a=13; card_type_b=09;
		card_base_hp=100; card_base_atk=100+60; card_base_def=80+60;
		card_grid_x=5; card_grid_y=23; break;
	case 222:
		card_name="Corsola";
		card_stage=1;
		card_type_a=03; card_type_b=10;
		card_base_hp=65; card_base_atk=55+65; card_base_def=95+95;
		card_grid_x=6; card_grid_y=23; break;
	case 223:
		card_name="Remoraid";
		card_stage=1; card_evo[0]=224;
		card_type_a=03; card_type_b=-1;
		card_base_hp=35; card_base_atk=65+65; card_base_def=35+35;
		card_grid_x=7; card_grid_y=23; break;
	case 224:
		card_name="Octillery";
		card_stage=2;
		card_type_a=03; card_type_b=-1;
		card_base_hp=75; card_base_atk=105+105; card_base_def=75+75;
		card_grid_x=8; card_grid_y=23; break;
	case 225:
		card_name="Delibird";
		card_stage=1;
		card_type_a=13; card_type_b=05;
		card_base_hp=45; card_base_atk=55+65; card_base_def=45+45;
		card_grid_x=9; card_grid_y=23; break;
	case 226:
		card_name="Mantine";
		card_stage=1;
		card_type_a=03; card_type_b=05;
		card_base_hp=85; card_base_atk=40+80; card_base_def=70+140;
		card_grid_x=10; card_grid_y=23; break;
	case 227:
		card_name="Skarmory";
		card_stage=1;
		card_type_a=15; card_type_b=05;
		card_base_hp=65; card_base_atk=80+40; card_base_def=140+70;
		card_grid_x=11; card_grid_y=23; break;
	case 228:
		card_name="Houndour";
		card_stage=1; card_evo[0]=229;
		card_type_a=17; card_type_b=02;
		card_base_hp=45; card_base_atk=60+80; card_base_def=30+50;
		card_grid_x=12; card_grid_y=23; break;
	case 229:
		card_name="Houndoom";
		card_stage=2;
		card_type_a=17; card_type_b=02;
		card_base_hp=75; card_base_atk=90+110; card_base_def=50+80;
		card_grid_x=13; card_grid_y=23; break;
	case 230:
		card_name="Kingdra";
		card_stage=3;
		card_type_a=03; card_type_b=14;
		card_base_hp=75; card_base_atk=95+95; card_base_def=95+95;
		card_grid_x=15; card_grid_y=23; break;
	case 231:
		card_name="Phanpy";
		card_stage=1; card_evo[0]=232;
		card_type_a=09; card_type_b=-1;
		card_base_hp=90; card_base_atk=60+40; card_base_def=60+40;
		card_grid_x=1; card_grid_y=24; break;
	case 232:
		card_name="Donphan";
		card_stage=2;
		card_type_a=09; card_type_b=-1;
		card_base_hp=90; card_base_atk=120+60; card_base_def=120+60;
		card_grid_x=2; card_grid_y=24; break;
	case 233:
		card_name="Porygon2";
		card_stage=2; card_evo[0]=474;
		card_type_a=00; card_type_b=-1;
		card_base_hp=85; card_base_atk=80+105; card_base_def=90+95;
		card_grid_x=3; card_grid_y=24; break;
	case 234:
		card_name="Stantler";
		card_stage=1; card_evo[0]=899;
		card_type_a=00; card_type_b=-1;
		card_base_hp=73; card_base_atk=95+85; card_base_def=62+65;
		card_grid_x=4; card_grid_y=24; break;
	case 235:
		card_name="Smeargle";
		card_stage=1;
		card_type_a=00; card_type_b=-1;
		card_base_hp=55; card_base_atk=20+20; card_base_def=35+45;
		card_grid_x=5; card_grid_y=24; break;
	case 236:
		card_name="Tyrogue";
		card_stage=0; card_evo[0]=106; card_evo[1]=107; card_evo[2]=237;
		card_type_a=06; card_type_b=-1;
		card_base_hp=35; card_base_atk=35+35; card_base_def=35+35;
		card_grid_x=6; card_grid_y=24; break;
	case 237:
		card_name="Hitmontop";
		card_stage=1;
		card_type_a=06; card_type_b=-1;
		card_base_hp=50; card_base_atk=95+35; card_base_def=95+110;
		card_grid_x=7; card_grid_y=24; break;
	case 238:
		card_name="Smoochum";
		card_stage=0; card_evo[0]=124;
		card_type_a=13; card_type_b=07;
		card_base_hp=45; card_base_atk=30+85; card_base_def=15+65;
		card_grid_x=8; card_grid_y=24; break;
	case 239:
		card_name="Elekid";
		card_stage=0; card_evo[0]=125;
		card_type_a=04; card_type_b=-1;
		card_base_hp=45; card_base_atk=63+65; card_base_def=37+55;
		card_grid_x=9; card_grid_y=24; break;
	case 240:
		card_name="Magby";
		card_stage=0; card_evo[0]=126;
		card_type_a=02; card_type_b=-1;
		card_base_hp=45; card_base_atk=75+70; card_base_def=37+55;
		card_grid_x=10; card_grid_y=24; break;
	case 241:
		card_name="Miltank";
		card_stage=1;
		card_type_a=00; card_type_b=-1;
		card_base_hp=95; card_base_atk=80+40; card_base_def=105+70;
		card_grid_x=11; card_grid_y=24; break;
	case 242:
		card_name="Blissey";
		card_stage=2;
		card_type_a=00; card_type_b=-1;
		card_base_hp=255; card_base_atk=10+75; card_base_def=10+135;
		card_grid_x=12; card_grid_y=24; break;
	case 243:
		card_name="Raikou";
		card_stage=1; card_enigma=true;
		card_type_a=04; card_type_b=-1;
		card_base_hp=90; card_base_atk=85+115; card_base_def=75+100;
		card_grid_x=13; card_grid_y=24; break;
	case 244:
		card_name="Entei";
		card_stage=1; card_enigma=true;
		card_type_a=02; card_type_b=-1;
		card_base_hp=115; card_base_atk=115+90; card_base_def=85+75;
		card_grid_x=14; card_grid_y=24; break;
	case 245:
		card_name="Suicune";
		card_stage=1; card_enigma=true;
		card_type_a=03; card_type_b=-1;
		card_base_hp=100; card_base_atk=75+90; card_base_def=115+115;
		card_grid_x=15; card_grid_y=24; break;
	case 246:
		card_name="Larvitar";
		card_stage=1; card_evo[0]=247; card_pseudo=true;
		card_type_a=10; card_type_b=09;
		card_base_hp=50; card_base_atk=64+45; card_base_def=50+50;
		card_grid_x=1; card_grid_y=25; break;
	case 247:
		card_name="Pupitar";
		card_stage=2; card_evo[0]=248; card_pseudo=true;
		card_type_a=10; card_type_b=09;
		card_base_hp=70; card_base_atk=84+65; card_base_def=70+70;
		card_grid_x=2; card_grid_y=25; break;
	case 248:
		card_name="Tyranitar";
		card_stage=3; card_pseudo=true;
		card_type_a=10; card_type_b=17;
		card_base_hp=100; card_base_atk=134+95; card_base_def=110+100;
		card_grid_x=3; card_grid_y=25; break;
	case 249:
		card_name="Lugia";
		card_stage=1; card_enigma=true;
		card_type_a=07; card_type_b=05;
		card_base_hp=106; card_base_atk=90+90; card_base_def=130+154;
		card_grid_x=5; card_grid_y=25; break;
	case 250:
		card_name="Ho-oh";
		card_stage=1; card_enigma=true;
		card_type_a=02; card_type_b=05;
		card_base_hp=106; card_base_atk=130+110; card_base_def=90+154;
		card_grid_x=6; card_grid_y=25; break;
	case 251:
		card_name="Celebi";
		card_stage=1; card_enigma=true;
		card_type_a=07; card_type_b=01;
		card_base_hp=100; card_base_atk=100+100; card_base_def=100+100;
		card_grid_x=7; card_grid_y=25; break;
	//
		
	// CODE BEYOND THIS POINT IS MODDED
	
	/* copypaste template
	case -1:
		card_name="";
		card_stage=1; card_evo[0]=-1;
		card_type_a=-1; card_type_b=-1;
		card_base_hp=-1; card_base_atk=-1; card_base_def=-1;
		card_grid_x=-1; card_grid_y=-1; break;
	*/
	
	// DON'T FORGET TO CHANGE normal_poke_id_max WHEN ADDING NEW POKEMON!
	
	case 252:
		card_name="Treecko";
		card_stage=1; card_evo[0]=253; card_starter=true;
		card_type_a=01; card_type_b=-1;
		card_base_hp=40; card_base_atk=45+65; card_base_def=35+55;
		card_grid_x=1; card_grid_y=26; break;
		
	case 253:
		card_name="Grovyle";
		card_stage=2; card_evo[0]=254; card_starter=true;
		card_type_a=01; card_type_b=-1;
		card_base_hp=50; card_base_atk=65+85; card_base_def=45+65;
		card_grid_x=2; card_grid_y=26; break;
		
	case 254:
		card_name="Sceptile";
		card_stage=3;
		card_type_a=01; card_type_b=-1; card_starter=true;
		card_base_hp=70; card_base_atk=85+105; card_base_def=65+85;
		card_grid_x=3; card_grid_y=26; break;
		
	case 255:
		card_name="Torchic";
		card_stage=1; card_evo[0]=256; card_starter=true;
		card_type_a=02; card_type_b=-1;
		card_base_hp=45; card_base_atk=60+70; card_base_def=40+50;
		card_grid_x=5; card_grid_y=26; break;
	
	case 256:
		card_name="Combusken";
		card_stage=2; card_evo[0]=257; card_starter=true;
		card_type_a=02; card_type_b=06;
		card_base_hp=60; card_base_atk=85+85; card_base_def=60+60;
		card_grid_x=6; card_grid_y=26; break;
		
	case 257:
		card_name="Blaziken";
		card_stage=3; card_starter=true;
		card_type_a=02; card_type_b=06;
		card_base_hp=80; card_base_atk=120+110; card_base_def=70+70;
		card_grid_x=7; card_grid_y=26; break;
		
	case 258:
		card_name="Mudkip";
		card_stage=1; card_evo[0]=259; card_starter=true;
		card_type_a=03; card_type_b=-1;
		card_base_hp=50; card_base_atk=70+50; card_base_def=50+50;
		card_grid_x=9; card_grid_y=26; break;
		
	case 259:
		card_name="Marshtomp";
		card_stage=2; card_evo[0]=260; card_starter=true;
		card_type_a=03; card_type_b=09;
		card_base_hp=70; card_base_atk=85+60; card_base_def=70+70;
		card_grid_x=10; card_grid_y=26; break;
		
	case 260:
		card_name="Swampert";
		card_stage=3; card_starter=true;
		card_type_a=03; card_type_b=09;
		card_base_hp=100; card_base_atk=110+85; card_base_def=90+90;
		card_grid_x=11; card_grid_y=26; break;
		
	case 261:
		card_name="Poochyena";
		card_stage=1; card_evo[0]=262;
		card_type_a=17; card_type_b=0;
		card_base_hp=35; card_base_atk=55+30; card_base_def=35+30;
		card_grid_x=13; card_grid_y=26; break;
		
	case 262:
		card_name="Mightyena";
		card_stage=2;
		card_type_a=17; card_type_b=-1;
		card_base_hp=70; card_base_atk=90+60; card_base_def=70+60;
		card_grid_x=14; card_grid_y=26; break;
		
	case 263:
		card_name="Zigzagoon";
		card_stage=1; card_evo[0]=264;
		card_type_a=00; card_type_b=-1;
		card_base_hp=38; card_base_atk=30+30; card_base_def=41+41;
		card_grid_x=15; card_grid_y=26; break;
		
	case 264:
		card_name="Linoone";
		card_stage=2;
		card_type_a=00; card_type_b=-1;
		card_base_hp=78; card_base_atk=70+50; card_base_def=61+61;
		card_grid_x=1; card_grid_y=27; break;
		
	case 265:
		card_name="Wurmple";
		card_stage=1; card_evo[0]=266; card_evo[1]=268;
		card_type_a=11; card_type_b=-1;
		card_base_hp=45; card_base_atk=45+20; card_base_def=35+30;
		card_grid_x=2; card_grid_y=27; break;
		
	case 266:
		card_name="Silcoon";
		card_stage=2; card_evo[0]=267;
		card_type_a=11; card_type_b=-1;
		card_base_hp=50; card_base_atk=35+25; card_base_def=55+25;
		card_grid_x=3; card_grid_y=27; break;
		
	case 267:
		card_name="Beautifly";
		card_stage=3;
		card_type_a=11; card_type_b=05;
		card_base_hp=60; card_base_atk=70+100; card_base_def=50+50;
		card_grid_x=4; card_grid_y=27; break;
		
	case 268:
		card_name="Cascoon";
		card_stage=2; card_evo[0]=269;
		card_type_a=11; card_type_b=-1;
		card_base_hp=50; card_base_atk=35+25; card_base_def=55+25;
		card_grid_x=5; card_grid_y=27; break;
		
	case 269:
		card_name="Dustox";
		card_stage=3;
		card_type_a=11; card_type_b=12;
		card_base_hp=60; card_base_atk=50+50; card_base_def=70+90;
		card_grid_x=6; card_grid_y=27; break;
		
	case 270:
		card_name="Lotad";
		card_stage=1; card_evo[0]=271;
		card_type_a=03; card_type_b=01;
		card_base_hp=40; card_base_atk=30+40; card_base_def=30+50;
		card_grid_x=7; card_grid_y=27; break;
		
	case 271:
		card_name="Lombre";
		card_stage=2; card_evo[0]=272;
		card_type_a=03; card_type_b=01;
		card_base_hp=60; card_base_atk=50+60; card_base_def=50+70;
		card_grid_x=8; card_grid_y=27; break;
		
	case 272:
		card_name="Ludicolo";
		card_stage=3;
		card_type_a=03; card_type_b=01;
		card_base_hp=80; card_base_atk=70+90; card_base_def=70+100;
		card_grid_x=9; card_grid_y=27; break;
		
	// END OF MODDED CODE
		
	//
	case 2001:
		card_name="MissingNo.";
		card_stage=1; card_secret=true;
		card_type_a=05; card_type_b=00;
		card_base_hp=33; card_base_atk=136+6; card_base_def=0+6;
		card_grid_x=1; card_grid_y=1; break;
	case 2002:
		card_name="-"; //GHOST: Marowak, but with 1 base HP
		card_stage=1; card_secret=true;
		card_type_a=16; card_type_b=-1;
		card_base_hp=1; card_base_atk=80+50; card_base_def=110+80;
		card_grid_x=2; card_grid_y=1; break;
	//
	case 2501:
		card_name="Elm Tree";
		card_stage=1; card_environment=true;
		card_type_a=01; card_type_b=-1;
		card_base_hp=255; card_base_atk=0; card_base_def=90; //hp 4-28, def 0-3
		card_grid_x=1; card_grid_y=14; break;
	case 2502:
		card_name="Spruce Tree";
		card_stage=1; card_environment=true;
		card_type_a=01; card_type_b=-1;
		card_base_hp=210; card_base_atk=0; card_base_def=150; //hp 3-25, def 0-4
		card_grid_x=2; card_grid_y=14; break;
	case 2503:
		card_name="Rock";
		card_stage=1; card_environment=true;
		card_type_a=10; card_type_b=-1;
		card_base_hp=130; card_base_atk=0; card_base_def=200; //hp 3-20, def 1-5
		card_grid_x=3; card_grid_y=14; break;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}