function sc_pokelist() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
//00 normal, 01 grass, 02 fire, 03 water, 04 electric, 05 flying, 06 fighting, 07 psychic, 08 fairy
//09 ground, 10 rock, 11 bug, 12 poison, 13 ice, 14 dragon, 15 steel, 16 ghost, 17 dark
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_id<=386 { card_sheet=sp_poke_a; }
else if card_id<=807 { card_sheet=sp_poke_b; }
else if card_id<=2000 { card_sheet=sp_poke_d; }
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
card_can_mega=false;
card_has_forms=false;
card_form_change=false;
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
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Venusaur";
		card_stage=3; card_evo[0]=003; card_starter=true;
		card_type_a=01; card_type_b=12;
		card_base_hp=80; card_base_atk=82+100; card_base_def=83+100;
		card_grid_x=3; card_grid_y=1;}
		else {
		card_name="M-Venusaur";
		card_stage=3; card_starter=true; card_enigma=true;
		card_type_a=01; card_type_b=12;
		card_base_hp=80; card_base_atk=100+122; card_base_def=123+120;
		card_grid_x=4; card_grid_y=1;} break;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Charizard";
		card_stage=3; card_starter=true;
		card_type_a=02; card_type_b=05;
		card_base_hp=78; card_base_atk=84+109; card_base_def=78+85;
		card_grid_x=7; card_grid_y=1;}
		else if card_form_value<1001{
		card_name="M-Charizard X";
		card_form_change=true;
		card_has_forms=true;
		card_stage=3; card_starter=true; card_enigma=true;
		card_type_a=02; card_type_b=14;
		card_base_hp=78; card_base_atk=130+130; card_base_def=111+85;
		card_grid_x=8; card_grid_y=1;}
		else if card_form_value<1002{
		card_name="M-Charizard Y";
		card_form_change=true;
		card_has_forms=true;
		card_stage=3; card_starter=true; card_enigma=true;
		card_type_a=02; card_type_b=05;
		card_base_hp=78; card_base_atk=104+159; card_base_def=78+115;
		card_grid_x=9; card_grid_y=1;} break;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Blastoise";
		card_stage=3; card_starter=true;
		card_type_a=03; card_type_b=-1;
		card_base_hp=79; card_base_atk=83+85; card_base_def=100+105;
		card_grid_x=12; card_grid_y=1;}
		else {
		card_name="M-Blastoise";
		card_stage=3; card_starter=true; card_enigma=true;
		card_type_a=03; card_type_b=-1;
		card_base_hp=79; card_base_atk=103+135; card_base_def=120+115;
		card_grid_x=13; card_grid_y=1;} 
		break;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Beedrill";
		card_stage=3;
		card_type_a=11; card_type_b=12;
		card_base_hp=65; card_base_atk=90+45; card_base_def=40+80;
		card_grid_x=4; card_grid_y=2;}
		else {
		card_name="M-Beedrill";
		card_stage=3; card_enigma=true;
		card_type_a=11; card_type_b=12;
		card_base_hp=65; card_base_atk=150+15; card_base_def=40+80;
		card_grid_x=5; card_grid_y=2;} break;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Pidgeot";
		card_stage=3;
		card_type_a=00; card_type_b=05;
		card_base_hp=83; card_base_atk=80+70; card_base_def=75+70;
		card_grid_x=8; card_grid_y=2;}
		else {
		card_name="M-Pidgeot";
		card_stage=3; card_enigma=true;
		card_type_a=00; card_type_b=05;
		card_base_hp=83; card_base_atk=80+135; card_base_def=80+80;
		card_grid_x=9; card_grid_y=2;} break;
	case 019:
		card_has_forms=true;
		card_name="Rattata";
		if card_form_value<500 { 
		card_stage=1; card_evo[0]=020;
		card_type_a=00; card_type_b=-1;
		card_base_hp=30; card_base_atk=56+25; card_base_def=35+35;
		card_grid_x=10; card_grid_y=2; }
		else { 
		card_stage=1; card_evo[0]=020;
		card_type_a=17; card_type_b=00;
		card_base_hp=30; card_base_atk=56+25; card_base_def=35+35;
		card_grid_x=11; card_grid_y=2; }; break;
		
	case 020:
		card_has_forms=true;
		card_name="Raticate";
		if card_form_value<500 { 
		card_stage=2;
		card_type_a=00; card_type_b=-1;
		card_base_hp=55; card_base_atk=81+50; card_base_def=60+70;
		card_grid_x=12; card_grid_y=2; }
		else{ 
		card_stage=2;
		card_type_a=17; card_type_b=00;
		card_base_hp=55; card_base_atk=81+50; card_base_def=60+70;
		card_grid_x=13; card_grid_y=2; } break;
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
		card_has_forms=true;
		card_name="Raichu";
		card_stage=2;
		if card_form_value<500 { 
		card_type_a=04; card_type_b=-1;
		card_base_hp=60; card_base_atk=90+90; card_base_def=55+80;
		card_grid_x=13; card_grid_y=3;}
		else { 
		card_type_a=04; card_type_b=07;
		card_base_hp=60; card_base_atk=85+95; card_base_def=50+85;
		card_grid_x=14; card_grid_y=3;}	break;
	case 027:
		card_has_forms=true;
		card_name="Sandshrew";
		card_stage=1; card_evo[0]=028;
		if card_form_value<500 { 
		card_type_a=09; card_type_b=-1;
		card_base_hp=50; card_base_atk=75+20; card_base_def=85+30;
		card_grid_x=15; card_grid_y=3;}
		else { 
		card_type_a=13; card_type_b=15;
		card_base_hp=50; card_base_atk=75+10; card_base_def=90+35;
		card_grid_x=1; card_grid_y=4;}	break;
	case 028:
		card_has_forms=true;
		card_name="Sandslash";
		card_stage=2;
		if card_form_value<500 { 
		card_type_a=09; card_type_b=-1;
		card_base_hp=75; card_base_atk=100+45; card_base_def=110+55;
		card_grid_x=2; card_grid_y=4;}
		else {  
		card_type_a=13; card_type_b=15;
		card_base_hp=75; card_base_atk=100+25; card_base_def=120+65;
		card_grid_x=3; card_grid_y=4;}   break;
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
		card_has_forms=true;
		card_name="Vulpix";
		card_stage=1; card_evo[0]=038;
		if card_form_value<500 {
		card_type_a=02; card_type_b=-1;
		card_base_hp=38; card_base_atk=41+50; card_base_def=40+65;
		card_grid_x=14; card_grid_y=4;}
		else {
		card_type_a=13; card_type_b=-1;
		card_base_hp=38; card_base_atk=41+50; card_base_def=40+65;
		card_grid_x=15; card_grid_y=4;} break;
	case 038:
		card_has_forms=true;
		card_name="Ninetales";
		card_stage=2;
		if card_form_value<500 {
		card_type_a=02; card_type_b=-1;
		card_base_hp=73; card_base_atk=76+81; card_base_def=75+100;
		card_grid_x=1; card_grid_y=5;}
		else {
		card_type_a=13; card_type_b=08;
		card_base_hp=73; card_base_atk=67+81; card_base_def=75+100;
		card_grid_x=2; card_grid_y=5;} break;
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
		card_has_forms=true;
		card_name="Diglett";
		card_stage=1; card_evo[0]=051;
		if card_form_value<500 {
		card_type_a=09; card_type_b=-1;
		card_base_hp=10; card_base_atk=55+35; card_base_def=25+45;
		card_grid_x=1; card_grid_y=6;}
		else {
		card_type_a=09; card_type_b=15;
		card_base_hp=10; card_base_atk=55+35; card_base_def=30+45;
		card_grid_x=2; card_grid_y=6;} break;
	case 051:
		card_has_forms=true;
		card_name="Dugtrio";
		card_stage=2;
		if card_form_value<500 {
		card_type_a=09; card_type_b=-1;
		card_base_hp=35; card_base_atk=100+50; card_base_def=50+70;
		card_grid_x=3; card_grid_y=6;}
		else {
		card_type_a=09; card_type_b=15;
		card_base_hp=35; card_base_atk=100+50; card_base_def=60+70;
		card_grid_x=4; card_grid_y=6;} break;
	case 052:
		card_has_forms=true;
		card_name="Meowth";//this has a third gen8 for with a different evo so it needs to be divided into 3 later
		card_stage=1; 
		if card_form_value<333 {
		card_evo[0]=053;
		card_type_a=00; card_type_b=-1;
		card_base_hp=40; card_base_atk=45+40; card_base_def=35+40;
		card_grid_x=6; card_grid_y=6;}
		else if card_form_value<=666 {
		card_evo[0]=053;
		card_type_a=17; card_type_b=-1;
		card_base_hp=40; card_base_atk=35+50; card_base_def=35+40;
		card_grid_x=7; card_grid_y=6;}
		else {
		card_sheet=sp_poke_d;
		card_evo[0]=863;
		card_type_a=15; card_type_b=-1;
		card_base_hp=40; card_base_atk=35+50; card_base_def=35+40;
		card_grid_x=6; card_grid_y=9;}
		break;
	case 053:
		card_has_forms=true;
		card_name="Persian";
		card_stage=2;
		if card_form_value<500 {
		card_type_a=00; card_type_b=-1;
		card_base_hp=65; card_base_atk=70+65; card_base_def=60+65;
		card_grid_x=8; card_grid_y=6;}
		else {
		card_type_a=17; card_type_b=-1;
		card_base_hp=65; card_base_atk=60+75; card_base_def=60+65;
		card_grid_x=9; card_grid_y=6;} break;
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
		card_has_forms=true;	
		card_name="Growlithe";
		card_stage=1; card_evo[0]=059;
		if card_form_value<500 {
		card_type_a=02; card_type_b=-1;
		card_base_hp=55; card_base_atk=70+70; card_base_def=45+50;
		card_grid_x=14; card_grid_y=6;
		}
		else {
		card_sheet=sp_poke_d;
		card_type_a=02; card_type_b=10;
		card_base_hp=60; card_base_atk=75+65; card_base_def=45+50;
		card_grid_x=8; card_grid_y=9;
		}
		break;
	case 059:
		card_has_forms=true;	
		card_name="Arcanine";
		card_stage=2;
		if card_form_value<500 {
		card_type_a=02; card_type_b=-1;
		card_base_hp=90; card_base_atk=110+100; card_base_def=80+80;
		card_grid_x=15; card_grid_y=6;
		}
		else {
		card_sheet=sp_poke_d;
		card_type_a=02; card_type_b=10;
		card_base_hp=95; card_base_atk=115+95; card_base_def=80+80;
		card_grid_x=9; card_grid_y=9;
		}
		break;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Alakazam";
		card_stage=3;
		card_type_a=07; card_type_b=-1;
		card_base_hp=55; card_base_atk=50+135; card_base_def=45+95;
		card_grid_x=8; card_grid_y=7;}
		else {
		card_name="M-Alakazam";
		card_stage=3; card_enigma=true;
		card_type_a=07; card_type_b=-1;
		card_base_hp=55; card_base_atk=50+175; card_base_def=65+105;
		card_grid_x=9; card_grid_y=7;} break;
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
		card_has_forms=true;
		card_name="Geodude";
		card_stage=1; card_evo[0]=075;
		if card_form_value<500 {
		card_type_a=10; card_type_b=09;
		card_base_hp=40; card_base_atk=80+30; card_base_def=100+30;
		card_grid_x=3; card_grid_y=8;}
		else {
		card_type_a=10; card_type_b=04;
		card_base_hp=40; card_base_atk=80+30; card_base_def=100+30;
		card_grid_x=4; card_grid_y=8;} break;
	case 075:
		card_has_forms=true;
		card_name="Graveler";
		card_stage=2; card_evo[0]=076;
		if card_form_value<500 {
		card_type_a=10; card_type_b=09;
		card_base_hp=55; card_base_atk=95+45; card_base_def=115+45;
		card_grid_x=5; card_grid_y=8;}
		else {
		card_type_a=10; card_type_b=04;
		card_base_hp=55; card_base_atk=95+45; card_base_def=115+45;
		card_grid_x=6; card_grid_y=8;} break;
	case 076:
		card_has_forms=true;
		card_name="Golem";
		card_stage=3;
		if card_form_value<500 {
		card_type_a=10; card_type_b=09;
		card_base_hp=80; card_base_atk=120+55; card_base_def=130+65;
		card_grid_x=7; card_grid_y=8;}
		else {
		card_type_a=10; card_type_b=04;
		card_base_hp=80; card_base_atk=120+55; card_base_def=130+65;
		card_grid_x=8; card_grid_y=8;} break;
	case 077:
		card_name="Ponyta";
		card_stage=1; card_evo[0]=078;
		
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=02; card_type_b=-1;
			card_base_hp=50; card_base_atk=85+65; card_base_def=55+65;
			card_grid_x=9; card_grid_y=8; 
		}else{
			card_sheet=sp_poke_d;
			card_type_a=07; card_type_b=-1;
			card_base_hp=50; card_base_atk=85+65; card_base_def=55+65;
			card_grid_x=11; card_grid_y=9; 
		}
		break;
	case 078:
		card_name="Rapidash";
		card_stage=2;
		
		card_has_forms=true;	
		if card_form_value<500 {
		card_type_a=02; card_type_b=-1;
		card_base_hp=65; card_base_atk=100+80; card_base_def=70+80;
		card_grid_x=10; card_grid_y=8; 
		}else{
		card_sheet=sp_poke_d;
		card_type_a=07; card_type_b=8;
		card_base_hp=65; card_base_atk=100+80; card_base_def=70+80;
		card_grid_x=12; card_grid_y=9; 
		}
		break;
	case 079:
		card_has_forms=true;	
		card_name="Slowpoke";
		card_stage=1; card_evo[0]=080; card_evo[1]=199;
		if card_form_value<500 {
			card_type_a=03; card_type_b=07;
			card_base_hp=90; card_base_atk=65+40; card_base_def=65+40;
			card_grid_x=11; card_grid_y=8; 
		}else{
			card_sheet=sp_poke_d;
			card_type_a=07; card_type_b=-1;
			card_base_hp=90; card_base_atk=65+40; card_base_def=65+40;
			card_grid_x=13; card_grid_y=9; 
		}
		break;
	case 080:
		card_has_forms=true;	
		card_name="Slowbro";
		card_stage=2;
		
		if card_form_value<500 {
			card_can_mega=true;
			card_type_a=03; card_type_b=07;
			card_base_hp=95; card_base_atk=75+100; card_base_def=110+80;
			card_grid_x=12; card_grid_y=8;
		}else if card_form_value<=999{
			card_sheet=sp_poke_d;
			card_can_mega=false;
			card_type_a=12; card_type_b=07;
			card_base_hp=95; card_base_atk=100+100; card_base_def=95+70;
			card_grid_x=14; card_grid_y=9;
		}
			
		else {
		card_name="M-Slowbro";
		card_stage=2; card_enigma=true;
		card_type_a=03; card_type_b=07;
		card_base_hp=95; card_base_atk=75+130; card_base_def=180+80;
		card_grid_x=13; card_grid_y=8;} break;
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
		card_has_forms=true;
		card_name="Farfetch'd";
		
		if card_form_value<500 {
			card_stage=1;
			card_type_a=00; card_type_b=05;
			card_base_hp=52; card_base_atk=90+58; card_base_def=55+62;
			card_grid_x=1; card_grid_y=9; 
		}
		else {
			card_sheet=sp_poke_d;
			card_stage=1; card_evo[0]=865;
			card_type_a=06; card_type_b=-1;
			card_base_hp=52; card_base_atk=95+58; card_base_def=55+62;
			card_grid_x=15; card_grid_y=9; 
		}
		break;
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
		card_has_forms=true;
		card_name="Grimer";
		card_stage=1; card_evo[0]=089;
		if card_form_value<500 {
		card_type_a=12; card_type_b=-1;
		card_base_hp=80; card_base_atk=80+40; card_base_def=50+50;
		card_grid_x=6; card_grid_y=9;}
		else {
		card_type_a=12; card_type_b=17;
		card_base_hp=80; card_base_atk=80+40; card_base_def=50+50;
		card_grid_x=7; card_grid_y=9;} break;
	case 089:
		card_has_forms=true;
		card_name="Muk";
		card_stage=2;
		if card_form_value<500 {
		card_type_a=12; card_type_b=-1;
		card_base_hp=105; card_base_atk=105+65; card_base_def=75+100;
		card_grid_x=8; card_grid_y=9;}
		else {
		card_type_a=12; card_type_b=17;
		card_base_hp=105; card_base_atk=105+65; card_base_def=75+100;
		card_grid_x=9; card_grid_y=9;} break;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Gengar";
		card_stage=3;
		card_type_a=16; card_type_b=12;
		card_base_hp=60; card_base_atk=65+130; card_base_def=60+75;
		card_grid_x=15; card_grid_y=9;}
		else {
		card_name="M-Gengar";
		card_stage=3; card_enigma=true;
		card_type_a=16; card_type_b=12;
		card_base_hp=60; card_base_atk=65+170; card_base_def=80+95;
		card_grid_x=1; card_grid_y=10;} break;
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
		
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=04; card_type_b=-1;
			card_base_hp=40; card_base_atk=30+55; card_base_def=50+55;
			card_grid_x=8; card_grid_y=10; 
		}
		else {
			card_sheet=sp_poke_d;
			card_type_a=04; card_type_b=1;
			card_base_hp=40; card_base_atk=30+55; card_base_def=50+55;
			card_grid_x=3; card_grid_y=10; }
		break;
	case 101:
		card_name="Electrode";
		card_stage=2;
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=04; card_type_b=-1;
			card_base_hp=60; card_base_atk=50+80; card_base_def=70+80;
			card_grid_x=9; card_grid_y=10; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=04; card_type_b=1;
			card_base_hp=60; card_base_atk=50+80; card_base_def=70+80;
			card_grid_x=4; card_grid_y=10; }
		break;
	case 102:
		card_name="Exeggcute";
		card_stage=1; card_evo[0]=103;
		card_type_a=01; card_type_b=07;
		card_base_hp=60; card_base_atk=40+60; card_base_def=80+45;
		card_grid_x=10; card_grid_y=10; break;
	case 103:
		card_has_forms=true;
		card_name="Exeggutor";
		card_stage=2;
		if card_form_value<500 {
		card_type_a=01; card_type_b=07;
		card_base_hp=95; card_base_atk=95+125; card_base_def=85+75;
		card_grid_x=11; card_grid_y=10;}
		else {
		card_type_a=01; card_type_b=14;
		card_base_hp=95; card_base_atk=105+125; card_base_def=85+75;
		card_grid_x=12; card_grid_y=10;} break;
	case 104:
		card_name="Cubone";
		card_stage=1; card_evo[0]=105;
		card_type_a=09; card_type_b=-1;
		card_base_hp=50; card_base_atk=50+40; card_base_def=95+50;
		card_grid_x=13; card_grid_y=10; break;
	case 105:
		card_has_forms=true;
		card_name="Marowak";
		card_stage=2;
		if card_form_value<500 {
		card_type_a=09; card_type_b=-1;
		card_base_hp=60; card_base_atk=80+50; card_base_def=110+80;
		card_grid_x=14; card_grid_y=10;}
		else {
		card_type_a=02; card_type_b=16;
		card_base_hp=60; card_base_atk=80+50; card_base_def=110+80;
		card_grid_x=15; card_grid_y=10;} break;
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
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=12; card_type_b=-1;
			card_base_hp=65; card_base_atk=90+85; card_base_def=120+70;
			card_grid_x=5; card_grid_y=11; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=12; card_type_b=08;
			card_base_hp=65; card_base_atk=90+85; card_base_def=120+70;
			card_grid_x=5; card_grid_y=10; }
		
		break;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Kangaskhan";
		card_stage=1;
		card_type_a=00; card_type_b=-1;
		card_base_hp=105; card_base_atk=95+40; card_base_def=80+80;
		card_grid_x=10; card_grid_y=11;}
		else {
		card_name="M-Kangaskhan";
		card_stage=1; card_enigma=true;
		card_type_a=00; card_type_b=-1;
		card_base_hp=105; card_base_atk=125+60; card_base_def=100+100;
		card_grid_x=11; card_grid_y=11;} break;
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
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=07; card_type_b=08;
			card_base_hp=40; card_base_atk=45+100; card_base_def=65+120;
			card_grid_x=3; card_grid_y=12;}
		else {
			card_evo[0]=866;
			card_sheet=sp_poke_d;
			card_type_a=13; card_type_b=07;
			card_base_hp=50; card_base_atk=65+90; card_base_def=65+90;
			card_grid_x=6; card_grid_y=10; }
		break;
		
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Pinsir";
		card_stage=1;
		card_type_a=11; card_type_b=-1;
		card_base_hp=65; card_base_atk=125+55; card_base_def=100+70;
		card_grid_x=8; card_grid_y=12;}
		else {
		card_name="M-Pinsir";
		card_stage=1; card_enigma=true;
		card_type_a=11; card_type_b=05;
		card_base_hp=65; card_base_atk=155+65; card_base_def=120+90;
		card_grid_x=9; card_grid_y=12;} break;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Gyarados";
		card_stage=2;
		card_type_a=03; card_type_b=05;
		card_base_hp=95; card_base_atk=125+60; card_base_def=79+100;
		card_grid_x=12; card_grid_y=12;}
		else {
		card_name="M-Gyarados";
		card_stage=2; card_enigma=true;
		card_type_a=03; card_type_b=17;
		card_base_hp=95; card_base_atk=155+70; card_base_def=109+130;
		card_grid_x=13; card_grid_y=12;} break;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Aerodactyl";
		card_stage=1; card_fossil=true;
		card_type_a=10; card_type_b=05;
		card_base_hp=80; card_base_atk=105+60; card_base_def=65+75;
		card_grid_x=10; card_grid_y=13;}
		else {
		card_name="M-Aerodactyl";
		card_stage=1; card_fossil=true; card_enigma=true;
		card_type_a=10; card_type_b=05;
		card_base_hp=80; card_base_atk=135+70; card_base_def=85+95;
		card_grid_x=11; card_grid_y=13;} break;
	case 143:
		card_name="Snorlax";
		card_stage=1;
		card_type_a=00; card_type_b=-1;
		card_base_hp=160; card_base_atk=110+65; card_base_def=65+110;
		card_grid_x=12; card_grid_y=13; break;
	case 144:
		card_name="Articuno";
		card_stage=1; card_enigma=true;
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=13; card_type_b=05;
			card_base_hp=90; card_base_atk=85+95; card_base_def=100+125;
			card_grid_x=13; card_grid_y=13; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=7; card_type_b=05;
			card_base_hp=90; card_base_atk=85+125; card_base_def=85+100;
			card_grid_x=10; card_grid_y=10; }
		break;
	case 145:
		card_name="Zapdos";
		card_stage=1; card_enigma=true;
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=04; card_type_b=05;
			card_base_hp=90; card_base_atk=90+125; card_base_def=85+90;
			card_grid_x=14; card_grid_y=13; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=06; card_type_b=05;
			card_base_hp=90; card_base_atk=125+85; card_base_def=90+90;
			card_grid_x=11; card_grid_y=10; }
		break;
	case 146:
		card_name="Moltres";
		card_stage=1; card_enigma=true;
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=02; card_type_b=05;
			card_base_hp=90; card_base_atk=100+125; card_base_def=90+85;
			card_grid_x=15; card_grid_y=13; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=17; card_type_b=05;
			card_base_hp=90; card_base_atk=85+100; card_base_def=90+125;
			card_grid_x=12; card_grid_y=10; }
		break;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Mewtwo";
		card_stage=1; card_enigma=true;
		card_type_a=07; card_type_b=-1;
		card_base_hp=106; card_base_atk=110+154; card_base_def=90+90;
		card_grid_x=4; card_grid_y=14;}
		else if card_form_value=1000{
		card_name="M-Mewtwo X";
		card_form_change=true;
		card_has_forms=true;
		card_stage=1; card_enigma=true;
		card_type_a=07; card_type_b=-1;
		card_base_hp=106; card_base_atk=190+154; card_base_def=100+100;
		card_grid_x=5; card_grid_y=14;}
		else{
		card_name="M-Mewtwo Y";
		card_form_change=true;
		card_has_forms=true;
		card_stage=1; card_enigma=true;
		card_type_a=07; card_type_b=-1;
		card_base_hp=106; card_base_atk=150+194; card_base_def=70+120;
		card_grid_x=6; card_grid_y=14;} 
		break;
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
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=02; card_type_b=-1;
			card_base_hp=78; card_base_atk=84+109; card_base_def=78+85;
			card_grid_x=6; card_grid_y=15; 
		}
		else {
			card_sheet=sp_poke_d;
			card_type_a=02; card_type_b=16;
			card_base_hp=73; card_base_atk=84+119; card_base_def=78+85;
			card_grid_x=13; card_grid_y=10; 
		}
		break;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Ampharos";
		card_stage=3;
		card_type_a=04; card_type_b=-1;
		card_base_hp=90; card_base_atk=75+115; card_base_def=85+90;
		card_grid_x=3; card_grid_y=17;}
		else {
		card_name="M-Ampharos";
		card_stage=3; card_enigma=true;
		card_type_a=04; card_type_b=14;
		card_base_hp=90; card_base_atk=95+165; card_base_def=105+110;
		card_grid_x=4; card_grid_y=17;}
		break;
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
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=03; card_type_b=07;
			card_base_hp=95; card_base_atk=75+100; card_base_def=80+110;
			card_grid_x=8; card_grid_y=18; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=12; card_type_b=07;
			card_base_hp=95; card_base_atk=65+110; card_base_def=80+110;
			card_grid_x=14; card_grid_y=10; }
		break;
	case 200:
		card_name="Misdreavus";
		card_stage=1; card_evo[0]=429;
		card_type_a=16; card_type_b=-1;
		card_base_hp=60; card_base_atk=60+85; card_base_def=60+85;
		card_grid_x=9; card_grid_y=18; break;
	case 201:
		card_has_forms=true;
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
		card_stage=2;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Steelix";
		card_stage=2;
		card_type_a=15; card_type_b=09;
		card_base_hp=75; card_base_atk=85+55; card_base_def=200+65;
		card_grid_x=2; card_grid_y=22;}
		else {
		card_name="M-Steelix";
		card_stage=2; card_enigma=true;
		card_type_a=15; card_type_b=09;
		card_base_hp=75; card_base_atk=125+55; card_base_def=230+95;
		card_grid_x=3; card_grid_y=22;} break;
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
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=03; card_type_b=12;
			card_base_hp=65; card_base_atk=95+55; card_base_def=85+55;
			card_grid_x=6; card_grid_y=22; }
		else {
			card_evo[0]=904;
			card_sheet=sp_poke_d;
			card_type_a=17; card_type_b=12;
			card_base_hp=65; card_base_atk=95+55; card_base_def=85+55;
			card_grid_x=15; card_grid_y=10; }
		break;
	case 212:
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Scizor";
		card_stage=2;
		card_type_a=11; card_type_b=15;
		card_base_hp=70; card_base_atk=130+55; card_base_def=100+80;
		card_grid_x=7; card_grid_y=22;}
		else {
		card_name="M-Scizor";
		card_stage=2; card_enigma=true;
		card_type_a=11; card_type_b=15;
		card_base_hp=70; card_base_atk=150+65; card_base_def=140+100;
		card_grid_x=8; card_grid_y=22;} break;
	case 213:
		card_name="Shuckle";
		card_stage=1;
		card_type_a=11; card_type_b=10;
		card_base_hp=20; card_base_atk=10+10; card_base_def=230+230;
		card_grid_x=9; card_grid_y=22; break;
	case 214:
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Heracross";
		card_stage=1;
		card_type_a=11; card_type_b=06;
		card_base_hp=80; card_base_atk=125+40; card_base_def=75+95;
		card_grid_x=10; card_grid_y=22;}
		else {
		card_name="M-Heracross";
		card_stage=1; card_enigma=true;
		card_type_a=11; card_type_b=06;
		card_base_hp=80; card_base_atk=185+40; card_base_def=115+105;
		card_grid_x=11; card_grid_y=22;} break;
	case 215:
		card_name="Sneasel";
		card_has_forms=true;	
		if card_form_value<500 {
			card_stage=1; card_evo[0]=461;
			card_type_a=17; card_type_b=13;
			card_base_hp=55; card_base_atk=95+35; card_base_def=55+75;
			card_grid_x=12; card_grid_y=22; }
		else {
			card_sheet=sp_poke_d;
			card_stage=1; card_evo[0]=903;
			card_type_a=12; card_type_b=6;
			card_base_hp=55; card_base_atk=95+35; card_base_def=55+75;
			card_grid_x=1; card_grid_y=11; }
		break;
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
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=03; card_type_b=10;
			card_base_hp=65; card_base_atk=55+65; card_base_def=95+95;
			card_grid_x=6; card_grid_y=23; }
		else {
			card_evo[0]=864;
			card_sheet=sp_poke_d;
			card_type_a=16; card_type_b=-1;
			card_base_hp=60; card_base_atk=55+65; card_base_def=100+100;
			card_grid_x=2; card_grid_y=11; }
			
		break;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Houndoom";
		card_stage=2;
		card_type_a=17; card_type_b=02;
		card_base_hp=75; card_base_atk=90+110; card_base_def=50+80;
		card_grid_x=13; card_grid_y=23;}
		else {
		card_name="M-Houndoom";
		card_stage=2; card_enigma=true;
		card_type_a=17; card_type_b=02;
		card_base_hp=75; card_base_atk=90+140; card_base_def=90+90;
		card_grid_x=14; card_grid_y=23;} break;
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Tyranitar";
		card_stage=3; card_pseudo=true;
		card_type_a=10; card_type_b=17;
		card_base_hp=100; card_base_atk=134+95; card_base_def=110+100;
		card_grid_x=3; card_grid_y=25;}
		else {
		card_name="M-Tyranitar";
		card_stage=3; card_pseudo=true; card_enigma=true;
		card_type_a=10; card_type_b=17;
		card_base_hp=100; card_base_atk=164+95; card_base_def=150+120;
		card_grid_x=4; card_grid_y=25;} break;
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
	
	// Gen 3
	
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Sceptile";
		card_stage=3;
		card_type_a=01; card_type_b=-1; card_starter=true;
		card_base_hp=70; card_base_atk=85+105; card_base_def=65+85;
		card_grid_x=3; card_grid_y=26;}
		else {
		card_name="M-Sceptile";
		card_stage=3; card_enigma=true;
		card_type_a=01; card_type_b=14; card_starter=true;
		card_base_hp=70; card_base_atk=110+145; card_base_def=75+85;
		card_grid_x=4; card_grid_y=26;} break;
		
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Blaziken";
		card_stage=3; card_starter=true;
		card_type_a=02; card_type_b=06;
		card_base_hp=80; card_base_atk=120+110; card_base_def=70+70;
		card_grid_x=7; card_grid_y=26;}
		else {
		card_name="M-Blaziken";
		card_stage=3; card_starter=true; card_enigma=true;
		card_type_a=02; card_type_b=06;
		card_base_hp=80; card_base_atk=160+130; card_base_def=80+80;
		card_grid_x=8; card_grid_y=26;} break;
		
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
		card_can_mega=true;
		if card_form_value<=999{
		card_name="Swampert";
		card_stage=3; card_starter=true;
		card_type_a=03; card_type_b=09;
		card_base_hp=100; card_base_atk=110+85; card_base_def=90+90;
		card_grid_x=11; card_grid_y=26;}
		else {
		card_name="M-Swampert";
		card_stage=3; card_starter=true; card_enigma=true;
		card_type_a=03; card_type_b=09;
		card_base_hp=100; card_base_atk=150+95; card_base_def=110+110;
		card_grid_x=12; card_grid_y=26;} break;
		
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
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=00; card_type_b=-1;
			card_base_hp=38; card_base_atk=30+30; card_base_def=41+41;
			card_grid_x=15; card_grid_y=26; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=16; card_type_b=00;
			card_base_hp=38; card_base_atk=30+30; card_base_def=41+41;
			card_grid_x=3; card_grid_y=11; }
		break;
		
	case 264:
		card_name="Linoone";
		card_stage=2;
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=00; card_type_b=-1;
			card_base_hp=78; card_base_atk=70+50; card_base_def=61+61;
			card_grid_x=1; card_grid_y=27; }
		else {
			card_sheet=sp_poke_d; card_evo[0]=862;
			card_type_a=16; card_type_b=00;
			card_base_hp=78; card_base_atk=70+50; card_base_def=61+61;
			card_grid_x=4; card_grid_y=11; }
		break;
		
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
		
	case 273:
		card_name="Seedot";
		card_stage=1; card_evo[0]=274;
		card_type_a=1; card_type_b=-1;
		card_base_hp=40; card_base_atk=40+30; card_base_def=50+30;
		card_grid_x=10; card_grid_y=27; break;
		
	case 274:
		card_name="Nuzleaf";
		card_stage=2; card_evo[0]=275;
		card_type_a=1; card_type_b=17;
		card_base_hp=70; card_base_atk=70+60; card_base_def=40+40;
		card_grid_x=11; card_grid_y=27; break;
		
	case 275:
		card_name="Shiftry";
		card_stage=3;
		card_type_a=1; card_type_b=17;
		card_base_hp=90; card_base_atk=100+90; card_base_def=60+60;
		card_grid_x=12; card_grid_y=27; break;
		
	case 276:
		card_name="Taillow";
		card_stage=1; card_evo[0]=277;
		card_type_a=0; card_type_b=5;
		card_base_hp=40; card_base_atk=55+30; card_base_def=30+30;
		card_grid_x=13; card_grid_y=27; break;
		
	case 277:
		card_name="Swellow";
		card_stage=2;
		card_type_a=0; card_type_b=5;
		card_base_hp=60; card_base_atk=85+75; card_base_def=60+50;
		card_grid_x=14; card_grid_y=27; break;
		
	case 278:
		card_name="Wingull";
		card_stage=1; card_evo[0]=279;
		card_type_a=3; card_type_b=5;
		card_base_hp=40; card_base_atk=30+55; card_base_def=30+30;
		card_grid_x=15; card_grid_y=27; break;
		
	case 279:
		card_name="Pelipper";
		card_stage=2;
		card_type_a=3; card_type_b=5;
		card_base_hp=60; card_base_atk=50+95; card_base_def=100+70;
		card_grid_x=1; card_grid_y=28; break;
		
	case 280:
		card_name="Ralts";
		card_stage=1; card_evo[0]=281;
		card_type_a=7; card_type_b=8;
		card_base_hp=28; card_base_atk=25+45; card_base_def=25+35;
		card_grid_x=2; card_grid_y=28; break;
		
	case 281:
		card_name="Kirlia";
		card_stage=2; card_evo[0]=282; card_evo[1]=475;
		card_type_a=7; card_type_b=8;
		card_base_hp=38; card_base_atk=35+65; card_base_def=35+55;
		card_grid_x=3; card_grid_y=28; break;
		
	case 282:
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Gardevoir";
		card_stage=3;
		card_type_a=7; card_type_b=8;
		card_base_hp=68; card_base_atk=65+125; card_base_def=65+115;
		card_grid_x=4; card_grid_y=28;}
		else {
		card_name="M-Gardevoir";
		card_stage=3; card_enigma=true;
		card_type_a=7; card_type_b=8;
		card_base_hp=68; card_base_atk=85+165; card_base_def=65+135;
		card_grid_x=5; card_grid_y=28;} break;
		
	case 283:
		card_name="Surskit";
		card_stage=1; card_evo[0]=284;
		card_type_a=11; card_type_b=3;
		card_base_hp=40; card_base_atk=30+50; card_base_def=32+52;
		card_grid_x=6; card_grid_y=28; break;
		
	case 284:
		card_name="Masquerain";
		card_stage=2;
		card_type_a=11; card_type_b=5;
		card_base_hp=70; card_base_atk=60+100; card_base_def=62+82;
		card_grid_x=7; card_grid_y=28; break;
		
	case 285:
		card_name="Shroomish";
		card_stage=1; card_evo[0]=286;
		card_type_a=1; card_type_b=-1;
		card_base_hp=60; card_base_atk=40+40; card_base_def=60+60;
		card_grid_x=8; card_grid_y=28; break;
		
	case 286:
		card_name="Breloom";
		card_stage=2;
		card_type_a=1; card_type_b=6;
		card_base_hp=60; card_base_atk=130+60; card_base_def=80+60;
		card_grid_x=9; card_grid_y=28; break;
		
	case 287:
		card_name="Slakoth";
		card_stage=1; card_evo[0]=288;
		card_type_a=0; card_type_b=-1;
		card_base_hp=60; card_base_atk=60+35; card_base_def=60+35;
		card_grid_x=10; card_grid_y=28; break;
		
	case 288:
		card_name="Vigoroth";
		card_stage=2; card_evo[0]=289;
		card_type_a=0; card_type_b=-1;
		card_base_hp=80; card_base_atk=80+55; card_base_def=80+55;
		card_grid_x=11; card_grid_y=28; break;
		
	case 289:
		card_name="Slaking";
		card_stage=3;
		card_type_a=0; card_type_b=-1;
		card_base_hp=150; card_base_atk=160+95; card_base_def=100+65;
		card_grid_x=12; card_grid_y=28; break;
		
	case 290:
		card_name="Nincada";
		card_stage=1; card_evo[0]=291; card_evo[1]=292;
		card_type_a=11; card_type_b=9;
		card_base_hp=31; card_base_atk=45+30; card_base_def=90+30;
		card_grid_x=13; card_grid_y=28; break;
		
	case 291:
		card_name="Ninjask";
		card_stage=2;
		card_type_a=11; card_type_b=5;
		card_base_hp=61; card_base_atk=90+50; card_base_def=45+50;
		card_grid_x=14; card_grid_y=28; break;
		
	case 292:
		card_name="Shedinja";
		card_stage=2;
		card_type_a=11; card_type_b=16;
		card_base_hp=1; card_base_atk=90+30; card_base_def=45+30;
		card_grid_x=15; card_grid_y=28; break;
		
	case 293:
		card_name="Whismur";
		card_stage=1; card_evo[0]=294;
		card_type_a=0; card_type_b=-1;
		card_base_hp=64; card_base_atk=51+51; card_base_def=23+23;
		card_grid_x=1; card_grid_y=29; break;
		
	case 294:
		card_name="Loudred";
		card_stage=2; card_evo[0]=295;
		card_type_a=0; card_type_b=-1;
		card_base_hp=84; card_base_atk=71+71; card_base_def=43+43;
		card_grid_x=2; card_grid_y=29; break;
		
	case 295:
		card_name="Exploud";
		card_stage=3;
		card_type_a=0; card_type_b=-1;
		card_base_hp=104; card_base_atk=91+91; card_base_def=63+73;
		card_grid_x=3; card_grid_y=29; break;
		
	case 296:
		card_name="Makuhita";
		card_stage=1; card_evo[0]=297;
		card_type_a=6; card_type_b=-1;
		card_base_hp=72; card_base_atk=60+20; card_base_def=30+30;
		card_grid_x=4; card_grid_y=29; break;
		
	case 297:
		card_name="Hariyama";
		card_stage=2;
		card_type_a=6; card_type_b=-1;
		card_base_hp=144; card_base_atk=120+40; card_base_def=60+60;
		card_grid_x=5; card_grid_y=29; break;
		
	case 298:
		card_name="Azurill";
		card_stage=1; card_evo[0]=183;
		card_type_a=0; card_type_b=8;
		card_base_hp=50; card_base_atk=20+20; card_base_def=40+40;
		card_grid_x=6; card_grid_y=29; break;
		
	case 299:
		card_name="Nosepass";
		card_stage=1;  card_evo[0]=476;
		card_type_a=10; card_type_b=-1;
		card_base_hp=30; card_base_atk=45+45; card_base_def=135+90;
		card_grid_x=7; card_grid_y=29; break;
		
	case 300:
		card_name="Skitty";
		card_stage=1; card_evo[0]=301;
		card_type_a=0; card_type_b=-1;
		card_base_hp=50; card_base_atk=45+35; card_base_def=45+35;
		card_grid_x=8; card_grid_y=29; break;
		
	case 301:
		card_name="Delcatty";
		card_stage=2;
		card_type_a=0; card_type_b=-1;
		card_base_hp=70; card_base_atk=65+55; card_base_def=65+55;
		card_grid_x=9; card_grid_y=29; break;
		
	case 302:
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Sableye";
		card_stage=1;
		card_type_a=17; card_type_b=16;
		card_base_hp=50; card_base_atk=75+65; card_base_def=75+65;
		card_grid_x=10; card_grid_y=29;}
		else { 
		card_name="M-Sableye";
		card_stage=1; card_enigma=true;
		card_type_a=17; card_type_b=16;
		card_base_hp=50; card_base_atk=85+85; card_base_def=125+115;
		card_grid_x=11; card_grid_y=29;} break;
		
	case 0303:
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Mawile";
		card_stage=1;
		card_type_a=15; card_type_b=8;
		card_base_hp=50; card_base_atk=85+55; card_base_def=85+55;
		card_grid_x=12; card_grid_y=29;}
		else {
		card_name="M-Mawile";
		card_stage=1; card_enigma=true;
		card_type_a=15; card_type_b=8;
		card_base_hp=50; card_base_atk=210+55; card_base_def=125+95;
		card_grid_x=13; card_grid_y=29;} break;
		
	case 0304: card_name="Aron"; card_stage=1; card_evo[0]=305; card_type_a=15; card_type_b=10; card_base_hp=50; card_base_atk=70+40; card_base_def=100+40; card_grid_x=14; card_grid_y=29; break;
	case 0305: card_name="Lairon"; card_stage=2; card_evo[0]=306; card_starter=false; card_type_a=15; card_type_b=10; card_base_hp=60; card_base_atk=90+50; card_base_def=140+50; card_grid_x=15; card_grid_y=29; break;
	case 0306: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Aggron"; 
		card_stage=3; card_starter=false; 
		card_type_a=15; card_type_b=10; 
		card_base_hp=70; card_base_atk=110+60; card_base_def=180+60; 
		card_grid_x=1; card_grid_y=30;}
		else {
		card_name="M-Aggron"; 
		card_stage=3; card_starter=false; card_enigma=true;
		card_type_a=15; card_type_b=-1; 
		card_base_hp=70; card_base_atk=140+60; card_base_def=230+80; 
		card_grid_x=2; card_grid_y=30;} break;
		
	case 0307: card_name="Meditite"; card_stage=1; card_evo[0]=308; card_starter=false; card_type_a=6; card_type_b=7; card_base_hp=30; card_base_atk=40+40; card_base_def=55+55; card_grid_x=3; card_grid_y=30; break;
	case 0308: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Medicham"; 
		card_stage=2; card_starter=false; 
		card_type_a=6; card_type_b=7; 
		card_base_hp=60; card_base_atk=60+60; card_base_def=75+75; 
		card_grid_x=4; card_grid_y=30;}
		else {
		card_name="M-Medicham"; 
		card_stage=2; card_starter=false; card_enigma=true;
		card_type_a=6; card_type_b=7; 
		card_base_hp=60; card_base_atk=200+80; card_base_def=85+85; 
		card_grid_x=5; card_grid_y=30;}		break;
		
	case 0309: card_name="Electrike"; card_stage=1; card_evo[0]=310; card_starter=false; card_type_a=4; card_type_b=-1; card_base_hp=40; card_base_atk=45+65; card_base_def=40+40; card_grid_x=6; card_grid_y=30; break;
	case 0310: 
		card_name="Manectric"; 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Manectric"; 
		card_stage=2; card_starter=false; 
		card_type_a=4; card_type_b=-1; 
		card_base_hp=70; card_base_atk=75+105; card_base_def=60+60; 
		card_grid_x=7; card_grid_y=30;}
		else {
		card_name="M-Manectric"; 
		card_stage=2; card_starter=false; card_enigma=true;
		card_type_a=4; card_type_b=-1; 
		card_base_hp=70; card_base_atk=75+135; card_base_def=80+80; 
		card_grid_x=8; card_grid_y=30;} break;
	
	case 0311: card_name="Plusle"; card_stage=1; card_starter=false; card_type_a=4; card_type_b=-1; card_base_hp=60; card_base_atk=50+85; card_base_def=40+75; card_grid_x=9; card_grid_y=30; break;
	case 0312: card_name="Minun"; card_stage=1; card_starter=false; card_type_a=4; card_type_b=-1; card_base_hp=60; card_base_atk=40+75; card_base_def=50+85; card_grid_x=10; card_grid_y=30; break;
	
	case 0313: card_name="Volbeat"; card_stage=1; card_starter=false; card_type_a=11; card_type_b=-1; card_base_hp=65; card_base_atk=73+47; card_base_def=75+85; card_grid_x=11; card_grid_y=30; break;
	case 0314: card_name="Illumise"; card_stage=1; card_starter=false; card_type_a=11; card_type_b=-1; card_base_hp=65; card_base_atk=47+73; card_base_def=75+85; card_grid_x=12; card_grid_y=30; break;
	case 0315: card_name="Roselia"; card_stage=2; card_evo[0]=407; card_starter=false; card_type_a=1; card_type_b=12; card_base_hp=50; card_base_atk=60+100; card_base_def=45+80; card_grid_x=13; card_grid_y=30; break;
	case 0316: card_name="Gulpin"; card_stage=1; card_evo[0]=317; card_starter=false; card_type_a=12; card_type_b=-1; card_base_hp=70; card_base_atk=43+43; card_base_def=53+53; card_grid_x=15; card_grid_y=30; break;
	case 0317: card_name="Swalot"; card_stage=2; card_starter=false; card_type_a=12; card_type_b=-1; card_base_hp=100; card_base_atk=73+73; card_base_def=83+83; card_grid_x=1; card_grid_y=31; break;
	case 0318: card_name="Carvanha"; card_stage=1; card_evo[0]=319; card_starter=false; card_type_a=3; card_type_b=17; card_base_hp=45; card_base_atk=90+65; card_base_def=20+20; card_grid_x=2; card_grid_y=31; break;
	case 0319: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Sharpedo"; 
		card_stage=2; card_starter=false; 
		card_type_a=3; card_type_b=17; 
		card_base_hp=70; card_base_atk=120+95; card_base_def=40+40; 
		card_grid_x=3; card_grid_y=31;}
		else {
		card_name="M-Sharpedo"; 
		card_stage=2; card_starter=false; card_enigma=true;
		card_type_a=3; card_type_b=17; 
		card_base_hp=70; card_base_atk=140+110; card_base_def=70+65; 
		card_grid_x=4; card_grid_y=31;} break;
	
	case 0320: card_name="Wailmer"; card_stage=1; card_evo[0]=321; card_starter=false; card_type_a=3; card_type_b=-1; card_base_hp=130; card_base_atk=70+70; card_base_def=35+35; card_grid_x=5; card_grid_y=31; break;
	case 0321: card_name="Wailord"; card_stage=2; card_starter=false; card_type_a=3; card_type_b=-1; card_base_hp=170; card_base_atk=90+90; card_base_def=45+45; card_grid_x=6; card_grid_y=31; break;
	case 0322: card_name="Numel"; card_stage=1; card_evo[0]=323; card_starter=false; card_type_a=2; card_type_b=9; card_base_hp=60; card_base_atk=60+65; card_base_def=40+45; card_grid_x=7; card_grid_y=31; break;
	case 0323: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Camerupt"; 
		card_stage=2; card_starter=false; 
		card_type_a=2; card_type_b=9; 
		card_base_hp=70; card_base_atk=100+105; card_base_def=70+75; 
		card_grid_x=8; card_grid_y=31;}
		else {
		card_name="M-Camerupt"; 
		card_stage=2; card_starter=false; card_enigma=true;
		card_type_a=2; card_type_b=9; 
		card_base_hp=70; card_base_atk=120+145; card_base_def=100+105; 
		card_grid_x=9; card_grid_y=31;} break;
		
	case 0324: card_name="Torkoal"; card_stage=1; card_starter=false; card_type_a=2; card_type_b=-1; card_base_hp=70; card_base_atk=85+85; card_base_def=140+70; card_grid_x=10; card_grid_y=31; break;
	case 0325: card_name="Spoink"; card_stage=1; card_evo[0]=326; card_starter=false; card_type_a=7; card_type_b=-1; card_base_hp=60; card_base_atk=25+70; card_base_def=35+80; card_grid_x=11; card_grid_y=31; break;
	case 0326: card_name="Grumpig"; card_stage=2; card_starter=false; card_type_a=7; card_type_b=-1; card_base_hp=80; card_base_atk=45+90; card_base_def=65+110; card_grid_x=12; card_grid_y=31; break;
	case 0327: card_name="Spinda"; card_stage=1; card_starter=false; card_type_a=0; card_type_b=-1; card_base_hp=60; card_base_atk=60+60; card_base_def=60+60; card_grid_x=13; card_grid_y=31; break;
	case 0328: card_name="Trapinch"; card_stage=1; card_evo[0]=329; card_starter=false; card_type_a=9; card_type_b=-1; card_base_hp=45; card_base_atk=100+45; card_base_def=45+45; card_grid_x=14; card_grid_y=31; break;
	case 0329: card_name="Vibrava"; card_stage=2; card_evo[0]=330; card_starter=false; card_type_a=9; card_type_b=14; card_base_hp=50; card_base_atk=70+50; card_base_def=50+50; card_grid_x=15; card_grid_y=31; break;
	case 0330: card_name="Flygon"; card_stage=3; card_starter=false; card_type_a=9; card_type_b=14; card_base_hp=80; card_base_atk=100+80; card_base_def=80+80; card_grid_x=1; card_grid_y=32; break;
	case 0331: card_name="Cacnea"; card_stage=1; card_evo[0]=332; card_starter=false; card_type_a=1; card_type_b=-1; card_base_hp=50; card_base_atk=85+85; card_base_def=40+40; card_grid_x=2; card_grid_y=32; break;
	case 0332: card_name="Cacturne"; card_stage=2; card_starter=false; card_type_a=1; card_type_b=17; card_base_hp=70; card_base_atk=115+115; card_base_def=60+60; card_grid_x=3; card_grid_y=32; break;
	case 0333: card_name="Swablu"; card_stage=1; card_evo[0]=334; card_starter=false; card_type_a=0; card_type_b=5; card_base_hp=45; card_base_atk=40+40; card_base_def=60+75; card_grid_x=4; card_grid_y=32; break;
	case 0334: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Altaria"; 
		card_stage=2; card_starter=false; 
		card_type_a=14; card_type_b=5; 
		card_base_hp=75; card_base_atk=70+70; card_base_def=90+105; 
		card_grid_x=5; card_grid_y=32;}
		else {
		card_name="M-Altaria"; 
		card_stage=2; card_starter=false; card_enigma=true;
		card_type_a=14; card_type_b=8; 
		card_base_hp=75; card_base_atk=110+110; card_base_def=110+105; 
		card_grid_x=6; card_grid_y=32;} break;
	
	case 0335: card_name="Zangoose"; card_stage=1; card_starter=false; card_type_a=0; card_type_b=-1; card_base_hp=73; card_base_atk=115+60; card_base_def=60+60; card_grid_x=7; card_grid_y=32; break;
	case 0336: card_name="Seviper"; card_stage=1; card_starter=false; card_type_a=12; card_type_b=-1; card_base_hp=73; card_base_atk=100+100; card_base_def=60+60; card_grid_x=9; card_grid_y=32; break;
	case 0337: card_name="Lunatone"; card_stage=1; card_starter=false; card_type_a=10; card_type_b=7; card_base_hp=90; card_base_atk=55+95; card_base_def=65+85; card_grid_x=11; card_grid_y=32; break;
	case 0338: card_name="Solrock"; card_stage=1; card_starter=false; card_type_a=10; card_type_b=7; card_base_hp=90; card_base_atk=95+55; card_base_def=85+65; card_grid_x=12; card_grid_y=32; break;
	case 0339: card_name="Barboach"; card_stage=1; card_evo[0]=340; card_starter=false; card_type_a=3; card_type_b=9; card_base_hp=50; card_base_atk=48+46; card_base_def=43+41; card_grid_x=13; card_grid_y=32; break;
	case 0340: card_name="Whiscash"; card_stage=2; card_starter=false; card_type_a=3; card_type_b=9; card_base_hp=110; card_base_atk=78+76; card_base_def=73+71; card_grid_x=14; card_grid_y=32; break;
	case 0341: card_name="Corphish"; card_stage=1; card_evo[0]=342; card_starter=false; card_type_a=3; card_type_b=-1; card_base_hp=43; card_base_atk=80+50; card_base_def=65+35; card_grid_x=15; card_grid_y=32; break;
	case 0342: card_name="Crawdaunt"; card_stage=2; card_starter=false; card_type_a=3; card_type_b=17; card_base_hp=63; card_base_atk=120+90; card_base_def=85+55; card_grid_x=1; card_grid_y=33; break;
	case 0343: card_name="Baltoy"; card_stage=1; card_evo[0]=344; card_starter=false; card_type_a=9; card_type_b=7; card_base_hp=40; card_base_atk=40+40; card_base_def=55+70; card_grid_x=2; card_grid_y=33; break;
	case 0344: card_name="Claydol"; card_stage=2; card_starter=false; card_type_a=9; card_type_b=7; card_base_hp=60; card_base_atk=70+70; card_base_def=105+120; card_grid_x=3; card_grid_y=33; break;
	case 0345: card_name="Lileep"; card_fossil=true; card_stage=1; card_evo[0]=346; card_starter=false; card_type_a=10; card_type_b=1; card_base_hp=66; card_base_atk=41+61; card_base_def=77+87; card_grid_x=4; card_grid_y=33; break;
	case 0346: card_name="Cradily"; card_fossil=true; card_stage=2; card_starter=false; card_type_a=10; card_type_b=1; card_base_hp=86; card_base_atk=81+81; card_base_def=97+107; card_grid_x=5; card_grid_y=33; break;
	case 0347: card_name="Anorith"; card_fossil=true; card_stage=1; card_evo[0]=348; card_starter=false; card_type_a=10; card_type_b=11; card_base_hp=45; card_base_atk=95+40; card_base_def=50+50; card_grid_x=6; card_grid_y=33; break;
	case 0348: card_name="Armaldo"; card_fossil=true; card_stage=2; card_starter=false; card_type_a=10; card_type_b=11; card_base_hp=75; card_base_atk=125+70; card_base_def=100+80; card_grid_x=7; card_grid_y=33; break;
	case 0349: card_name="Feebas"; card_stage=1; card_evo[0]=350; card_starter=false; card_type_a=3; card_type_b=-1; card_base_hp=20; card_base_atk=15+10; card_base_def=20+55; card_grid_x=8; card_grid_y=33; break;
	case 0350: card_name="Milotic"; card_stage=2; card_starter=false; card_type_a=3; card_type_b=-1; card_base_hp=95; card_base_atk=60+100; card_base_def=79+125; card_grid_x=9; card_grid_y=33; break;
	case 0351: card_form_change=true ;card_has_forms=true; card_name="Castform"; card_stage=1; card_starter=false; 
	if card_form_value<250 { card_type_a=0; card_type_b=-1; card_base_hp=70; card_base_atk=70+70; card_base_def=70+70; card_grid_x=10; card_grid_y=33;}
	else if card_form_value<500 { card_type_a=2; card_type_b=-1; card_base_hp=70; card_base_atk=70+70; card_base_def=70+70; card_grid_x=14; card_grid_y=33;}
	else if card_form_value<750 { card_type_a=3; card_type_b=-1; card_base_hp=70; card_base_atk=70+70; card_base_def=70+70; card_grid_x=11; card_grid_y=33;}
	else { card_type_a=13; card_type_b=-1; card_base_hp=70; card_base_atk=70+70; card_base_def=70+70; card_grid_x=12; card_grid_y=33;}
	break;
	case 0352: card_name="Kecleon"; card_stage=1; card_starter=false; card_type_a=0; card_type_b=-1; card_base_hp=60; card_base_atk=90+60; card_base_def=70+120; card_grid_x=15; card_grid_y=33; break;
	case 0353: card_name="Shuppet"; card_stage=1; card_evo[0]=354; card_starter=false; card_type_a=16; card_type_b=-1; card_base_hp=44; card_base_atk=75+63; card_base_def=35+33; card_grid_x=1; card_grid_y=34; break;
	case 0354: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Banette"; 
		card_stage=2; card_starter=false; 
		card_type_a=16; card_type_b=-1; 
		card_base_hp=64; card_base_atk=115+83; card_base_def=65+63;
		card_grid_x=2; card_grid_y=34; }
		else {
		card_name="M-Banette"; 
		card_stage=2; card_starter=false; card_enigma=true;
		card_type_a=16; card_type_b=-1; 
		card_base_hp=64; card_base_atk=165+93; card_base_def=75+83;
		card_grid_x=3; card_grid_y=34; }
		break;
		
	case 0355: card_name="Duskull"; card_stage=1; card_evo[0]=356; card_starter=false; card_type_a=16; card_type_b=-1; card_base_hp=20; card_base_atk=40+30; card_base_def=90+90; card_grid_x=4; card_grid_y=34; break;
	case 0356: card_name="Dusclops"; card_stage=2; card_evo[0]=477; card_starter=false; card_type_a=16; card_type_b=-1; card_base_hp=40; card_base_atk=70+60; card_base_def=130+130; card_grid_x=5; card_grid_y=34; break;
	case 0357: card_name="Tropius"; card_stage=1; card_starter=false; card_type_a=1; card_type_b=5; card_base_hp=99; card_base_atk=68+72; card_base_def=83+87; card_grid_x=6; card_grid_y=34; break;
	case 0358: card_name="Chimecho"; card_stage=2; card_starter=false; card_type_a=7; card_type_b=-1; card_base_hp=75; card_base_atk=50+95; card_base_def=80+90; card_grid_x=7; card_grid_y=34; break;
	case 0359: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Absol"; 
		card_stage=1; card_starter=false; 
		card_type_a=17; card_type_b=-1; 
		card_base_hp=65; card_base_atk=130+75; card_base_def=60+60; 
		card_grid_x=8; card_grid_y=34;}
		else {
		card_name="M-Absol"; 
		card_stage=1; card_starter=false; card_enigma=true;
		card_type_a=17; card_type_b=-1; 
		card_base_hp=65; card_base_atk=150+115; card_base_def=60+60; 
		card_grid_x=10; card_grid_y=34;}
		break;
		
	case 0360: card_name="Wynaut"; card_stage=1; card_evo[0]=202; card_starter=false; card_type_a=7; card_type_b=-1; card_base_hp=95; card_base_atk=23+23; card_base_def=48+48; card_grid_x=12; card_grid_y=34; break;
	case 0361: card_name="Snorunt"; card_stage=1; card_evo[0]=362; card_evo[1]=478; card_starter=false; card_type_a=13; card_type_b=-1; card_base_hp=50; card_base_atk=50+50; card_base_def=50+50; card_grid_x=13; card_grid_y=34; break;
	case 0362: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Glalie"; 
		card_stage=1;   card_starter=false; 
		card_type_a=13; card_type_b=-1; 
		card_base_hp=80; card_base_atk=80+80; card_base_def=80+80; 
		card_grid_x=14; card_grid_y=34;}
		else {
		card_name="M-Glalie"; 
		card_stage=1;   card_starter=false; card_enigma=true;
		card_type_a=13; card_type_b=-1; 
		card_base_hp=80; card_base_atk=120+120; card_base_def=80+80; 
		card_grid_x=15; card_grid_y=34;}
		break;
		
	case 0363: card_name="Spheal"; card_stage=1; card_evo[0]=364; card_starter=false; card_type_a=13; card_type_b=3; card_base_hp=70; card_base_atk=40+55; card_base_def=50+50; card_grid_x=1; card_grid_y=35; break;
	case 0364: card_name="Sealeo"; card_stage=2; card_evo[0]=365; card_starter=false; card_type_a=13; card_type_b=3; card_base_hp=90; card_base_atk=60+75; card_base_def=70+70; card_grid_x=2; card_grid_y=35; break;
	case 0365: card_name="Walrein"; card_stage=3; card_starter=false; card_type_a=13; card_type_b=3; card_base_hp=110; card_base_atk=80+95; card_base_def=90+90; card_grid_x=3; card_grid_y=35; break;
	case 0366: card_name="Clamperl"; card_stage=1; card_evo[0]=367; card_evo[1]=368; card_starter=false; card_type_a=3; card_type_b=-1; card_base_hp=35; card_base_atk=64+74; card_base_def=85+55; card_grid_x=4; card_grid_y=35; break;
	case 0367: card_name="Huntail"; card_stage=2; card_starter=false; card_type_a=3; card_type_b=-1; card_base_hp=55; card_base_atk=104+94; card_base_def=105+75; card_grid_x=5; card_grid_y=35; break;
	case 0368: card_name="Gorebyss"; card_stage=2; card_starter=false; card_type_a=3; card_type_b=-1; card_base_hp=55; card_base_atk=84+114; card_base_def=105+75; card_grid_x=6; card_grid_y=35; break;
	case 0369: card_name="Relicanth"; card_stage=1;   card_starter=false; card_type_a=3; card_type_b=10; card_base_hp=100; card_base_atk=90+45; card_base_def=130+65; card_grid_x=7; card_grid_y=35; break;
	case 0370: card_name="Luvdisc"; card_stage=1;   card_starter=false; card_type_a=3; card_type_b=-1; card_base_hp=43; card_base_atk=30+40; card_base_def=55+65; card_grid_x=8; card_grid_y=35; break;
	case 0371: card_name="Bagon"; card_pseudo=true; card_stage=1; card_evo[0]=372; card_starter=false; card_type_a=14; card_type_b=-1; card_base_hp=45; card_base_atk=75+40; card_base_def=60+30; card_grid_x=9; card_grid_y=35; break;
	case 0372: card_name="Shelgon"; card_pseudo=true; card_stage=2; card_evo[0]=373; card_starter=false; card_type_a=14; card_type_b=-1; card_base_hp=65; card_base_atk=95+60; card_base_def=100+50; card_grid_x=10; card_grid_y=35; break;
	case 0373: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Salamence"; 
		card_stage=3; card_starter=false;  card_pseudo=true;
		card_type_a=14; card_type_b=5; 
		card_base_hp=95; card_base_atk=135+110; card_base_def=80+80; 
		card_grid_x=11; card_grid_y=35;}
		else {
		card_name="M-Salamence"; 
		card_stage=3; card_starter=false; card_pseudo=true; card_enigma=true;
		card_type_a=14; card_type_b=5; 
		card_base_hp=95; card_base_atk=145+120; card_base_def=130+90; 
		card_grid_x=12; card_grid_y=35;}
		break;
		
	case 0374: card_name="Beldum"; card_pseudo=true; card_stage=1; card_evo[0]=375; card_starter=false; card_type_a=15; card_type_b=7; card_base_hp=40; card_base_atk=55+35; card_base_def=80+60; card_grid_x=13; card_grid_y=35; break;
	case 0375: card_name="Metang"; card_pseudo=true; card_stage=2; card_evo[0]=376; card_starter=false; card_type_a=15; card_type_b=7; card_base_hp=60; card_base_atk=75+55; card_base_def=100+80; card_grid_x=14; card_grid_y=35; break;
	case 0376: 
		card_can_mega=true; card_pseudo=true;
		if card_form_value<=999 {
		card_name="Metagross"; 
		card_stage=3; card_starter=false; 
		card_type_a=15; card_type_b=7; 
		card_base_hp=80; card_base_atk=135+95; card_base_def=130+90; 
		card_grid_x=15; card_grid_y=35;}
		else {
		card_name="M-Metagross"; 
		card_stage=3; card_starter=false; card_enigma=true;
		card_type_a=15; card_type_b=7; 
		card_base_hp=80; card_base_atk=145+105; card_base_def=150+110; 
		card_grid_x=1; card_grid_y=36;}
		break;
		
	case 0377: card_name="Regirock"; card_stage=1; card_starter=false; card_enigma=true; card_type_a=10; card_type_b=-1; card_base_hp=80; card_base_atk=100+50; card_base_def=200+100; card_grid_x=2; card_grid_y=36; break;
	case 0378: card_name="Regice"; card_stage=1; card_starter=false; card_enigma=true; card_type_a=13; card_type_b=-1; card_base_hp=80; card_base_atk=50+100; card_base_def=100+200; card_grid_x=4; card_grid_y=36; break;
	case 0379: card_name="Registeel"; card_stage=1; card_starter=false; card_enigma=true; card_type_a=15; card_type_b=-1; card_base_hp=80; card_base_atk=75+75; card_base_def=150+150; card_grid_x=5; card_grid_y=36; break;
	case 0380: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Latias"; 
		card_stage=1; card_starter=false; card_enigma=true; 
		card_type_a=14; card_type_b=7; 
		card_base_hp=80; card_base_atk=80+110; card_base_def=90+130; 
		card_grid_x=6; card_grid_y=36;}
		else {
		card_name="M-Latias"; 
		card_stage=1; card_starter=false; card_enigma=true; 
		card_type_a=14; card_type_b=7; 
		card_base_hp=80; card_base_atk=100+140; card_base_def=120+150; 
		card_grid_x=7; card_grid_y=36;}
		break;
		
	case 0381: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Latios"; 
		card_stage=1; card_starter=false; card_enigma=true; 
		card_type_a=14; card_type_b=7; 
		card_base_hp=80; card_base_atk=90+130; card_base_def=80+110;
		card_grid_x=8; card_grid_y=36;}
		else {
		card_name="M-Latios"; 
		card_stage=1; card_starter=false; card_enigma=true; 
		card_type_a=14; card_type_b=7; 
		card_base_hp=80; card_base_atk=130+160; card_base_def=100+120;
		card_grid_x=9; card_grid_y=36;}
		break;
		
	case 0382: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Kyogre"; 
		card_stage=1; card_starter=false; card_enigma=true; 
		card_type_a=3; card_type_b=-1; 
		card_base_hp=100; card_base_atk=100+150; card_base_def=90+140; 
		card_grid_x=11; card_grid_y=36;}
		else {
		card_name="P-Kyogre"; 
		card_stage=1; card_starter=false; card_enigma=true; 
		card_type_a=3; card_type_b=-1; 
		card_base_hp=100; card_base_atk=150+180; card_base_def=90+160; 
		card_grid_x=10; card_grid_y=36;}
		break;
		
	case 0383: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Groudon"; 
		card_stage=1; card_starter=false; card_enigma=true; 
		card_type_a=9; card_type_b=-1; 
		card_base_hp=100; card_base_atk=150+100; card_base_def=140+90; 
		card_grid_x=12; card_grid_y=36;}
		else {
		card_name="P-Groudon"; 
		card_stage=1; card_starter=false; card_enigma=true; 
		card_type_a=9; card_type_b=2; 
		card_base_hp=100; card_base_atk=180+150; card_base_def=160+90; 
		card_grid_x=13; card_grid_y=36;}
		break;
		
	case 0384:
		card_can_mega=true;
		if card_form_value<=999 { 
		card_name="Rayquaza"; 
		card_stage=1; card_starter=false; card_enigma=true; 
		card_type_a=14; card_type_b=5; 
		card_base_hp=105; card_base_atk=150+150; card_base_def=90+90; 
		card_grid_x=15; card_grid_y=36;}
		else { 
		card_name="M-Rayquaza"; 
		card_stage=1; card_starter=false; card_enigma=true; 
		card_type_a=14; card_type_b=5; 
		card_base_hp=105; card_base_atk=180+180; card_base_def=100+100; 
		card_grid_x=14; card_grid_y=36;}
		break;
		
	case 0385: card_name="Jirachi"; card_stage=1; card_starter=false; card_enigma=true; card_type_a=15; card_type_b=7; card_base_hp=100; card_base_atk=100+100; card_base_def=100+100; card_grid_x=1; card_grid_y=37; break;
	case 0386: card_form_change=true; card_has_forms=true; card_name="Deoxys"; card_stage=1; card_starter=false; card_enigma=true; card_type_a=7; card_type_b=-1; card_base_hp=50; 
	if card_form_value<250 {card_base_atk=150+150; card_base_def=50+50; card_grid_x=4; card_grid_y=37;}
	else if card_form_value<500 {card_base_atk=180+180; card_base_def=20+20; card_grid_x=2; card_grid_y=37;}
	else if card_form_value<750 {card_base_atk=70+70; card_base_def=160+160; card_grid_x=3; card_grid_y=37;}
	else {card_base_atk=95+95; card_base_def=90+90; card_grid_x=5; card_grid_y=37;} break;
	
	// Gen 4
	case 387:
		card_name="Turtwig";
		card_stage=1; card_evo[0]=388; card_starter=true;
		card_type_a=01; card_type_b=-1;
		card_base_hp=55; card_base_atk=68+45; card_base_def=64+55;
		card_grid_x=1; card_grid_y=1; break;
	case 388:
		card_name="Grotle";
		card_stage=2; card_evo[0]=389; card_starter=true;
		card_type_a=01; card_type_b=-1;
		card_base_hp=75; card_base_atk=89+55; card_base_def=85+65;
		card_grid_x=2; card_grid_y=1; break;
	case 389:
		card_name="Torterra";
		card_stage=3; card_starter=true;
		card_type_a=01; card_type_b=09;
		card_base_hp=95; card_base_atk=109+75; card_base_def=105+85;
		card_grid_x=3; card_grid_y=1; break;
	case 390:
		card_name="Chimchar";
		card_stage=1; card_evo[0]=391; card_starter=true;
		card_type_a=02; card_type_b=-1;
		card_base_hp=44; card_base_atk=58+58; card_base_def=44+44;
		card_grid_x=5; card_grid_y=1; break;
	case 391:
		card_name="Monferno";
		card_stage=2; card_evo[0]=392; card_starter=true;
		card_type_a=02; card_type_b=06;
		card_base_hp=64; card_base_atk=78+78; card_base_def=52+52;
		card_grid_x=6; card_grid_y=1; break;
	case 392:
		card_name="Infernape";
		card_stage=3; card_starter=true;
		card_type_a=02; card_type_b=06;
		card_base_hp=76; card_base_atk=104+104; card_base_def=71+71;
		card_grid_x=7; card_grid_y=1; break;
	case 393:
        card_name="Piplup";
        card_stage=1; card_evo[0]=394; card_starter=true;
        card_type_a=03; card_type_b=-1;
        card_base_hp=53; card_base_atk=51+61; card_base_def=53+56;
        card_grid_x=8; card_grid_y=1; break;
	case 394:
		card_name="Prinplup";
		card_stage=2; card_evo[0]=395; card_starter=true;
		card_type_a=03; card_type_b=-1;
		card_base_hp=64; card_base_atk=66+81; card_base_def=68+76;
		card_grid_x=9; card_grid_y=1; break;
	case 395:
		card_name="Empoleon";
		card_stage=3; card_starter=true;
		card_type_a=03; card_type_b=15;
		card_base_hp=84; card_base_atk=86+111; card_base_def=88+101;
		card_grid_x=10; card_grid_y=1; break;
	case 396:
		card_name="Starly";
		card_stage=1; card_evo[0]=397;
		card_type_a=00; card_type_b=05;
		card_base_hp=40; card_base_atk=55+30; card_base_def=30+30;
		card_grid_x=11; card_grid_y=1; break;
	case 397:
		card_name="Staravia";
		card_stage=2; card_evo[0]=398;
		card_type_a=00; card_type_b=05;
		card_base_hp=55; card_base_atk=75+40; card_base_def=50+40;
		card_grid_x=12; card_grid_y=1; break;
	case 398:
		card_name="Staraptor";
		card_stage=3;
		card_type_a=00; card_type_b=05;
		card_base_hp=85; card_base_atk=120+50; card_base_def=70+60;
		card_grid_x=13; card_grid_y=1; break;
	case 399:
		card_name="Bidoof";
		card_stage=1; card_evo[0]=400;
		card_type_a=00; card_type_b=-1;
		card_base_hp=59; card_base_atk=45+35; card_base_def=40+40;
		card_grid_x=14; card_grid_y=1; break;
	case 400:
		card_name="Bibarel";
		card_stage=2;
		card_type_a=00; card_type_b=03;
		card_base_hp=79; card_base_atk=85+55; card_base_def=60+60;
		card_grid_x=15; card_grid_y=1; break;
	case 401:
		card_name="Kricketot";
		card_stage=1; card_evo[0]=402;
		card_type_a=11; card_type_b=-1;
		card_base_hp=37; card_base_atk=25+25; card_base_def=41+41;
		card_grid_x=1; card_grid_y=2; break;
	case 402:
		card_name="Kricketune";
		card_stage=2;
		card_type_a=11; card_type_b=-1;
		card_base_hp=77; card_base_atk=85+55; card_base_def=51+51;
		card_grid_x=2; card_grid_y=2; break;
	case 403:
		card_name="Shinx";
		card_stage=1; card_evo[0]=404;
		card_type_a=04; card_type_b=-1;
		card_base_hp=45; card_base_atk=65+40; card_base_def=34+34;
		card_grid_x=3; card_grid_y=2; break;
	case 404:
		card_name="Luxio";
		card_stage=2; card_evo[0]=405;
		card_type_a=04; card_type_b=-1;
		card_base_hp=60; card_base_atk=85+60; card_base_def=49+49;
		card_grid_x=4; card_grid_y=2; break;
	case 405:
		card_name="Luxray";
		card_stage=3;
		card_type_a=04; card_type_b=-1;
		card_base_hp=80; card_base_atk=120+95; card_base_def=79+79;
		card_grid_x=5; card_grid_y=2; break;
	case 406:
		card_name="Budew";
		card_stage=0; card_evo[0]=315;
		card_type_a=01; card_type_b=12;
		card_base_hp=40; card_base_atk=30+50; card_base_def=35+70;
		card_grid_x=6; card_grid_y=2; break;	
	case 407:
		card_name="Roserade";
		card_stage=2;
		card_type_a=01; card_type_b=12;
		card_base_hp=60; card_base_atk=70+125; card_base_def=65+105;
		card_grid_x=8; card_grid_y=2; break;
	case 408:
		card_name="Cranidos";
		card_stage=1; card_evo[0]=409; card_fossil=true;
		card_type_a=10; card_type_b=-1;
		card_base_hp=67; card_base_atk=125+30; card_base_def=40+30;
		card_grid_x=10; card_grid_y=2; break;
	case 409:
		card_name="Rampardos";
		card_stage=2; card_fossil=true;
		card_type_a=10; card_type_b=-1;
		card_base_hp=97; card_base_atk=165+65; card_base_def=60+50;
		card_grid_x=11; card_grid_y=2; break;
	case 410:
		card_name="Shieldon";
		card_stage=1; card_evo[0]=411; card_fossil=true;
		card_type_a=10; card_type_b=15;
		card_base_hp=30; card_base_atk=42+42; card_base_def=118+88;
		card_grid_x=12; card_grid_y=2; break;
	case 411:
		card_name="Bastiodon";
		card_stage=2; card_fossil=true;
		card_type_a=10; card_type_b=15;
		card_base_hp=60; card_base_atk=52+47; card_base_def=168+138;
		card_grid_x=13; card_grid_y=2; break;
	case 412://ingame only burmy can change 
		card_form_change=true;
		card_has_forms=true;
		card_name="Burmy";
		card_stage=1; card_evo[0]=413; card_evo[1]=414;
		card_type_a=11; card_type_b=-1;
		card_base_hp=40; card_base_atk=29+29; card_base_def=45+45;
		if card_form_value<333 {card_grid_x=15; card_grid_y=2;}
		else if card_form_value<666 {card_grid_x=1; card_grid_y=3;}
		else {card_grid_x=14; card_grid_y=2;} break;
	case 413:
		card_has_forms=true;
		card_name="Wormadam";
		card_stage=2;
		if card_form_value<333 {card_type_a=11; card_type_b=01;
		card_base_hp=60; card_base_atk=59+79; card_base_def=85+105;
		card_grid_x=4; card_grid_y=3;}
		else if card_form_value<666 {card_type_a=11; card_type_b=09;
		card_base_hp=60; card_base_atk=79+59; card_base_def=105+85;
		card_grid_x=3; card_grid_y=3;}
		else {card_type_a=11; card_type_b=15;
		card_base_hp=60; card_base_atk=69+69; card_base_def=95+95;
		card_grid_x=2; card_grid_y=3;} break;
	case 414:
		card_name="Mothim";
		card_stage=2;
		card_type_a=11; card_type_b=05;
		card_base_hp=70; card_base_atk=94+94; card_base_def=50+50;
		card_grid_x=5; card_grid_y=3; break;
	case 415:
		card_name="Combee";
		card_stage=1; card_evo[0]=416;
		card_type_a=11; card_type_b=05;
		card_base_hp=30; card_base_atk=30+30; card_base_def=42+42;
		card_grid_x=6; card_grid_y=3; break;
	case 416:
		card_name="Vespiquen";
		card_stage=2;
		card_type_a=11; card_type_b=05;
		card_base_hp=70; card_base_atk=80+80; card_base_def=102+102;
		card_grid_x=7; card_grid_y=3; break;
	case 417:
		card_name="Pachirisu";
		card_stage=1;
		card_type_a=04; card_type_b=-1;
		card_base_hp=60; card_base_atk=45+45; card_base_def=70+90;
		card_grid_x=8; card_grid_y=3; break;
	case 418:
		card_name="Buizel";
		card_stage=1; card_evo[0]=419;
		card_type_a=03; card_type_b=-1;
		card_base_hp=55; card_base_atk=65+60; card_base_def=35+30;
		card_grid_x=9; card_grid_y=3; break;
	case 419:
		card_name="Floatzel";
		card_stage=2;
		card_type_a=03; card_type_b=-1;
		card_base_hp=85; card_base_atk=105+85; card_base_def=55+50;
		card_grid_x=10; card_grid_y=3; break;
	case 420:
		card_name="Cherubi";
		card_stage=1; card_evo[0]=421;
		card_type_a=01; card_type_b=-1;
		card_base_hp=45; card_base_atk=35+62; card_base_def=45+53;
		card_grid_x=11; card_grid_y=3; break;
	case 421:
		card_form_change=true;
		card_has_forms=true;
		card_name="Cherrim";
		card_stage=2;
		card_type_a=01; card_type_b=-1;
		card_base_hp=70; card_base_atk=60+87; card_base_def=70+78;
		if card_form_value<500{card_grid_x=12; card_grid_y=3;}
		else {card_grid_x=13; card_grid_y=3;} break;
	case 422:
		card_has_forms=true;
		card_name="Shellos";
		card_stage=1; card_evo[0]=423;
		card_type_a=03; card_type_b=-1;
		card_base_hp=76; card_base_atk=48+57; card_base_def=48+62;
		if card_form_value<500{card_grid_x=14; card_grid_y=3;}
		else {card_grid_x=15; card_grid_y=3;} break;
	case 423:
		card_has_forms=true;
		card_name="Gastrodon";
		card_stage=2;
		card_type_a=03; card_type_b=09;
		card_base_hp=111; card_base_atk=83+92; card_base_def=68+82;
		if card_form_value<500{card_grid_x=1; card_grid_y=4;}
		else {card_grid_x=2; card_grid_y=4;} break;
	case 424:
		card_name="Ambipom";
		card_stage=2;
		card_type_a=00; card_type_b=-1;
		card_base_hp=75; card_base_atk=100+60; card_base_def=66+66;
		card_grid_x=3; card_grid_y=4; break;
	case 425:
		card_name="Drifloon";
		card_stage=1; card_evo[0]=426;
		card_type_a=16; card_type_b=05;
		card_base_hp=90; card_base_atk=50+60; card_base_def=34+44;
		card_grid_x=4; card_grid_y=4; break;
	case 426:
		card_name="Drifblim";
		card_stage=2;
		card_type_a=16; card_type_b=05;
		card_base_hp=150; card_base_atk=80+90; card_base_def=44+54;
		card_grid_x=5; card_grid_y=4; break;
	case 427:
		card_name="Buneary";
		card_stage=1; card_evo[0]=428;
		card_type_a=00; card_type_b=-1;
		card_base_hp=55; card_base_atk=66+44; card_base_def=44+56;
		card_grid_x=6; card_grid_y=4; break;
	case 428:
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Lopunny";
		card_stage=2;
		card_type_a=00; card_type_b=-1;
		card_base_hp=65; card_base_atk=76+54; card_base_def=84+96;
		card_grid_x=7; card_grid_y=4;}
		else {
		card_name="M-Lopunny";
		card_stage=2; card_enigma=true;
		card_type_a=00; card_type_b=6;
		card_base_hp=65; card_base_atk=136+54; card_base_def=94+96;
		card_grid_x=8; card_grid_y=4;}
		break;
	case 429:
		card_name="Mismagius";
		card_stage=2;
		card_type_a=16; card_type_b=-1;
		card_base_hp=60; card_base_atk=60+105; card_base_def=60+105;
		card_grid_x=9; card_grid_y=4; break;
	case 430:
		card_name="Honchkrow";
		card_stage=2;
		card_type_a=17; card_type_b=05;
		card_base_hp=100; card_base_atk=125+105; card_base_def=52+52;
		card_grid_x=10; card_grid_y=4; break;
	case 431:
		card_name="Glameow";
		card_stage=1; card_evo[0]=432;
		card_type_a=00; card_type_b=-1;
		card_base_hp=49; card_base_atk=55+42; card_base_def=42+37;
		card_grid_x=11; card_grid_y=4; break;
	case 432:
		card_name="Purugly";
		card_stage=2;
		card_type_a=00; card_type_b=-1;
		card_base_hp=71; card_base_atk=82+64; card_base_def=64+59;
		card_grid_x=12; card_grid_y=4; break;
	case 433:
		card_name="Chingling";
		card_stage=0; card_evo[0]=358;
		card_type_a=07; card_type_b=-1;
		card_base_hp=45; card_base_atk=30+65; card_base_def=50+50;
		card_grid_x=13; card_grid_y=4; break;
	case 434:
		card_name="Stunky";
		card_stage=1; card_evo[0]=435;
		card_type_a=12; card_type_b=17;
		card_base_hp=63; card_base_atk=63+41; card_base_def=47+41;
		card_grid_x=14; card_grid_y=4; break;
	case 435:
		card_name="Skuntank";
		card_stage=2;
		card_type_a=12; card_type_b=17;
		card_base_hp=103; card_base_atk=93+71; card_base_def=67+61;
		card_grid_x=15; card_grid_y=4; break;
	case 436:
		card_name="Bronzor";
		card_stage=1; card_evo[0]=437;
		card_type_a=15; card_type_b=07;
		card_base_hp=57; card_base_atk=24+24; card_base_def=86+86;
		card_grid_x=1; card_grid_y=5; break;
	case 437:
		card_name="Bronzong";
		card_stage=2;
		card_type_a=15; card_type_b=07;
		card_base_hp=67; card_base_atk=89+79; card_base_def=116+116;
		card_grid_x=2; card_grid_y=5; break;
	case 438:
		card_name="Bonsly";
		card_stage=0; card_evo[0]=185;
		card_type_a=10; card_type_b=-1;
		card_base_hp=50; card_base_atk=80+10; card_base_def=95+45;
		card_grid_x=3; card_grid_y=5; break;
	case 439:
		card_name="Mime Jr.";
		card_stage=0; card_evo[0]=122;
		card_type_a=07; card_type_b=08;
		card_base_hp=20; card_base_atk=25+70; card_base_def=45+90;
		card_grid_x=4; card_grid_y=5; break;
	case 440:
		card_name="Happiny";
		card_stage=0; card_evo[0]=113;
		card_type_a=00; card_type_b=-1;
		card_base_hp=100; card_base_atk=5+15; card_base_def=5+65;
		card_grid_x=5; card_grid_y=5; break;
	case 441:
		card_name="Chatot";
		card_stage=1; 
		card_type_a=00; card_type_b=05;
		card_base_hp=76; card_base_atk=65+92; card_base_def=45+42;
		card_grid_x=6; card_grid_y=5; break;
	case 442:
		card_name="Spiritomb";
		card_stage=1; 
		card_type_a=16; card_type_b=17;
		card_base_hp=50; card_base_atk=92+92; card_base_def=108+108;
		card_grid_x=7; card_grid_y=5; break;
	case 443:
		card_name="Gible";
		card_stage=1; card_evo[0]=444; card_pseudo=true;
		card_type_a=14; card_type_b=09;
		card_base_hp=58; card_base_atk=70+40; card_base_def=45+45;
		card_grid_x=8; card_grid_y=5; break;
	case 444:
		card_name="Gabite";
		card_stage=2; card_evo[0]=445; card_pseudo=true;
		card_type_a=14; card_type_b=09;
		card_base_hp=68; card_base_atk=90+50; card_base_def=65+55;
		card_grid_x=9; card_grid_y=5; break;
	case 445:
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Garchomp";
		card_stage=3; card_pseudo=true;
		card_type_a=14; card_type_b=09;
		card_base_hp=108; card_base_atk=130+80; card_base_def=95+85;
		card_grid_x=10; card_grid_y=5;}
		else {
		card_name="M-Garchomp";
		card_stage=3; card_pseudo=true; card_enigma=true;
		card_type_a=14; card_type_b=09;
		card_base_hp=108; card_base_atk=170+120; card_base_def=115+95;
		card_grid_x=11; card_grid_y=5;}
		break;
	case 446:
		card_name="Munchlax";
		card_stage=0; card_evo[0]=143;
		card_type_a=00; card_type_b=-1;
		card_base_hp=135; card_base_atk=85+40; card_base_def=40+85;
		card_grid_x=12; card_grid_y=5; break;
	case 447:
		card_name="Riolu";
		card_stage=0; card_evo[0]=448;
		card_type_a=06; card_type_b=-1;
		card_base_hp=40; card_base_atk=70+35; card_base_def=40+40;
		card_grid_x=13; card_grid_y=5; break;
	case 448:
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Lucario";
		card_stage=2;
		card_type_a=06; card_type_b=15;
		card_base_hp=70; card_base_atk=110+115; card_base_def=70+70;
		card_grid_x=14; card_grid_y=5;}
		else {
		card_name="M-Lucario";
		card_stage=1; card_enigma=true;
		card_type_a=06; card_type_b=15;
		card_base_hp=70; card_base_atk=145+140; card_base_def=88+70;
		card_grid_x=15; card_grid_y=5;}
		break;
	case 449:
		card_name="Hippopotas";
		card_stage=1; card_evo[0]=450;
		card_type_a=09; card_type_b=-1;
		card_base_hp=68; card_base_atk=72+38; card_base_def=78+42;
		card_grid_x=1; card_grid_y=6; break;
	case 450:
		card_name="Hippowdon";
		card_stage=2;
		card_type_a=09; card_type_b=-1;
		card_base_hp=108; card_base_atk=112+68; card_base_def=118+72;
		card_grid_x=2; card_grid_y=6; break;
	case 451:
		card_name="Skorupi";
		card_stage=1; card_evo[0]=452;
		card_type_a=12; card_type_b=11;
		card_base_hp=40; card_base_atk=50+30; card_base_def=90+55;
		card_grid_x=3; card_grid_y=6; break;
	case 452:
		card_name="Drapion";
		card_stage=2;
		card_type_a=12; card_type_b=17;
		card_base_hp=70; card_base_atk=90+60; card_base_def=110+75;
		card_grid_x=4; card_grid_y=6; break;
	case 453:
		card_name="Croagunk";
		card_stage=1; card_evo[0]=454;
		card_type_a=12; card_type_b=06;
		card_base_hp=48; card_base_atk=61+61; card_base_def=40+40;
		card_grid_x=5; card_grid_y=6; break;
	case 454:
		card_name="Toxicroak";
		card_stage=2;
		card_type_a=12; card_type_b=06;
		card_base_hp=83; card_base_atk=106+86; card_base_def=65+65;
		card_grid_x=6; card_grid_y=6; break;
	case 455:
		card_name="Carnivine";
		card_stage=1;
		card_type_a=01; card_type_b=-1;
		card_base_hp=74; card_base_atk=100+90; card_base_def=72+72;
		card_grid_x=7; card_grid_y=6; break;
	case 456:
		card_name="Finneon";
		card_stage=1; card_evo[0]=457;
		card_type_a=03; card_type_b=-1;
		card_base_hp=49; card_base_atk=49+49; card_base_def=56+61;
		card_grid_x=8; card_grid_y=6; break;
	case 457:
		card_name="Lumineon";
		card_stage=2;
		card_type_a=03; card_type_b=-1;
		card_base_hp=69; card_base_atk=69+69; card_base_def=76+86;
		card_grid_x=9; card_grid_y=6; break;
	case 458:
		card_name="Mantyke";
		card_stage=0; card_evo[0]=226;
		card_type_a=03; card_type_b=05;
		card_base_hp=45; card_base_atk=20+60; card_base_def=50+120;
		card_grid_x=10; card_grid_y=6; break;
	case 459:
		card_name="Snover";
		card_stage=1; card_evo[0]=460;
		card_type_a=01; card_type_b=13;
		card_base_hp=60; card_base_atk=62+62; card_base_def=50+60;
		card_grid_x=11; card_grid_y=6; break;
	case 460:
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Abomasnow";
		card_stage=2;
		card_type_a=01; card_type_b=13;
		card_base_hp=90; card_base_atk=92+92; card_base_def=75+85;
		card_grid_x=12; card_grid_y=6;}
		else {
		card_name="M-Abomasnow";
		card_stage=2; card_enigma=true;
		card_type_a=01; card_type_b=13;
		card_base_hp=90; card_base_atk=132+132; card_base_def=105+105;
		card_grid_x=13; card_grid_y=6;}
		break;
	case 461:
		card_name="Weavile";
		card_stage=2;
		card_type_a=17; card_type_b=13;
		card_base_hp=70; card_base_atk=120+45; card_base_def=65+85;
		card_grid_x=14; card_grid_y=6; break;
	case 462:
		card_name="Magnezone";
		card_stage=3;
		card_type_a=04; card_type_b=15;
		card_base_hp=70; card_base_atk=70+130; card_base_def=115+90;
		card_grid_x=15; card_grid_y=6; break;
	case 463:
		card_name="Lickilicky";
		card_stage=2;
		card_type_a=00; card_type_b=-1;
		card_base_hp=110; card_base_atk=85+80; card_base_def=95+95;
		card_grid_x=1; card_grid_y=7; break;
	case 464:
		card_name="Rhyperior";
		card_stage=3;
		card_type_a=09; card_type_b=10;
		card_base_hp=115; card_base_atk=140+55; card_base_def=130+55;
		card_grid_x=2; card_grid_y=7; break;
	case 465:
		card_name="Tangrowth";
		card_stage=2;
		card_type_a=01; card_type_b=-1;
		card_base_hp=100; card_base_atk=100+110; card_base_def=125+50;
		card_grid_x=3; card_grid_y=7; break;
	case 466:
		card_name="Electivire";
		card_stage=2;
		card_type_a=04; card_type_b=-1;
		card_base_hp=75; card_base_atk=123+95; card_base_def=67+85;
		card_grid_x=4; card_grid_y=7; break;
	case 467:
        card_name="Magmortar";
        card_stage=2;
        card_type_a=02; card_type_b=-1;
        card_base_hp=75; card_base_atk=95+125; card_base_def=67+95;
        card_grid_x=5; card_grid_y=7; break;
	case 468:
		card_name="Togekiss";
		card_stage=2;
		card_type_a=08; card_type_b=05;
		card_base_hp=85; card_base_atk=50+120; card_base_def=95+115;
		card_grid_x=7; card_grid_y=7; break;
	case 469:
		card_name="Yanmega";
		card_stage=2;
		card_type_a=11; card_type_b=05;
		card_base_hp=86; card_base_atk=76+116; card_base_def=86+56;
		card_grid_x=9; card_grid_y=7; break;
	case 470:
		card_name="Leafeon";
		card_stage=2;
		card_type_a=01; card_type_b=-1;
		card_base_hp=65; card_base_atk=110+60; card_base_def=130+65;
		card_grid_x=10; card_grid_y=7; break;
	case 471:
		card_name="Glaceon";
		card_stage=2;
		card_type_a=13; card_type_b=-1;
		card_base_hp=65; card_base_atk=60+130; card_base_def=110+95;
		card_grid_x=11; card_grid_y=7; break;
	case 472:
		card_name="Gliscor";
		card_stage=2;
		card_type_a=09; card_type_b=05;
		card_base_hp=75; card_base_atk=95+45; card_base_def=125+75;
		card_grid_x=12; card_grid_y=7; break;
	case 473:
		card_name="Mamoswine";
		card_stage=3;
		card_type_a=13; card_type_b=09;
		card_base_hp=110; card_base_atk=130+70; card_base_def=80+60;
		card_grid_x=13; card_grid_y=7; break;
	case 474:
		card_name="Porygon-Z";
		card_stage=3;
		card_type_a=00; card_type_b=-1;
		card_base_hp=85; card_base_atk=80+135; card_base_def=70+75;
		card_grid_x=14; card_grid_y=7; break;
	case 475:
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Gallade";
		card_stage=3;
		card_type_a=07; card_type_b=06;
		card_base_hp=68; card_base_atk=125+65; card_base_def=65+115;
		card_grid_x=15; card_grid_y=7;}
		else {
		card_name="M-Gallade";
		card_stage=3; card_enigma=true;
		card_type_a=07; card_type_b=06;
		card_base_hp=68; card_base_atk=165+65; card_base_def=95+115;
		card_grid_x=1; card_grid_y=8;}
		break;
	case 476:
		card_name="Probopass";
		card_stage=2;
		card_type_a=10; card_type_b=15;
		card_base_hp=60; card_base_atk=55+75; card_base_def=145+150;
		card_grid_x=2; card_grid_y=8; break;
	case 477:
		card_name="Dusknoir";
		card_stage=3;
		card_type_a=16; card_type_b=-1;
		card_base_hp=45; card_base_atk=100+65; card_base_def=135+135;
		card_grid_x=3; card_grid_y=8; break;
	case 478:
		card_name="Froslass";
		card_stage=2;
		card_type_a=13; card_type_b=16;
		card_base_hp=70; card_base_atk=80+80; card_base_def=70+70;
		card_grid_x=4; card_grid_y=8; break;
	case 479:
		card_form_change=true;
		card_has_forms=true;
		card_name="Rotom";
		card_stage=1;
		if card_form_value<166{card_type_a=04; card_type_b=16;
		card_base_hp=50; card_base_atk=50+95; card_base_def=77+77;
		card_grid_x=9; card_grid_y=8;}
		else if card_form_value<333{card_type_a=04; card_type_b=02;
		card_base_hp=50; card_base_atk=65+105; card_base_def=107+107;
		card_grid_x=8; card_grid_y=8;}
		else if card_form_value<500{card_type_a=04; card_type_b=03;
		card_base_hp=50; card_base_atk=65+105; card_base_def=107+107;
		card_grid_x=10; card_grid_y=8;}
		else if card_form_value<666{card_type_a=04; card_type_b=13;
		card_base_hp=50; card_base_atk=65+105; card_base_def=107+107;
		card_grid_x=5; card_grid_y=8;}
		else if card_form_value<833{card_type_a=04; card_type_b=05;
		card_base_hp=50; card_base_atk=65+105; card_base_def=107+107;
		card_grid_x=7; card_grid_y=8;}
		else {card_type_a=04; card_type_b=01;
		card_base_hp=50; card_base_atk=65+105; card_base_def=107+107;
		card_grid_x=6; card_grid_y=8;}
		break;
	case 480:
		card_name="Uxie";
		card_stage=1; card_enigma=true;
		card_type_a=07; card_type_b=-1;
		card_base_hp=75; card_base_atk=75+75; card_base_def=130+130;
		card_grid_x=12; card_grid_y=8; break;
	case 481:
		card_name="Mesprit";
		card_stage=1; card_enigma=true;
		card_type_a=07; card_type_b=-1;
		card_base_hp=80; card_base_atk=105+105; card_base_def=105+105;
		card_grid_x=13; card_grid_y=8; break;
	case 482:
		card_name="Azelf";
		card_stage=1; card_enigma=true;
		card_type_a=07; card_type_b=-1;
		card_base_hp=75; card_base_atk=125+125; card_base_def=70+70;
		card_grid_x=14; card_grid_y=8; break;
	case 483:
		card_form_change=true;
		card_has_forms=true;
		card_name="Dialga";
		card_stage=1; card_enigma=true;
		card_type_a=15; card_type_b=14;
		if card_form_value<500 {
		card_base_hp=100; card_base_atk=120+150; card_base_def=120+100;
		card_grid_x=15; card_grid_y=8; }
		else{
		card_sheet=sp_poke_c;
		card_base_hp=100; card_base_atk=100+150; card_base_def=120+120;
		card_grid_x=1; card_grid_y=6;} 
		break;
	case 484:
		card_form_change=true;
		card_has_forms=true;
		card_name="Palkia";
		card_stage=1; card_enigma=true;
		card_type_a=03; card_type_b=14;
		if card_form_value<500 {
		card_base_hp=90; card_base_atk=120+150; card_base_def=100+120;
		card_grid_x=1; card_grid_y=9; }
		else {
		card_sheet=sp_poke_c;
		card_base_hp=90; card_base_atk=100+150; card_base_def=100+120;
		card_grid_x=2; card_grid_y=6;} 
		break;
		
		
	case 485:
		card_name="Heatran";
		card_stage=1; card_enigma=true;
		card_type_a=02; card_type_b=15;
		card_base_hp=91; card_base_atk=90+130; card_base_def=106+106;
		card_grid_x=2; card_grid_y=9; break;
	case 486:
		card_name="Regigigas";
		card_stage=1; card_enigma=true;
		card_type_a=00; card_type_b=-1;
		card_base_hp=110; card_base_atk=160+80; card_base_def=110+110;
		card_grid_x=3; card_grid_y=9; break;
	case 487:
		card_form_change=true;
		card_has_forms=true;
		card_name="Giratina";
		card_stage=1; card_enigma=true;
		card_type_a=16; card_type_b=14;
		if card_form_value<500{card_base_hp=150; card_base_atk=100+100; card_base_def=120+120;
		card_grid_x=4; card_grid_y=9;}
		else if card_form_value<=750 {card_base_hp=150; card_base_atk=120+120; card_base_def=100+100;
		card_grid_x=5; card_grid_y=9;}
		else {
		card_base_hp=150; card_base_atk=120+120; card_base_def=100+100;
		card_sheet=sp_poke_c;
		card_grid_x=3; card_grid_y=6;} 
		break;
	case 488:
		card_name="Cresselia";
		card_stage=1; card_enigma=true;
		card_type_a=07; card_type_b=-1;
		card_base_hp=120; card_base_atk=70+75; card_base_def=120+130;
		card_grid_x=6; card_grid_y=9; break;
	case 489:
		card_name="Phione";
		card_stage=1; card_enigma=true;
		card_type_a=03; card_type_b=-1;
		card_base_hp=80; card_base_atk=80+80; card_base_def=80+80;
		card_grid_x=7; card_grid_y=9; break;
	case 490:
		card_name="Manaphy";
		card_stage=1; card_enigma=true;
		card_type_a=03; card_type_b=-1;
		card_base_hp=100; card_base_atk=100+100; card_base_def=100+100;
		card_grid_x=8; card_grid_y=9; break;
	case 491:
		card_name="Darkrai";
		card_stage=1; card_enigma=true;
		card_type_a=17; card_type_b=-1;
		card_base_hp=70; card_base_atk=90+135; card_base_def=90+90;
		card_grid_x=9; card_grid_y=9; break;
	case 492:
		card_form_change=true;
		card_has_forms=true;
		card_name="Shaymin";
		card_stage=1; card_enigma=true;
		if card_form_value<500{card_type_a=01; card_type_b=-1;
		card_base_hp=100; card_base_atk=100+100; card_base_def=100+100;
		card_grid_x=10; card_grid_y=9;}
		else {card_type_a=01; card_type_b=05;
		card_base_hp=100; card_base_atk=103+120; card_base_def=75+75;
		card_grid_x=11; card_grid_y=9;} break;
	case 493:
		card_sheet=sp_poke_c;
		card_form_change=true;
		card_has_forms=true;
		card_name="Arceus";
		card_stage=1; card_enigma=true;
		card_base_hp=120; card_base_atk=120+120; card_base_def=120+120;
		if card_form_value<55 {
		card_type_a=00; card_type_b=-1;
		card_grid_x=1; card_grid_y=2; 
		}
		else if card_form_value<110 {
		card_type_a=01; card_type_b=-1;
		card_grid_x=12; card_grid_y=2; 
		}
		else if card_form_value<165 {
		card_type_a=02; card_type_b=-1;
		card_grid_x=10; card_grid_y=2; 
		}
		else if card_form_value<220 {
		card_type_a=03; card_type_b=-1;
		card_grid_x=11; card_grid_y=2; 
		}
		else if card_form_value<275 {
		card_type_a=04; card_type_b=-1;
		card_grid_x=13; card_grid_y=2; 
		}
		else if card_form_value<330 {
		card_type_a=05; card_type_b=-1;
		card_grid_x=3; card_grid_y=2; 
		}
		else if card_form_value<385 {
		card_type_a=06; card_type_b=-1;
		card_grid_x=2; card_grid_y=2; 
		}
		else if card_form_value<440 {
		card_type_a=07; card_type_b=-1;
		card_grid_x=14; card_grid_y=2; 
		}
		else if card_form_value<495 {
		card_type_a=08; card_type_b=-1;
		card_grid_x=3; card_grid_y=3; 
		}
		else if card_form_value<550 {
		card_type_a=09; card_type_b=-1;
		card_grid_x=5; card_grid_y=2; 
		}
		else if card_form_value<605 {
		card_type_a=10; card_type_b=-1;
		card_grid_x=6; card_grid_y=2; 
		}
		else if card_form_value<660 {
		card_type_a=11; card_type_b=-1;
		card_grid_x=7; card_grid_y=2; 
		}
		else if card_form_value<715 {
		card_type_a=12; card_type_b=-1;
		card_grid_x=4; card_grid_y=2; 
		}
		else if card_form_value<770 {
		card_type_a=13; card_type_b=-1;
		card_grid_x=15; card_grid_y=2; 
		}
		else if card_form_value<825 {
		card_type_a=14; card_type_b=-1;
		card_grid_x=1; card_grid_y=3; 
		}
		else if card_form_value<880 {
		card_type_a=15; card_type_b=-1;
		card_grid_x=9; card_grid_y=2; 
		}
		else if card_form_value<935 {
		card_type_a=16; card_type_b=-1;
		card_grid_x=8; card_grid_y=2; 
		}
		else {
		card_type_a=17; card_type_b=-1;
		card_grid_x=2; card_grid_y=3; 
		}
		break;
		
	// Gen 5
	case 0494: card_name="Victini"; card_stage=1;  card_enigma=true; card_type_a=7; card_type_b=2; card_base_hp=100; card_base_atk=100+100; card_base_def=100+100; card_grid_x=1; card_grid_y=10; break;
	case 0495: card_name="Snivy"; card_stage=1; card_evo[0]=496; card_starter=true; card_type_a=1; card_type_b=-1; card_base_hp=45; card_base_atk=45+45; card_base_def=55+55; card_grid_x=2; card_grid_y=10; break;
	case 0496: card_name="Servine"; card_stage=2; card_evo[0]=497; card_starter=true; card_type_a=1; card_type_b=-1; card_base_hp=60; card_base_atk=60+60; card_base_def=75+75; card_grid_x=3; card_grid_y=10; break;
	case 0497: card_name="Serperior"; card_stage=3;  card_starter=true; card_type_a=1; card_type_b=-1; card_base_hp=75; card_base_atk=75+75; card_base_def=95+95; card_grid_x=4; card_grid_y=10; break;
	case 0498: card_name="Tepig"; card_stage=1; card_evo[0]=499; card_starter=true; card_type_a=2; card_type_b=-1; card_base_hp=65; card_base_atk=63+45; card_base_def=45+45; card_grid_x=5; card_grid_y=10; break;
	case 0499: card_name="Pignite"; card_stage=2; card_evo[0]=500; card_starter=true; card_type_a=2; card_type_b=6; card_base_hp=90; card_base_atk=93+70; card_base_def=55+55; card_grid_x=6; card_grid_y=10; break;
	case 0500: card_name="Emboar"; card_stage=3;  card_starter=true; card_type_a=2; card_type_b=6; card_base_hp=110; card_base_atk=123+100; card_base_def=65+65; card_grid_x=7; card_grid_y=10; break;
	case 0501: card_name="Oshawott"; card_stage=1; card_evo[0]=502; card_starter=true; card_type_a=3; card_type_b=-1; card_base_hp=55; card_base_atk=55+63; card_base_def=45+45; card_grid_x=9; card_grid_y=10; break;
	case 0502: card_name="Dewott"; card_stage=2; card_evo[0]=503; card_starter=true; card_type_a=3; card_type_b=-1; card_base_hp=75; card_base_atk=75+83; card_base_def=60+60; card_grid_x=10; card_grid_y=10; break;
	case 0503: 
		card_name="Samurott"; 
		card_stage=3;  card_starter=true; 
		
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=3; card_type_b=-1; 
			card_base_hp=95; 
			card_base_atk=100+108; 
			card_base_def=85+70; 
			card_grid_x=11; card_grid_y=10; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=3; card_type_b=16; 
			card_base_hp=90; 
			card_base_atk=109+100; 
			card_base_def=80+65; 
			card_grid_x=5; card_grid_y=11; }
		break;
	case 0504: card_name="Patrat"; card_stage=1; card_evo[0]=505; card_type_a=0; card_type_b=-1; card_base_hp=45; card_base_atk=55+35; card_base_def=39+39; card_grid_x=12; card_grid_y=10; break;
	case 0505: card_name="Watchog"; card_stage=2;  card_type_a=0; card_type_b=-1; card_base_hp=60; card_base_atk=85+60; card_base_def=69+69; card_grid_x=13; card_grid_y=10; break;
	case 0506: card_name="Lillipup"; card_stage=1; card_evo[0]=507; card_type_a=0; card_type_b=-1; card_base_hp=45; card_base_atk=60+25; card_base_def=45+45; card_grid_x=14; card_grid_y=10; break;
	case 0507: card_name="Herdier"; card_stage=2; card_evo[0]=508; card_type_a=0; card_type_b=-1; card_base_hp=65; card_base_atk=80+35; card_base_def=65+65; card_grid_x=15; card_grid_y=10; break;
	case 0508: card_name="Stoutland"; card_stage=3;  card_type_a=0; card_type_b=-1; card_base_hp=85; card_base_atk=110+45; card_base_def=90+90; card_grid_x=1; card_grid_y=11; break;
	case 0509: card_name="Purrloin"; card_stage=1; card_evo[0]=510; card_type_a=17; card_type_b=-1; card_base_hp=41; card_base_atk=50+50; card_base_def=37+37; card_grid_x=2; card_grid_y=11; break;
	case 0510: card_name="Liepard"; card_stage=2; card_type_a=17; card_type_b=-1; card_base_hp=64; card_base_atk=88+88; card_base_def=50+50; card_grid_x=3; card_grid_y=11; break;
	case 0511: card_name="Pansage"; card_stage=1; card_evo[0]=512; card_type_a=1; card_type_b=-1; card_base_hp=50; card_base_atk=53+53; card_base_def=48+48; card_grid_x=4; card_grid_y=11; break;
	case 0512: card_name="Simisage"; card_stage=2;  card_type_a=1; card_type_b=-1; card_base_hp=75; card_base_atk=98+98; card_base_def=63+63; card_grid_x=5; card_grid_y=11; break;
	case 0513: card_name="Pansear"; card_stage=1; card_evo[0]=514; card_type_a=2; card_type_b=-1; card_base_hp=50; card_base_atk=53+53; card_base_def=48+48; card_grid_x=6; card_grid_y=11; break;
	case 0514: card_name="Simisear"; card_stage=2;  card_type_a=2; card_type_b=-1; card_base_hp=75; card_base_atk=98+98; card_base_def=63+63; card_grid_x=8; card_grid_y=11; break;
	case 0515: card_name="Panpour"; card_stage=1; card_evo[0]=516; card_type_a=3; card_type_b=-1; card_base_hp=50; card_base_atk=53+53; card_base_def=48+48; card_grid_x=10; card_grid_y=11; break;
	case 0516: card_name="Simipour"; card_stage=2;  card_type_a=3; card_type_b=-1; card_base_hp=75; card_base_atk=98+98; card_base_def=63+63; card_grid_x=11; card_grid_y=11; break;
	case 0517: card_name="Munna"; card_stage=1; card_evo[0]=518; card_type_a=7; card_type_b=-1; card_base_hp=76; card_base_atk=25+67; card_base_def=45+55; card_grid_x=12; card_grid_y=11; break;
	case 0518: card_name="Musharna"; card_stage=2;  card_type_a=7; card_type_b=-1; card_base_hp=116; card_base_atk=55+107; card_base_def=85+95; card_grid_x=13; card_grid_y=11; break;
	case 0519: card_name="Pidove"; card_stage=1; card_evo[0]=520; card_type_a=0; card_type_b=5; card_base_hp=50; card_base_atk=55+36; card_base_def=50+30; card_grid_x=14; card_grid_y=11; break;
	case 0520: card_name="Tranquill"; card_stage=2; card_evo[0]=521; card_type_a=0; card_type_b=5; card_base_hp=62; card_base_atk=77+50; card_base_def=62+42; card_grid_x=15; card_grid_y=11; break;
	case 0521: card_name="Unfezant"; card_stage=3;  card_type_a=0; card_type_b=5; card_base_hp=80; card_base_atk=115+65; card_base_def=80+55; card_grid_x=1; card_grid_y=12; break;
	//case 0521: card_name="Unfezant"; card_stage=3;  card_type_a=0; card_type_b=5; card_base_hp=80; card_base_atk=115+65; card_base_def=80+55; card_grid_x=2; card_grid_y=12; break;
	case 0522: card_name="Blitzle"; card_stage=1; card_evo[0]=523; card_type_a=4; card_type_b=-1; card_base_hp=45; card_base_atk=60+50; card_base_def=32+32; card_grid_x=3; card_grid_y=12; break;
	case 0523: card_name="Zebstrika"; card_stage=2;  card_type_a=4; card_type_b=-1; card_base_hp=75; card_base_atk=100+80; card_base_def=63+63; card_grid_x=4; card_grid_y=12; break;
	case 0524: card_name="Roggenrola"; card_stage=1; card_evo[0]=525; card_type_a=10; card_type_b=-1; card_base_hp=55; card_base_atk=75+25; card_base_def=85+25; card_grid_x=5; card_grid_y=12; break;
	case 0525: card_name="Boldore"; card_stage=2; card_evo[0]=526; card_type_a=10; card_type_b=-1; card_base_hp=70; card_base_atk=105+50; card_base_def=105+40; card_grid_x=6; card_grid_y=12; break;
	case 0526: card_name="Gigalith"; card_stage=3;  card_type_a=10; card_type_b=-1; card_base_hp=85; card_base_atk=135+60; card_base_def=130+80; card_grid_x=7; card_grid_y=12; break;
	case 0527: card_name="Woobat"; card_stage=1; card_evo[0]=528; card_type_a=7; card_type_b=5; card_base_hp=65; card_base_atk=45+55; card_base_def=43+43; card_grid_x=8; card_grid_y=12; break;
	case 0528: card_name="Swoobat"; card_stage=2;  card_type_a=7; card_type_b=5; card_base_hp=67; card_base_atk=57+77; card_base_def=55+55; card_grid_x=9; card_grid_y=12; break;
	case 0529: card_name="Drilbur"; card_stage=1; card_evo[0]=530; card_type_a=9; card_type_b=-1; card_base_hp=60; card_base_atk=85+30; card_base_def=40+45; card_grid_x=10; card_grid_y=12; break;
	case 0530: card_name="Excadrill"; card_stage=2;  card_type_a=9; card_type_b=15; card_base_hp=110; card_base_atk=135+50; card_base_def=60+65; card_grid_x=12; card_grid_y=12; break;
	case 0531: 
		card_can_mega=true;
		if card_form_value<=999 {
		card_name="Audino"; 
		card_stage=1;  
		card_type_a=0; card_type_b=-1; 
		card_base_hp=103; card_base_atk=60+60; card_base_def=86+86;
		card_grid_x=14; card_grid_y=12; }
		else {
		card_name="M-Audino"; 
		card_stage=1; card_enigma=true;
		card_type_a=0; card_type_b=8; 
		card_base_hp=103; card_base_atk=60+80; card_base_def=126+126;
		card_grid_x=15; card_grid_y=12; }
		break;
	case 0532: card_name="Timburr"; card_stage=1; card_evo[0]=533; card_type_a=6; card_type_b=-1; card_base_hp=75; card_base_atk=80+25; card_base_def=55+35; card_grid_x=1; card_grid_y=13; break;
	case 0533: card_name="Gurdurr"; card_stage=2; card_evo[0]=534; card_type_a=6; card_type_b=-1; card_base_hp=85; card_base_atk=105+40; card_base_def=85+50; card_grid_x=2; card_grid_y=13; break;
	case 0534: card_name="Conkeldurr"; card_stage=3;  card_type_a=6; card_type_b=-1; card_base_hp=105; card_base_atk=140+55; card_base_def=95+65; card_grid_x=3; card_grid_y=13; break;
	case 0535: card_name="Tympole"; card_stage=1; card_evo[0]=536; card_type_a=3; card_type_b=-1; card_base_hp=50; card_base_atk=50+50; card_base_def=40+40; card_grid_x=4; card_grid_y=13; break;
	case 0536: card_name="Palpitoad"; card_stage=2; card_evo[0]=537; card_type_a=3; card_type_b=9; card_base_hp=75; card_base_atk=65+65; card_base_def=55+55; card_grid_x=5; card_grid_y=13; break;
	case 0537: card_name="Seismitoad"; card_stage=3;  card_type_a=3; card_type_b=9; card_base_hp=105; card_base_atk=95+85; card_base_def=75+75; card_grid_x=6; card_grid_y=13; break;
	case 0538: card_name="Throh"; card_stage=1;  card_type_a=6; card_type_b=-1; card_base_hp=120; card_base_atk=100+30; card_base_def=85+85; card_grid_x=7; card_grid_y=13; break;
	case 0539: card_name="Sawk"; card_stage=1;  card_type_a=6; card_type_b=-1; card_base_hp=75; card_base_atk=125+30; card_base_def=75+75; card_grid_x=8; card_grid_y=13; break;
	case 0540: card_name="Sewaddle"; card_stage=1; card_evo[0]=541; card_type_a=11; card_type_b=1; card_base_hp=45; card_base_atk=53+40; card_base_def=70+60; card_grid_x=10; card_grid_y=13; break;
	case 0541: card_name="Swadloon"; card_stage=2; card_evo[0]=542; card_type_a=11; card_type_b=1; card_base_hp=55; card_base_atk=63+50; card_base_def=90+80; card_grid_x=11; card_grid_y=13; break;
	case 0542: card_name="Leavanny"; card_stage=3;  card_type_a=11; card_type_b=1; card_base_hp=75; card_base_atk=103+70; card_base_def=80+80; card_grid_x=12; card_grid_y=13; break;
	case 0543: card_name="Venipede"; card_stage=1; card_evo[0]=544; card_type_a=11; card_type_b=12; card_base_hp=30; card_base_atk=45+30; card_base_def=59+39; card_grid_x=13; card_grid_y=13; break;
	case 0544: card_name="Whirlipede"; card_stage=2; card_evo[0]=545; card_type_a=11; card_type_b=12; card_base_hp=40; card_base_atk=55+40; card_base_def=99+79; card_grid_x=14; card_grid_y=13; break;
	case 0545: card_name="Scolipede"; card_stage=3;  card_type_a=11; card_type_b=12; card_base_hp=60; card_base_atk=100+55; card_base_def=89+69; card_grid_x=15; card_grid_y=13; break;
	case 0546: card_name="Cottonee"; card_stage=1; card_evo[0]=547; card_type_a=1; card_type_b=8; card_base_hp=40; card_base_atk=27+37; card_base_def=60+50; card_grid_x=1; card_grid_y=14; break;
	case 0547: card_name="Whimsicott"; card_stage=2;  card_type_a=1; card_type_b=8; card_base_hp=60; card_base_atk=67+77; card_base_def=85+75; card_grid_x=2; card_grid_y=14; break;
	case 0548: card_name="Petilil"; card_stage=1; card_evo[0]=549; card_type_a=1; card_type_b=-1; card_base_hp=45; card_base_atk=35+70; card_base_def=50+50; card_grid_x=3; card_grid_y=14; break;
	case 0549: 
		card_name="Lilligant"; 
		card_stage=2;  
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=1; card_type_b=-1; 
			card_base_hp=70; 
			card_base_atk=60+110; 
			card_base_def=75+75; 
			card_grid_x=4; card_grid_y=14; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=1; card_type_b=6; 
			card_base_hp=70; 
			card_base_atk=105+50; 
			card_base_def=75+75; 
			card_grid_x=6; card_grid_y=11; }
		break;
	case 0550: card_name="Basculin"; card_has_forms=true; card_stage=1;  card_type_a=3; card_type_b=-1; card_base_hp=70; card_base_atk=92+80; card_base_def=65+55; 
	if card_form_value<333{card_grid_x=6; card_grid_y=14;}
	else if card_form_value<666{card_grid_x=7; card_grid_y=14;}
	else {card_sheet=sp_poke_d; card_evo[0]=902;  card_grid_x=7; card_grid_y=11;}	break;
	case 0551: card_name="Sandile"; card_stage=1; card_evo[0]=552; card_type_a=9; card_type_b=17; card_base_hp=50; card_base_atk=72+35; card_base_def=35+35; card_grid_x=8; card_grid_y=14; break;
	case 0552: card_name="Krokorok"; card_stage=2; card_evo[0]=553; card_type_a=9; card_type_b=17; card_base_hp=60; card_base_atk=82+45; card_base_def=45+45; card_grid_x=9; card_grid_y=14; break;
	case 0553: card_name="Krookodile"; card_stage=3;  card_type_a=9; card_type_b=17; card_base_hp=95; card_base_atk=117+65; card_base_def=80+70; card_grid_x=10; card_grid_y=14; break;
	case 0554: 
			card_name="Darumaka"; 
			card_stage=1; card_evo[0]=555; 
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=2; card_type_b=-1; 
			card_base_hp=70; 
			card_base_atk=90+15; 
			card_base_def=45+45; 
			card_grid_x=11; card_grid_y=14; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=13; card_type_b=-1; 
			card_base_hp=70; 
			card_base_atk=90+15; 
			card_base_def=45+45; 
			card_grid_x=8; card_grid_y=11; }
		break;
	case 0555: //
		card_form_change=true; 
		card_has_forms=true; 
		card_name="Darmanitan"; card_stage=2;  
		if card_form_value<250{
			card_type_a=2; card_type_b=-1; 
			card_base_hp=105; 
			card_base_atk=140+30; 
			card_base_def=55+55; 
			card_grid_x=12; card_grid_y=14;} 
		else if card_form_value<500{
			card_type_a=2; card_type_b=7; 
			card_base_hp=105; 
			card_base_atk=30+140; 
			card_base_def=105+105; 
			card_grid_x=13; card_grid_y=14;} 
		else if card_form_value<750{
			card_sheet=sp_poke_d;
			card_type_a=13; card_type_b=-1; 
			card_base_hp=105; 
			card_base_atk=140+30; 
			card_base_def=55+55; 
			card_grid_x=9; card_grid_y=11;} 
		else {
			card_sheet=sp_poke_d;
			card_type_a=13; card_type_b=2; 
			card_base_hp=105; 
			card_base_atk=160+30; 
			card_base_def=55+55; 
			card_grid_x=10; card_grid_y=11;} 
		break;
	case 0556: card_name="Maractus"; card_stage=1;  card_type_a=1; card_type_b=-1; card_base_hp=75; card_base_atk=86+106; card_base_def=67+67; card_grid_x=14; card_grid_y=14; break;
	case 0557: card_name="Dwebble"; card_stage=1; card_evo[0]=558; card_type_a=11; card_type_b=10; card_base_hp=50; card_base_atk=65+35; card_base_def=85+35; card_grid_x=15; card_grid_y=14; break;
	case 0558: card_name="Crustle"; card_stage=2;  card_type_a=11; card_type_b=10; card_base_hp=70; card_base_atk=105+65; card_base_def=125+75; card_grid_x=1; card_grid_y=15; break;
	case 0559: card_name="Scraggy"; card_stage=1; card_evo[0]=560; card_type_a=17; card_type_b=6; card_base_hp=50; card_base_atk=75+35; card_base_def=70+70; card_grid_x=2; card_grid_y=15; break;
	case 0560: card_name="Scrafty"; card_stage=2;  card_type_a=17; card_type_b=6; card_base_hp=65; card_base_atk=90+45; card_base_def=115+115; card_grid_x=3; card_grid_y=15; break;
	case 0561: card_name="Sigilyph"; card_stage=1;  card_type_a=7; card_type_b=5; card_base_hp=72; card_base_atk=58+103; card_base_def=80+80; card_grid_x=4; card_grid_y=15; break;
	case 0562: 
		card_name="Yamask"; 
		card_has_forms=true;	
		if card_form_value<500 {
			card_stage=1; card_evo[0]=563; 
			card_type_a=16; card_type_b=-1; 
			card_base_hp=38; 
			card_base_atk=30+55; 
			card_base_def=85+65; 
			card_grid_x=5; card_grid_y=15; }
		else {
			card_sheet=sp_poke_d;
			card_stage=1; card_evo[0]=867; 
			card_type_a=9; card_type_b=16; 
			card_base_hp=38; 
			card_base_atk=55+30; 
			card_base_def=85+65; 
			card_grid_x=11; card_grid_y=11; }
	break;
	case 0563: card_name="Cofagrigus"; card_stage=2;  card_type_a=16; card_type_b=-1; card_base_hp=58; card_base_atk=50+95; card_base_def=145+105; card_grid_x=6; card_grid_y=15; break;
	case 0564: card_name="Tirtouga"; card_fossil=true; card_stage=1; card_evo[0]=565; card_type_a=3; card_type_b=10; card_base_hp=54; card_base_atk=78+53; card_base_def=103+45; card_grid_x=7; card_grid_y=15; break;
	case 0565: card_name="Carracosta"; card_fossil=true; card_stage=2;  card_type_a=3; card_type_b=10; card_base_hp=74; card_base_atk=108+83; card_base_def=133+65; card_grid_x=8; card_grid_y=15; break;
	case 0566: card_name="Archen"; card_fossil=true; card_stage=1; card_evo[0]=567; card_type_a=10; card_type_b=5; card_base_hp=55; card_base_atk=112+74; card_base_def=45+45; card_grid_x=9; card_grid_y=15; break;
	case 0567: card_name="Archeops"; card_fossil=true; card_stage=2;  card_type_a=10; card_type_b=5; card_base_hp=75; card_base_atk=140+112; card_base_def=65+65; card_grid_x=10; card_grid_y=15; break;
	case 0568: card_name="Trubbish"; card_stage=1; card_evo[0]=569; card_type_a=12; card_type_b=-1; card_base_hp=50; card_base_atk=50+40; card_base_def=62+62; card_grid_x=11; card_grid_y=15; break;
	case 0569: card_name="Garbodor"; card_stage=2;  card_type_a=12; card_type_b=-1; card_base_hp=80; card_base_atk=95+60; card_base_def=82+82; card_grid_x=12; card_grid_y=15; break;
	case 0570: 
		card_name="Zorua"; 
		card_has_forms=true;	
		if card_form_value<500 {
			card_stage=1; card_evo[0]=571; 
			card_type_a=17; card_type_b=-1; 
			card_base_hp=40; 
			card_base_atk=65+80; 
			card_base_def=40+40; 
			card_grid_x=14; card_grid_y=15; }
		else {
			card_sheet=sp_poke_d;
			card_stage=1; card_evo[0]=571; 
			card_type_a=00; card_type_b=16; 
			card_base_hp=35; 
			card_base_atk=60+85; 
			card_base_def=40+40; 
			card_grid_x=13; card_grid_y=11; }
		break;
	case 0571: 
		card_name="Zoroark"; 
		card_stage=2;  
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=17; card_type_b=-1; 
			card_base_hp=60; 
			card_base_atk=105+120; 
			card_base_def=60+60; 
			card_grid_x=15; card_grid_y=15; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=00; card_type_b=16; 
			card_base_hp=55; 
			card_base_atk=100+125; 
			card_base_def=60+60; 
			card_grid_x=14; card_grid_y=11; }
		break;
	case 0572: card_name="Minccino"; card_stage=1; card_evo[0]=573; card_type_a=0; card_type_b=-1; card_base_hp=55; card_base_atk=50+40; card_base_def=40+40; card_grid_x=1; card_grid_y=16; break;
	case 0573: card_name="Cinccino"; card_stage=2;  card_type_a=0; card_type_b=-1; card_base_hp=75; card_base_atk=95+65; card_base_def=60+60; card_grid_x=2; card_grid_y=16; break;
	case 0574: card_name="Gothita"; card_stage=1; card_evo[0]=575; card_type_a=7; card_type_b=-1; card_base_hp=45; card_base_atk=30+55; card_base_def=50+65; card_grid_x=3; card_grid_y=16; break;
	case 0575: card_name="Gothorita"; card_stage=2; card_evo[0]=576; card_type_a=7; card_type_b=-1; card_base_hp=60; card_base_atk=45+75; card_base_def=70+85; card_grid_x=4; card_grid_y=16; break;
	case 0576: card_name="Gothitelle"; card_stage=3;  card_type_a=7; card_type_b=-1; card_base_hp=70; card_base_atk=55+95; card_base_def=95+110; card_grid_x=5; card_grid_y=16; break;
	case 0577: card_name="Solosis"; card_stage=1; card_evo[0]=578; card_type_a=7; card_type_b=-1; card_base_hp=45; card_base_atk=30+105; card_base_def=40+50; card_grid_x=6; card_grid_y=16; break;
	case 0578: card_name="Duosion"; card_stage=2; card_evo[0]=579; card_type_a=7; card_type_b=-1; card_base_hp=65; card_base_atk=40+125; card_base_def=50+60; card_grid_x=8; card_grid_y=16; break;
	case 0579: card_name="Reuniclus"; card_stage=3;  card_type_a=7; card_type_b=-1; card_base_hp=110; card_base_atk=65+125; card_base_def=75+85; card_grid_x=9; card_grid_y=16; break;
	case 0580: card_name="Ducklett"; card_stage=1; card_evo[0]=581; card_type_a=3; card_type_b=5; card_base_hp=62; card_base_atk=44+44; card_base_def=50+50; card_grid_x=10; card_grid_y=16; break;
	case 0581: card_name="Swanna"; card_stage=2;  card_type_a=3; card_type_b=5; card_base_hp=75; card_base_atk=87+87; card_base_def=63+63; card_grid_x=11; card_grid_y=16; break;
	case 0582: card_name="Vanillite"; card_stage=1; card_evo[0]=583; card_type_a=13; card_type_b=-1; card_base_hp=36; card_base_atk=50+65; card_base_def=50+60; card_grid_x=12; card_grid_y=16; break;
	case 0583: card_name="Vanillish"; card_stage=2; card_evo[0]=584; card_type_a=13; card_type_b=-1; card_base_hp=51; card_base_atk=65+80; card_base_def=65+75; card_grid_x=13; card_grid_y=16; break;
	case 0584: card_name="Vanilluxe"; card_stage=3;  card_type_a=13; card_type_b=-1; card_base_hp=71; card_base_atk=95+110; card_base_def=85+95; card_grid_x=14; card_grid_y=16; break;
	
	case 0585: card_form_change=true; card_has_forms=true; card_name="Deerling"; card_stage=1; card_evo[0]=586; card_type_a=0; card_type_b=1; card_base_hp=60; card_base_atk=60+40; card_base_def=50+50; 
		if card_form_value<=250 {
		card_grid_x=1; card_grid_y=17; 
		}
		else if card_form_value<500 {
		card_grid_x=2; card_grid_y=17; 
		}
		else if card_form_value<=750 {
		card_grid_x=3; card_grid_y=17; 
		}
		else {
		card_grid_x=4; card_grid_y=17; 
		}
		break;
	
	case 0586: card_form_change=true; card_has_forms=true; card_name="Sawsbuck"; card_stage=2;  card_type_a=0; card_type_b=1; card_base_hp=80; card_base_atk=100+60; card_base_def=70+70; 
		if card_form_value<=250 {
		card_grid_x=5; card_grid_y=17; 
		}
		else if card_form_value<500 {
		card_grid_x=6; card_grid_y=17; 
		}
		else if card_form_value<=750 {
		card_grid_x=7; card_grid_y=17; 
		}
		else {
		card_grid_x=8; card_grid_y=17; 
		}
		break;
	
	case 0587: card_name="Emolga"; card_stage=1;  card_type_a=4; card_type_b=5; card_base_hp=55; card_base_atk=75+75; card_base_def=60+60; card_grid_x=9; card_grid_y=17; break;
	case 0588: card_name="Karrablast"; card_stage=1; card_evo[0]=589; card_type_a=11; card_type_b=-1; card_base_hp=50; card_base_atk=75+40; card_base_def=45+45; card_grid_x=10; card_grid_y=17; break;
	case 0589: card_name="Escavalier"; card_stage=2;  card_type_a=11; card_type_b=15; card_base_hp=70; card_base_atk=135+60; card_base_def=105+105; card_grid_x=11; card_grid_y=17; break;
	case 0590: card_name="Foongus"; card_stage=1; card_evo[0]=591; card_type_a=1; card_type_b=12; card_base_hp=69; card_base_atk=55+55; card_base_def=45+55; card_grid_x=12; card_grid_y=17; break;
	case 0591: card_name="Amoonguss"; card_stage=2;  card_type_a=1; card_type_b=12; card_base_hp=114; card_base_atk=85+85; card_base_def=70+80; card_grid_x=13; card_grid_y=17; break;
	case 0592: card_name="Frillish"; card_stage=1; card_evo[0]=593;  card_type_a=3; card_type_b=16; card_base_hp=55; card_base_atk=40+65; card_base_def=50+85; card_grid_x=15; card_grid_y=17; break;
	//case 0592: card_name="Frillish"; card_stage=1; card_evo[0]=593; card_type_a=3; card_type_b=16; card_base_hp=55; card_base_atk=40+65; card_base_def=50+85; card_grid_x=1; card_grid_y=18; break;
	case 0593: card_name="Jellicent"; card_stage=2;  card_type_a=3; card_type_b=16; card_base_hp=100; card_base_atk=60+85; card_base_def=70+105; card_grid_x=2; card_grid_y=18; break;
	//case 0593: card_name="Jellicent"; card_stage=2;  card_type_a=3; card_type_b=16; card_base_hp=100; card_base_atk=60+85; card_base_def=70+105; card_grid_x=3; card_grid_y=18; break;
	case 0594: card_name="Alomomola"; card_stage=1;  card_type_a=3; card_type_b=-1; card_base_hp=165; card_base_atk=75+40; card_base_def=80+45; card_grid_x=4; card_grid_y=18; break;
	case 0595: card_name="Joltik"; card_stage=1; card_evo[0]=596; card_type_a=11; card_type_b=4; card_base_hp=50; card_base_atk=47+57; card_base_def=50+50; card_grid_x=5; card_grid_y=18; break;
	case 0596: card_name="Galvantula"; card_stage=2;  card_type_a=11; card_type_b=4; card_base_hp=70; card_base_atk=77+97; card_base_def=60+60; card_grid_x=6; card_grid_y=18; break;
	case 0597: card_name="Ferroseed"; card_stage=1; card_evo[0]=598; card_type_a=1; card_type_b=15; card_base_hp=44; card_base_atk=50+24; card_base_def=91+86; card_grid_x=7; card_grid_y=18; break;
	case 0598: card_name="Ferrothorn"; card_stage=2;  card_type_a=1; card_type_b=15; card_base_hp=74; card_base_atk=94+54; card_base_def=131+116; card_grid_x=8; card_grid_y=18; break;
	case 0599: card_name="Klink"; card_stage=1; card_evo[0]=600; card_type_a=15; card_type_b=-1; card_base_hp=40; card_base_atk=55+45; card_base_def=70+60; card_grid_x=9; card_grid_y=18; break;
	case 0600: card_name="Klang"; card_stage=2; card_evo[0]=601; card_type_a=15; card_type_b=-1; card_base_hp=60; card_base_atk=80+70; card_base_def=95+85; card_grid_x=11; card_grid_y=18; break;
	case 0601: card_name="Klinklang"; card_stage=3;  card_type_a=15; card_type_b=-1; card_base_hp=60; card_base_atk=100+70; card_base_def=115+85; card_grid_x=13; card_grid_y=18; break;
	case 0602: card_name="Tynamo"; card_stage=1; card_evo[0]=603; card_type_a=4; card_type_b=-1; card_base_hp=35; card_base_atk=55+45; card_base_def=40+40; card_grid_x=15; card_grid_y=18; break;
	case 0603: card_name="Eelektrik"; card_stage=2; card_evo[0]=604; card_type_a=4; card_type_b=-1; card_base_hp=65; card_base_atk=85+75; card_base_def=70+70; card_grid_x=1; card_grid_y=19; break;
	case 0604: card_name="Eelektross"; card_stage=3;  card_type_a=4; card_type_b=-1; card_base_hp=85; card_base_atk=115+105; card_base_def=80+80; card_grid_x=2; card_grid_y=19; break;
	case 0605: card_name="Elgyem"; card_stage=1; card_evo[0]=606; card_type_a=7; card_type_b=-1; card_base_hp=55; card_base_atk=55+85; card_base_def=55+55; card_grid_x=3; card_grid_y=19; break;
	case 0606: card_name="Beheeyem"; card_stage=2;  card_type_a=7; card_type_b=-1; card_base_hp=75; card_base_atk=75+125; card_base_def=75+95; card_grid_x=4; card_grid_y=19; break;
	case 0607: card_name="Litwick"; card_stage=1; card_evo[0]=608; card_type_a=16; card_type_b=2; card_base_hp=50; card_base_atk=30+65; card_base_def=55+55; card_grid_x=5; card_grid_y=19; break;
	case 0608: card_name="Lampent"; card_stage=2; card_evo[0]=609; card_type_a=16; card_type_b=2; card_base_hp=60; card_base_atk=40+95; card_base_def=60+60; card_grid_x=7; card_grid_y=19; break;
	case 0609: card_name="Chandelure"; card_stage=3;  card_type_a=16; card_type_b=2; card_base_hp=60; card_base_atk=55+145; card_base_def=90+90; card_grid_x=8; card_grid_y=19; break;
	case 0610: card_name="Axew"; card_stage=1; card_evo[0]=611; card_type_a=14; card_type_b=-1; card_base_hp=46; card_base_atk=87+30; card_base_def=60+40; card_grid_x=9; card_grid_y=19; break;
	case 0611: card_name="Fraxure"; card_stage=2; card_evo[0]=612; card_type_a=14; card_type_b=-1; card_base_hp=66; card_base_atk=117+40; card_base_def=70+50; card_grid_x=10; card_grid_y=19; break;
	case 0612: card_name="Haxorus"; card_stage=3;  card_type_a=14; card_type_b=-1; card_base_hp=76; card_base_atk=147+60; card_base_def=90+70; card_grid_x=11; card_grid_y=19; break;
	case 0613: card_name="Cubchoo"; card_stage=1; card_evo[0]=614; card_type_a=13; card_type_b=-1; card_base_hp=55; card_base_atk=70+60; card_base_def=40+40; card_grid_x=12; card_grid_y=19; break;
	case 0614: card_name="Beartic"; card_stage=2;  card_type_a=13; card_type_b=-1; card_base_hp=95; card_base_atk=130+70; card_base_def=80+80; card_grid_x=13; card_grid_y=19; break;
	case 0615: card_name="Cryogonal"; card_stage=1;  card_type_a=13; card_type_b=-1; card_base_hp=80; card_base_atk=50+95; card_base_def=50+135; card_grid_x=14; card_grid_y=19; break;
	case 0616: card_name="Shelmet"; card_stage=1; card_evo[0]=617; card_type_a=11; card_type_b=-1; card_base_hp=50; card_base_atk=40+40; card_base_def=85+65; card_grid_x=15; card_grid_y=19; break;
	case 0617: card_name="Accelgor"; card_stage=2;  card_type_a=11; card_type_b=-1; card_base_hp=80; card_base_atk=70+100; card_base_def=40+60; card_grid_x=1; card_grid_y=20; break;
	case 0618: 
		card_name="Stunfisk"; 
		card_stage=1;  
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=9; card_type_b=4; 
			card_base_hp=109; 
			card_base_atk=66+81; 
			card_base_def=84+99; 
			card_grid_x=2; card_grid_y=20; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=9; card_type_b=15; 
			card_base_hp=109; 
			card_base_atk=81+66; 
			card_base_def=99+84; 
			card_grid_x=15; card_grid_y=11; }
		break;
	case 0619: card_name="Mienfoo"; card_stage=1; card_evo[0]=620; card_type_a=6; card_type_b=-1; card_base_hp=45; card_base_atk=85+55; card_base_def=50+50; card_grid_x=3; card_grid_y=20; break;
	case 0620: card_name="Mienshao"; card_stage=2;  card_type_a=6; card_type_b=-1; card_base_hp=65; card_base_atk=125+95; card_base_def=60+60; card_grid_x=4; card_grid_y=20; break;
	case 0621: card_name="Druddigon"; card_stage=1;  card_type_a=14; card_type_b=-1; card_base_hp=77; card_base_atk=120+60; card_base_def=90+90; card_grid_x=5; card_grid_y=20; break;
	case 0622: card_name="Golett"; card_stage=1; card_evo[0]=623; card_type_a=9; card_type_b=16; card_base_hp=59; card_base_atk=74+35; card_base_def=50+50; card_grid_x=6; card_grid_y=20; break;
	case 0623: card_name="Golurk"; card_stage=2;  card_type_a=9; card_type_b=16; card_base_hp=89; card_base_atk=124+55; card_base_def=80+80; card_grid_x=8; card_grid_y=20; break;
	case 0624: card_name="Pawniard"; card_stage=1; card_evo[0]=625; card_type_a=17; card_type_b=15; card_base_hp=45; card_base_atk=85+40; card_base_def=70+40; card_grid_x=10; card_grid_y=20; break;
	case 0625: card_name="Bisharp"; card_stage=2;  card_type_a=17; card_type_b=15; card_base_hp=65; card_base_atk=125+60; card_base_def=100+70; card_grid_x=11; card_grid_y=20; break;
	case 0626: card_name="Bouffalant"; card_stage=1;  card_type_a=0; card_type_b=-1; card_base_hp=95; card_base_atk=110+40; card_base_def=95+95; card_grid_x=12; card_grid_y=20; break;
	case 0627: card_name="Rufflet"; card_stage=1; card_evo[0]=628; card_type_a=0; card_type_b=5; card_base_hp=70; card_base_atk=83+37; card_base_def=50+50; card_grid_x=13; card_grid_y=20; break;
	case 0628: 
		card_name="Braviary"; 
		card_stage=2;  
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=0; card_type_b=5; 
			card_base_hp=100; 
			card_base_atk=123+57; 
			card_base_def=75+75; 
			card_grid_x=14; card_grid_y=20; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=7; card_type_b=5; 
			card_base_hp=110; 
			card_base_atk=83+112; 
			card_base_def=70+70; 
			card_grid_x=1; card_grid_y=12; }
		break;
	case 0629: card_name="Vullaby"; card_stage=1; card_evo[0]=630;  card_type_a=17; card_type_b=5; card_base_hp=70; card_base_atk=55+45; card_base_def=75+65; card_grid_x=15; card_grid_y=20; break;
	case 0630: card_name="Mandibuzz"; card_stage=1;  card_type_a=17; card_type_b=5; card_base_hp=110; card_base_atk=65+55; card_base_def=105+95; card_grid_x=1; card_grid_y=21; break;
	case 0631: card_name="Heatmor"; card_stage=1;  card_type_a=2; card_type_b=-1; card_base_hp=85; card_base_atk=97+105; card_base_def=66+66; card_grid_x=2; card_grid_y=21; break;
	case 0632: card_name="Durant"; card_stage=1;  card_type_a=11; card_type_b=15; card_base_hp=58; card_base_atk=109+48; card_base_def=112+48; card_grid_x=3; card_grid_y=21; break;
	case 0633: card_name="Deino"; card_pseudo=true; card_stage=1; card_evo[0]=634; card_type_a=17; card_type_b=14; card_base_hp=52; card_base_atk=65+45; card_base_def=50+50; card_grid_x=4; card_grid_y=21; break;
	case 0634: card_name="Zweilous"; card_pseudo=true; card_stage=2; card_evo[0]=635; card_type_a=17; card_type_b=14; card_base_hp=72; card_base_atk=85+65; card_base_def=70+70; card_grid_x=5; card_grid_y=21; break;
	case 0635: card_name="Hydreigon"; card_pseudo=true; card_stage=3;  card_type_a=17; card_type_b=14; card_base_hp=92; card_base_atk=105+125; card_base_def=90+90; card_grid_x=6; card_grid_y=21; break;
	case 0636: card_name="Larvesta"; card_stage=1; card_evo[0]=637; card_type_a=11; card_type_b=2; card_base_hp=55; card_base_atk=85+50; card_base_def=55+55; card_grid_x=7; card_grid_y=21; break;
	case 0637: card_name="Volcarona"; card_stage=2;  card_type_a=11; card_type_b=2; card_base_hp=85; card_base_atk=60+135; card_base_def=65+105; card_grid_x=8; card_grid_y=21; break;
	case 0638: card_name="Cobalion"; card_stage=1;  card_enigma=true; card_type_a=15; card_type_b=6; card_base_hp=91; card_base_atk=90+90; card_base_def=129+72; card_grid_x=9; card_grid_y=21; break;
	case 0639: card_name="Terrakion"; card_stage=1;  card_enigma=true; card_type_a=10; card_type_b=6; card_base_hp=91; card_base_atk=129+72; card_base_def=90+90; card_grid_x=10; card_grid_y=21; break;
	case 0640: card_name="Virizion"; card_stage=1;  card_enigma=true; card_type_a=1; card_type_b=6; card_base_hp=91; card_base_atk=90+90; card_base_def=72+129; card_grid_x=11; card_grid_y=21; break;
	case 0641: card_form_change=true; card_has_forms=true; card_name="Tornadus"; card_stage=1;  card_enigma=true; card_type_a=5; card_type_b=-1; 
		if card_form_value<500{
		card_base_hp=79; card_base_atk=115+125; card_base_def=70+80; 
		card_grid_x=12; card_grid_y=21; }
		else {
		card_base_hp=79; card_base_atk=100+110; card_base_def=80+90; 
		card_grid_x=13; card_grid_y=21; }
		break;
	case 0642: card_form_change=true; card_has_forms=true; card_name="Thundurus"; card_stage=1;  card_enigma=true; card_type_a=4; card_type_b=5; 
		if card_form_value<500{
		card_base_hp=79; card_base_atk=115+125; card_base_def=70+80; 
		card_grid_x=14; card_grid_y=21; }
		else {
		card_base_hp=79; card_base_atk=105+145; card_base_def=70+80; 
		card_grid_x=15; card_grid_y=21; }
		break;
		
	case 0643: card_name="Reshiram"; card_stage=1;  card_enigma=true; card_type_a=14; card_type_b=2; card_base_hp=100; card_base_atk=120+150; card_base_def=100+120; card_grid_x=1; card_grid_y=22; break;
	case 0644: card_name="Zekrom"; card_stage=1;  card_enigma=true; card_type_a=14; card_type_b=4; card_base_hp=100; card_base_atk=150+120; card_base_def=120+100; card_grid_x=2; card_grid_y=22; break;
	case 0645: card_form_change=true; card_has_forms=true; card_name="Landorus"; card_stage=1;  card_enigma=true; card_type_a=9; card_type_b=5; 
		if card_form_value<500{
		card_base_hp=89; card_base_atk=125+115; card_base_def=90+80; card_grid_x=3; card_grid_y=22; }
		else {
		card_base_hp=89; card_base_atk=145+105; card_base_def=90+80; card_grid_x=4; card_grid_y=22; }
		break;
	
	case 0646: card_form_change=true; card_has_forms=true; card_name="Kyurem"; card_stage=1;  card_enigma=true; card_type_a=14; card_type_b=13; 
		if card_form_value<=333{
		card_base_hp=125; card_base_atk=130+130; card_base_def=90+90; card_grid_x=5; card_grid_y=22; }
		else if card_form_value<=666{
		card_base_hp=125; card_base_atk=120+170; card_base_def=90+100; card_grid_x=7; card_grid_y=22; }
		else {
		card_base_hp=125; card_base_atk=170+120; card_base_def=100+90; card_grid_x=9; card_grid_y=22; }
		break;
	
	case 0647: card_form_change=true; card_has_forms=true; card_name="Keldeo"; card_stage=1;  card_enigma=true; card_type_a=3; card_type_b=6; 
		if card_form_value<500{
		card_base_hp=91; card_base_atk=72+129; card_base_def=90+90; card_grid_x=11; card_grid_y=22; }
		else{
		card_base_hp=91; card_base_atk=72+129; card_base_def=90+90; card_grid_x=12; card_grid_y=22; }
		break;
	
	case 0648: card_form_change=true; card_has_forms=true; card_name="Meloetta"; card_stage=1;  card_enigma=true; 
		if card_form_value<500{
		card_type_a=0; card_type_b=7; card_base_hp=100; card_base_atk=77+128; card_base_def=77+128; card_grid_x=14; card_grid_y=22; }
		else{
		card_type_a=0; card_type_b=6; card_base_hp=100; card_base_atk=128+77; card_base_def=90+77; card_grid_x=1; card_grid_y=23; }
		break;
	
	case 0649: card_name="Genesect"; card_stage=1;  card_enigma=true; card_type_a=11; card_type_b=15; card_base_hp=71; card_base_atk=120+120; card_base_def=95+95; card_grid_x=3; card_grid_y=23; break;

	// Gen 6
	case 0650: card_name="Chespin"; card_stage=1;  card_evo[0]=651; card_starter=true; card_type_a=1; card_type_b=-1; card_base_hp=56; card_base_atk=61+48; card_base_def=65+45; card_grid_x=1; card_grid_y=24; break;
	case 0651: card_name="Quilladin"; card_stage=2;  card_evo[0]=652; card_starter=true; card_type_a=1; card_type_b=-1; card_base_hp=61; card_base_atk=78+56; card_base_def=95+58; card_grid_x=2; card_grid_y=24; break;
	case 0652: card_name="Chesnaught"; card_stage=3;  card_starter=true; card_type_a=1; card_type_b=6; card_base_hp=88; card_base_atk=107+74; card_base_def=122+75; card_grid_x=3; card_grid_y=24; break;
	case 0653: card_name="Fennekin"; card_stage=1;  card_evo[0]=654; card_starter=true; card_type_a=2; card_type_b=-1; card_base_hp=40; card_base_atk=45+62; card_base_def=40+60; card_grid_x=4; card_grid_y=24; break;
	case 0654: card_name="Braixen"; card_stage=2;  card_evo[0]=655; card_starter=true; card_type_a=2; card_type_b=-1; card_base_hp=59; card_base_atk=59+90; card_base_def=58+70; card_grid_x=5; card_grid_y=24; break;
	case 0655: card_name="Delphox"; card_stage=3;  card_starter=true; card_type_a=2; card_type_b=7; card_base_hp=75; card_base_atk=69+114; card_base_def=72+100; card_grid_x=6; card_grid_y=24; break;
	case 0656: card_name="Froakie"; card_stage=1;  card_evo[0]=657; card_starter=true; card_type_a=3; card_type_b=-1; card_base_hp=41; card_base_atk=56+62; card_base_def=40+44; card_grid_x=7; card_grid_y=24; break;
	case 0657: card_name="Frogadier"; card_stage=2;  card_evo[0]=658; card_starter=true; card_type_a=3; card_type_b=-1; card_base_hp=54; card_base_atk=63+83; card_base_def=52+56; card_grid_x=8; card_grid_y=24; break;
	
	case 0658: 
		card_can_mega=true;
		card_stage=3;  card_starter=true;
		card_type_a=3; card_type_b=17; 
		if card_form_value<=999{
		card_name="Greninja"; 
		card_base_hp=72; card_base_atk=95+103; card_base_def=67+71; card_grid_x=9; card_grid_y=24; }
		else{
		card_name="Ash-Greninja";  card_enigma=true;
		card_base_hp=72; card_base_atk=145+153; card_base_def=67+71; card_grid_x=11; card_grid_y=24; }
		break;
	
	case 0659: card_name="Bunnelby"; card_stage=1;  card_evo[0]=660; card_type_a=0; card_type_b=-1; card_base_hp=38; card_base_atk=36+32; card_base_def=38+36; card_grid_x=13; card_grid_y=24; break;
	case 0660: card_name="Diggersby"; card_stage=2;  card_type_a=0; card_type_b=9; card_base_hp=85; card_base_atk=56+50; card_base_def=77+77; card_grid_x=14; card_grid_y=24; break;
	case 0661: card_name="Fletchling"; card_stage=1;  card_evo[0]=662; card_type_a=0; card_type_b=5; card_base_hp=45; card_base_atk=50+40; card_base_def=43+38; card_grid_x=15; card_grid_y=24; break;
	case 0662: card_name="Fletchinder"; card_stage=2;  card_evo[0]=663; card_type_a=2; card_type_b=5; card_base_hp=62; card_base_atk=73+56; card_base_def=55+52; card_grid_x=1; card_grid_y=25; break;
	case 0663: card_name="Talonflame"; card_stage=3;  card_type_a=2; card_type_b=5; card_base_hp=78; card_base_atk=81+74; card_base_def=71+69; card_grid_x=2; card_grid_y=25; break;
	case 0664: card_name="Scatterbug"; card_stage=1;  card_evo[0]=665; card_type_a=11; card_type_b=-1; card_base_hp=38; card_base_atk=35+27; card_base_def=40+25; card_grid_x=3; card_grid_y=25; break;
	case 0665: card_name="Spewpa"; card_stage=2;  card_evo[0]=666; card_type_a=11; card_type_b=-1; card_base_hp=45; card_base_atk=22+27; card_base_def=60+30; card_grid_x=4; card_grid_y=25; break;
	case 0666: card_name="Vivillon"; card_stage=3; card_evo[0]=666; card_type_a=11; card_type_b=5; card_base_hp=80; card_base_atk=52+90; card_base_def=50+50;  
	if card_form_value<50{ card_grid_x=5; card_grid_y=25;}
	else if card_form_value<100{ card_grid_x=6; card_grid_y=25;}
	else if card_form_value<150{ card_grid_x=7; card_grid_y=25;}
	else if card_form_value<200{ card_grid_x=8; card_grid_y=25;}
	else if card_form_value<250{ card_grid_x=9; card_grid_y=25;}
	else if card_form_value<300{ card_grid_x=10; card_grid_y=25;}
	else if card_form_value<350{ card_grid_x=11; card_grid_y=25;}
	else if card_form_value<400{ card_grid_x=12; card_grid_y=25;}
	else if card_form_value<450{ card_grid_x=13; card_grid_y=25;}
	else if card_form_value<500{ card_grid_x=14; card_grid_y=25;}
	else if card_form_value<550{ card_grid_x=15; card_grid_y=25;}
	else if card_form_value<600{ card_grid_x=1; card_grid_y=26;}
	else if card_form_value<650{ card_grid_x=2; card_grid_y=26;}
	else if card_form_value<700{ card_grid_x=3; card_grid_y=26;}
	else if card_form_value<750{ card_grid_x=4; card_grid_y=26;}
	else if card_form_value<800{ card_grid_x=5; card_grid_y=26;}
	else if card_form_value<850{ card_grid_x=6; card_grid_y=26;}
	else if card_form_value<900{ card_grid_x=7; card_grid_y=26;}
	else if card_form_value<950{ card_grid_x=8; card_grid_y=26;}
	else { card_grid_x=9; card_grid_y=26;} break;
	
	case 0667: card_name="Litleo"; card_stage=1;  card_evo[0]=668; card_type_a=2; card_type_b=0; card_base_hp=62; card_base_atk=50+73; card_base_def=58+54; card_grid_x=10; card_grid_y=26; break;
	case 0668: card_name="Pyroar"; card_stage=2;  card_type_a=2; card_type_b=0; card_base_hp=86; card_base_atk=68+109; card_base_def=72+66; 
	
	if card_form_value<500 {	card_grid_x=11; card_grid_y=26;}
	else {	card_grid_x=12; card_grid_y=26;} break;
	case 0669: card_name="Flabebe"; card_has_forms=true; card_stage=1;  card_evo[1]=670; card_type_a=8; card_type_b=-1; card_base_hp=44; card_base_atk=38+61; 
	if card_form_value<200{card_base_def=39+79; card_grid_x=13; card_grid_y=26;}
	else if card_form_value<400{card_grid_x=14; card_grid_y=26; }
	else if card_form_value<600{card_grid_x=15; card_grid_y=26; }
	else if card_form_value<800{card_grid_x=1; card_grid_y=27; }
	else{card_grid_x=2; card_grid_y=27; }break;
	
	case 0670: card_name="Floette"; card_has_forms=true; card_stage=2;  card_evo[0]=671; card_type_a=8; card_type_b=-1; 
	if card_form_value<200{card_name="Floette"; card_base_hp=54; 
	card_base_atk=45+75; card_base_def=47+98; 
	card_grid_x=3; card_grid_y=27;}
	else if card_form_value<400{card_name="Floette"; card_base_hp=54; 
	card_base_atk=45+75; card_base_def=47+98; 
	card_grid_x=4; card_grid_y=27;}
	else if card_form_value<600{card_name="Floette"; card_base_hp=54; 
	card_base_atk=45+75; card_base_def=47+98; 
	card_grid_x=5; card_grid_y=27;}
	else if card_form_value<800{card_name="Floette"; card_base_hp=54; 
	card_base_atk=45+75; card_base_def=47+98; 
	card_grid_x=6; card_grid_y=27;}
	else if card_form_value<950{card_name="Floette"; card_base_hp=54; 
	card_base_atk=45+75; card_base_def=47+98; 
	card_grid_x=7; card_grid_y=27;}
	//5% need to set this low so the colour distrubtion is still nice on the others
	else {card_name="E-Floette"; card_base_hp=74; 
	card_base_atk=65+125; card_base_def=67+128; 
	card_grid_x=8; card_grid_y=27;}
	break;
	
	case 0671: card_name="Florges"; card_has_forms=true; card_stage=3;  card_type_a=8; card_type_b=-1; card_base_hp=78; card_base_atk=65+112; card_base_def=68+154; 
	if card_form_value<200{card_grid_x=9; card_grid_y=27;}
	else if card_form_value<400{card_grid_x=10; card_grid_y=27;}
	else if card_form_value<600{card_grid_x=11; card_grid_y=27;}
	else if card_form_value<800{card_grid_x=12; card_grid_y=27;}
	else {card_grid_x=13; card_grid_y=27;}break;
	
	case 0672: card_name="Skiddo"; card_stage=1;  card_evo[0]=673; card_type_a=1; card_type_b=-1; card_base_hp=66; card_base_atk=65+62; card_base_def=48+57; card_grid_x=14; card_grid_y=27; break;
	case 0673: card_name="Gogoat"; card_stage=2;  card_type_a=1; card_type_b=-1; card_base_hp=123; card_base_atk=100+97; card_base_def=62+81; card_grid_x=15; card_grid_y=27; break;
	case 0674: card_name="Pancham"; card_stage=1;  card_evo[0]=675; card_type_a=6; card_type_b=-1; card_base_hp=67; card_base_atk=82+46; card_base_def=62+48; card_grid_x=1; card_grid_y=28; break;
	case 0675: card_name="Pangoro"; card_stage=2;  card_type_a=6; card_type_b=17; card_base_hp=95; card_base_atk=124+69; card_base_def=78+71; card_grid_x=2; card_grid_y=28; break;
	case 0676: card_name="Furfrou"; card_has_forms=true; card_form_change=true; card_stage=1;  card_type_a=0; card_type_b=-1; card_base_hp=75; card_base_atk=80+65; card_base_def=60+90; 
	if card_form_value<100{card_grid_x=3; card_grid_y=28; }
	else if card_form_value<200{card_grid_x=4; card_grid_y=28; }
	else if card_form_value<300{card_grid_x=5; card_grid_y=28; }
	else if card_form_value<400{card_grid_x=6; card_grid_y=28; }
	else if card_form_value<500{card_grid_x=7; card_grid_y=28; }
	else if card_form_value<600{card_grid_x=9; card_grid_y=28; }
	else if card_form_value<700{card_grid_x=10; card_grid_y=28; }
	else if card_form_value<800{card_grid_x=11; card_grid_y=28; }
	else if card_form_value<900{card_grid_x=12; card_grid_y=28; }
	else {card_grid_x=13; card_grid_y=28;} break;
	
	case 0677: card_name="Espurr"; card_stage=1;  card_evo[0]=678; card_type_a=7; card_type_b=-1; card_base_hp=62; card_base_atk=48+63; card_base_def=54+60; card_grid_x=14; card_grid_y=28; break;
	case 0678: card_has_forms=true; card_name="Meowstic"; card_stage=2;  card_type_a=7; card_type_b=-1; card_base_hp=74; card_base_atk=48+83; card_base_def=76+81; 
	if card_form_value<500 {
	card_grid_x=15; card_grid_y=28; }
	else{
	card_grid_x=1; card_grid_y=29; }
	break;
	case 0679: card_name="Honedge"; card_stage=1;  card_evo[0]=680; card_type_a=15; card_type_b=16; card_base_hp=45; card_base_atk=80+35; card_base_def=100+37; card_grid_x=2; card_grid_y=29; break;
	case 0680: card_name="Doublade"; card_stage=2;  card_evo[0]=681; card_type_a=15; card_type_b=16; card_base_hp=59; card_base_atk=110+45; card_base_def=150+49; card_grid_x=3; card_grid_y=29; break;
	case 0681: card_form_change=true; card_has_forms=true; card_name="Aegislash"; card_stage=3;  card_type_a=15; card_type_b=16; 
		if card_form_value<500 {
		card_base_hp=60; card_base_atk=140+140; card_base_def=50+50; card_grid_x=4; card_grid_y=29; 
		}
	  	else {
		card_base_hp=60; card_base_atk=50+50; card_base_def=140+140; card_grid_x=5; card_grid_y=29; 
		}
		break;
	
	case 0682: card_name="Spritzee"; card_stage=1;  card_evo[0]=683; card_type_a=8; card_type_b=-1; card_base_hp=78; card_base_atk=52+63; card_base_def=60+65; card_grid_x=6; card_grid_y=29; break;
	case 0683: card_name="Aromatisse"; card_stage=2;  card_type_a=8; card_type_b=-1; card_base_hp=101; card_base_atk=72+99; card_base_def=72+89; card_grid_x=7; card_grid_y=29; break;
	case 0684: card_name="Swirlix"; card_stage=1;  card_evo[0]=685; card_type_a=8; card_type_b=-1; card_base_hp=62; card_base_atk=48+59; card_base_def=66+57; card_grid_x=8; card_grid_y=29; break;
	case 0685: card_name="Slurpuff"; card_stage=2;  card_type_a=8; card_type_b=-1; card_base_hp=82; card_base_atk=80+85; card_base_def=86+75; card_grid_x=9; card_grid_y=29; break;
	case 0686: card_name="Inkay"; card_stage=1;  card_evo[0]=687; card_type_a=17; card_type_b=7; card_base_hp=53; card_base_atk=54+37; card_base_def=53+46; card_grid_x=10; card_grid_y=29; break;
	case 0687: card_name="Malamar"; card_stage=2;  card_type_a=17; card_type_b=7; card_base_hp=86; card_base_atk=92+68; card_base_def=88+75; card_grid_x=11; card_grid_y=29; break;
	case 0688: card_name="Binacle"; card_stage=1;  card_evo[0]=689; card_type_a=10; card_type_b=3; card_base_hp=42; card_base_atk=52+39; card_base_def=67+56; card_grid_x=12; card_grid_y=29; break;
	case 0689: card_name="Barbaracle"; card_stage=2;  card_type_a=10; card_type_b=3; card_base_hp=72; card_base_atk=105+54; card_base_def=115+86; card_grid_x=13; card_grid_y=29; break;
	case 0690: card_name="Skrelp"; card_stage=1;  card_evo[0]=691; card_type_a=12; card_type_b=3; card_base_hp=50; card_base_atk=60+60; card_base_def=60+60; card_grid_x=15; card_grid_y=29; break;
	case 0691: card_name="Dragalge"; card_stage=2;  card_type_a=12; card_type_b=14; card_base_hp=65; card_base_atk=75+97; card_base_def=90+123; card_grid_x=1; card_grid_y=30; break;
	case 0692: card_name="Clauncher"; card_stage=1;  card_evo[0]=693; card_type_a=3; card_type_b=-1; card_base_hp=50; card_base_atk=53+58; card_base_def=62+63; card_grid_x=2; card_grid_y=30; break;
	case 0693: card_name="Clawitzer"; card_stage=2;  card_type_a=3; card_type_b=-1; card_base_hp=71; card_base_atk=73+120; card_base_def=88+89; card_grid_x=4; card_grid_y=30; break;
	case 0694: card_name="Helioptile"; card_stage=1;  card_evo[0]=695; card_type_a=4; card_type_b=0; card_base_hp=44; card_base_atk=38+61; card_base_def=33+43; card_grid_x=6; card_grid_y=30; break;
	case 0695: card_name="Heliolisk"; card_stage=2;  card_type_a=4; card_type_b=0; card_base_hp=62; card_base_atk=55+109; card_base_def=52+94; card_grid_x=7; card_grid_y=30; break;
	case 0696: card_name="Tyrunt"; card_fossil=true; card_stage=1;  card_evo[0]=697; card_type_a=10; card_type_b=14; card_base_hp=58; card_base_atk=89+45; card_base_def=77+45; card_grid_x=8; card_grid_y=30; break;
	case 0697: card_name="Tyrantrum"; card_fossil=true; card_stage=2;  card_type_a=10; card_type_b=14; card_base_hp=82; card_base_atk=121+69; card_base_def=119+59; card_grid_x=9; card_grid_y=30; break;
	case 0698: card_name="Amaura"; card_fossil=true; card_stage=1;  card_evo[0]=699; card_type_a=10; card_type_b=13; card_base_hp=77; card_base_atk=59+67; card_base_def=50+63; card_grid_x=10; card_grid_y=30; break;
	case 0699: card_name="Aurorus"; card_fossil=true; card_stage=2;  card_type_a=10; card_type_b=13; card_base_hp=123; card_base_atk=77+99; card_base_def=72+92; card_grid_x=11; card_grid_y=30; break;
	case 0700: card_name="Sylveon"; card_stage=2;  card_type_a=8; card_type_b=-1; card_base_hp=95; card_base_atk=65+110; card_base_def=65+130; card_grid_x=12; card_grid_y=30; break;
	case 0701: card_name="Hawlucha"; card_stage=1;  card_type_a=6; card_type_b=5; card_base_hp=78; card_base_atk=92+74; card_base_def=75+63; card_grid_x=14; card_grid_y=30; break;
	case 0702: card_name="Dedenne"; card_stage=1;  card_type_a=4; card_type_b=8; card_base_hp=67; card_base_atk=58+81; card_base_def=57+67; card_grid_x=15; card_grid_y=30; break;
	case 0703: card_name="Carbink"; card_stage=1;  card_type_a=10; card_type_b=8; card_base_hp=50; card_base_atk=50+50; card_base_def=150+150; card_grid_x=1; card_grid_y=31; break;
	case 0704: card_name="Goomy"; card_pseudo=true; card_stage=1;  card_evo[0]=705; card_type_a=14; card_type_b=-1; card_base_hp=45; card_base_atk=50+55; card_base_def=35+75; card_grid_x=2; card_grid_y=31; break;
	case 0705: 
		card_name="Sliggoo"; 
		card_stage=2;  card_evo[0]=706;  card_pseudo=true;
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=14; card_type_b=-1; 
			card_base_hp=68; 
			card_base_atk=75+83; 
			card_base_def=53+113; 
			card_grid_x=3; card_grid_y=31; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=14; card_type_b=15; 
			card_base_hp=58; 
			card_base_atk=75+83; 
			card_base_def=83+113; 
			card_grid_x=2; card_grid_y=12; }
		break;
	case 0706: 
		card_name="Goodra"; 
		card_stage=3;  card_pseudo=true;
		card_has_forms=true;	
		if card_form_value<500 { 
			card_type_a=14; card_type_b=-1; 
			card_base_hp=90; 
			card_base_atk=100+110; 
			card_base_def=70+150; 
			card_grid_x=4; card_grid_y=31; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=14; card_type_b=15; 
			card_base_hp=80; 
			card_base_atk=100+110; 
			card_base_def=100+150; 
			card_grid_x=3; card_grid_y=12; }
		break;
	case 0707: card_name="Klefki"; card_stage=1;  card_type_a=15; card_type_b=8; card_base_hp=57; card_base_atk=80+80; card_base_def=91+87; card_grid_x=5; card_grid_y=31; break;
	case 0708: card_name="Phantump"; card_stage=1;  card_evo[0]=709; card_type_a=16; card_type_b=1; card_base_hp=43; card_base_atk=70+50; card_base_def=48+60; card_grid_x=7; card_grid_y=31; break;
	case 0709: card_name="Trevenant"; card_stage=2;  card_type_a=16; card_type_b=1; card_base_hp=85; card_base_atk=110+65; card_base_def=76+82; card_grid_x=8; card_grid_y=31; break;
	case 0710: card_name="Pumpkaboo"; card_stage=1;  card_evo[0]=711; card_type_a=16; card_type_b=1; card_base_hp=49; card_base_atk=66+44; card_base_def=70+55; card_grid_x=9; card_grid_y=31; break;
	/*
	case 0710: card_name="Pumpkaboo"; card_stage=1;  card_evo[1]=711; card_type_a=16; card_type_b=1; card_base_hp=44; card_base_atk=66+44; card_base_def=70+55; card_grid_x=9; card_grid_y=31; break;
	case 0710: card_name="Pumpkaboo"; card_stage=1;  card_evo[1]=711; card_type_a=16; card_type_b=1; card_base_hp=54; card_base_atk=66+44; card_base_def=70+55; card_grid_x=9; card_grid_y=31; break;
	case 0710: card_name="Pumpkaboo"; card_stage=1;  card_evo[1]=711; card_type_a=16; card_type_b=1; card_base_hp=59; card_base_atk=66+44; card_base_def=70+55; card_grid_x=9; card_grid_y=31; break;
	*/
	case 0711: card_name="Gourgeist"; card_stage=2;  card_type_a=16; card_type_b=1; card_base_hp=65; card_base_atk=90+58; card_base_def=122+75; card_grid_x=10; card_grid_y=31; break;
	/*
	case 0711: card_name="Gourgeist"; card_stage=2;  card_type_a=16; card_type_b=1; card_base_hp=55; card_base_atk=85+58; card_base_def=122+75; card_grid_x=10; card_grid_y=31; break;
	case 0711: card_name="Gourgeist"; card_stage=2;  card_type_a=16; card_type_b=1; card_base_hp=75; card_base_atk=95+58; card_base_def=122+75; card_grid_x=10; card_grid_y=31; break;
	case 0711: card_name="Gourgeist"; card_stage=2;  card_type_a=16; card_type_b=1; card_base_hp=85; card_base_atk=100+58; card_base_def=122+75; card_grid_x=10; card_grid_y=31; break;
	*/
	case 0712: card_name="Bergmite"; card_stage=1;  card_evo[0]=713; card_type_a=13; card_type_b=-1; card_base_hp=55; card_base_atk=69+32; card_base_def=85+35; card_grid_x=11; card_grid_y=31; break;
	case 0713: card_name="Avalugg"; card_stage=2;  card_type_a=13; card_type_b=-1; card_base_hp=95; card_base_atk=117+44; card_base_def=184+46; card_grid_x=12; card_grid_y=31; break;
	case 0714: card_name="Noibat"; card_stage=1;  card_evo[0]=715; card_type_a=5; card_type_b=14; card_base_hp=40; card_base_atk=30+45; card_base_def=35+40; card_grid_x=13; card_grid_y=31; break;
	case 0715: card_name="Noivern"; card_stage=2;  card_type_a=5; card_type_b=14; card_base_hp=85; card_base_atk=70+97; card_base_def=80+80; card_grid_x=14; card_grid_y=31; break;
	case 0716: card_name="Xerneas"; card_stage=1;  card_enigma=true; card_type_a=8; card_type_b=-1; card_base_hp=126; card_base_atk=131+131; card_base_def=95+98; card_grid_x=15; card_grid_y=31; break;
	//case 0716: card_name="Xerneas"; card_stage=1;  card_enigma=true; card_type_a=8; card_type_b=-1; card_base_hp=126; card_base_atk=131+131; card_base_def=95+98; card_grid_x=1; card_grid_y=32; break;
	case 0717: card_name="Yveltal"; card_stage=1;  card_enigma=true; card_type_a=17; card_type_b=5; card_base_hp=126; card_base_atk=131+131; card_base_def=95+98; card_grid_x=2; card_grid_y=32; break;
	case 0718: card_form_change=true; card_has_forms=true; card_name="Zygarde"; card_stage=1;  card_enigma=true; card_type_a=14; card_type_b=9; 
		if card_form_value<333 {
		card_base_hp=54; card_base_atk=100+61; card_base_def=71+85; card_grid_x=5; card_grid_y=32; }
		else if card_form_value<666 {
		card_base_hp=108; card_base_atk=100+81; card_base_def=121+95; card_grid_x=3; card_grid_y=32; }
		else {
		card_base_hp=216; card_base_atk=100+91; card_base_def=121+95; card_grid_x=7; card_grid_y=32; }
		break;
	case 0719:
		card_can_mega=true;
		if card_form_value<=999 { 
		card_name="Diancie"; 
		card_stage=1;  card_enigma=true; 
		card_type_a=10; card_type_b=8; 
		card_base_hp=50; card_base_atk=100+100; card_base_def=150+150; 
		card_grid_x=9; card_grid_y=32;}
		else { 
		card_name="M-Diancie"; 
		card_stage=1;  card_enigma=true; 
		card_type_a=10; card_type_b=8; 
		card_base_hp=50; card_base_atk=160+160; card_base_def=110+110; 
		card_grid_x=10; card_grid_y=32;}
		break;
	
	case 0720: card_form_change=true; card_has_forms=true; card_stage=1;  card_enigma=true; 
		if card_form_value<500 {
		card_name="Hoopa"; 
		card_type_a=7; card_type_b=16; card_base_hp=80; card_base_atk=110+150; card_base_def=60+130; card_grid_x=11; card_grid_y=32; }
		else{
		card_name="U-Hoopa"; 
		card_type_a=7; card_type_b=17; card_base_hp=80; card_base_atk=160+170; card_base_def=60+130; card_grid_x=12; card_grid_y=32; }
		break;
	
	
	case 0721: card_name="Volcanion"; card_stage=1;  card_enigma=true; card_type_a=2; card_type_b=3; card_base_hp=80; card_base_atk=110+130; card_base_def=120+90; card_grid_x=13; card_grid_y=32; break;
		
	// Gen 7
	case 0722: card_name="Rowlet"; card_stage=1; card_evo[0]=723; card_type_a=1; card_type_b=5; card_base_hp=68; card_base_atk=55+50; card_base_def=55+50; card_grid_x=1; card_grid_y=33; break;
	case 0723: card_name="Dartrix"; card_stage=2; card_evo[0]=724; card_type_a=1; card_type_b=5; card_base_hp=78; card_base_atk=75+70; card_base_def=75+70; card_grid_x=2; card_grid_y=33; break;
	case 0724: 
		card_name="Decidueye"; 
		card_stage=3;  
		card_has_forms=true;	
		if card_form_value<500 {
			card_type_a=1; card_type_b=16; 
			card_base_hp=78; 
			card_base_atk=107+100; 
			card_base_def=75+100; 
			card_grid_x=4; card_grid_y=33; }
		else {
			card_sheet=sp_poke_d;
			card_type_a=1; card_type_b=6; 
			card_base_hp=88; 
			card_base_atk=112+95; 
			card_base_def=80+95; 
			card_grid_x=5; card_grid_y=12; }
		break;
	case 0725: card_name="Litten"; card_stage=1; card_evo[0]=726; card_type_a=2; card_type_b=-1; card_base_hp=45; card_base_atk=65+60; card_base_def=40+40; card_grid_x=5; card_grid_y=33; break;
	case 0726: card_name="Torracat"; card_stage=2; card_evo[0]=727; card_type_a=2; card_type_b=-1; card_base_hp=65; card_base_atk=85+80; card_base_def=50+50; card_grid_x=6; card_grid_y=33; break;
	case 0727: card_name="Incineroar"; card_stage=3;  card_type_a=2; card_type_b=17; card_base_hp=95; card_base_atk=115+80; card_base_def=90+90; card_grid_x=7; card_grid_y=33; break;
	case 0728: card_name="Popplio"; card_stage=1; card_evo[0]=729; card_type_a=3; card_type_b=-1; card_base_hp=50; card_base_atk=54+66; card_base_def=54+56; card_grid_x=8; card_grid_y=33; break;
	case 0729: card_name="Brionne"; card_stage=2; card_evo[0]=730; card_type_a=3; card_type_b=-1; card_base_hp=60; card_base_atk=69+91; card_base_def=69+81; card_grid_x=9; card_grid_y=33; break;
	case 0730: card_name="Primarina"; card_stage=3;  card_type_a=3; card_type_b=8; card_base_hp=80; card_base_atk=74+126; card_base_def=74+116; card_grid_x=10; card_grid_y=33; break;
	case 0731: card_name="Pikipek"; card_stage=1; card_evo[0]=732; card_type_a=0; card_type_b=5; card_base_hp=35; card_base_atk=75+30; card_base_def=30+30; card_grid_x=11; card_grid_y=33; break;
	case 0732: card_name="Trumbeak"; card_stage=2; card_evo[0]=733; card_type_a=0; card_type_b=5; card_base_hp=55; card_base_atk=85+40; card_base_def=50+50; card_grid_x=12; card_grid_y=33; break;
	case 0733: card_name="Toucannon"; card_stage=3;  card_type_a=0; card_type_b=5; card_base_hp=80; card_base_atk=120+75; card_base_def=75+75; card_grid_x=13; card_grid_y=33; break;
	case 0734: card_name="Yungoos"; card_stage=1; card_evo[0]=735; card_type_a=0; card_type_b=-1; card_base_hp=48; card_base_atk=70+30; card_base_def=30+30; card_grid_x=14; card_grid_y=33; break;
	case 0735: card_name="Gumshoos"; card_stage=2;  card_type_a=0; card_type_b=-1; card_base_hp=88; card_base_atk=110+55; card_base_def=60+60; card_grid_x=15; card_grid_y=33; break;
	case 0736: card_name="Grubbin"; card_stage=1; card_evo[0]=737; card_type_a=11; card_type_b=-1; card_base_hp=47; card_base_atk=62+55; card_base_def=45+45; card_grid_x=1; card_grid_y=34; break;
	case 0737: card_name="Charjabug"; card_stage=2; card_evo[0]=738; card_type_a=11; card_type_b=4; card_base_hp=57; card_base_atk=82+55; card_base_def=95+75; card_grid_x=2; card_grid_y=34; break;
	case 0738: card_name="Vikavolt"; card_stage=3;  card_type_a=11; card_type_b=4; card_base_hp=77; card_base_atk=70+145; card_base_def=90+75; card_grid_x=3; card_grid_y=34; break;
	case 0739: card_name="Crabrawler"; card_stage=1; card_evo[0]=740; card_type_a=6; card_type_b=-1; card_base_hp=47; card_base_atk=82+42; card_base_def=57+47; card_grid_x=4; card_grid_y=34; break;
	case 0740: card_name="Crabominable"; card_stage=2;  card_type_a=6; card_type_b=13; card_base_hp=97; card_base_atk=132+62; card_base_def=77+67; card_grid_x=5; card_grid_y=34; break;
	case 0741: card_form_change=true; card_has_forms=true; card_name="Oricorio"; card_stage=1;  
	if card_form_value<250 {
	card_type_a=2; card_type_b=5; card_base_hp=75; card_base_atk=70+98; card_base_def=70+70; card_grid_x=6; card_grid_y=34; }
	else if card_form_value<500 {
	card_type_a=4; card_type_b=5; card_base_hp=75; card_base_atk=70+98; card_base_def=70+70; card_grid_x=7; card_grid_y=34; }
	else if card_form_value<750 {
	card_type_a=2; card_type_b=5; card_base_hp=75; card_base_atk=70+98; card_base_def=70+70; card_grid_x=8; card_grid_y=34; }
	else{
	card_type_a=16; card_type_b=5; card_base_hp=75; card_base_atk=70+98; card_base_def=70+70; card_grid_x=9; card_grid_y=34; }
	break;
	
	case 0742: card_name="Cutiefly"; card_stage=1; card_evo[0]=743; card_type_a=11; card_type_b=8; card_base_hp=40; card_base_atk=45+55; card_base_def=40+40; card_grid_x=10; card_grid_y=34; break;
	case 0743: card_name="Ribombee"; card_stage=2;  card_type_a=11; card_type_b=8; card_base_hp=60; card_base_atk=55+95; card_base_def=60+70; card_grid_x=11; card_grid_y=34; break;
	case 0744: card_name="Rockruff"; card_stage=1; card_evo[0]=745; card_type_a=10; card_type_b=-1; card_base_hp=45; card_base_atk=65+30; card_base_def=40+40; card_grid_x=12; card_grid_y=34; break;
	case 0745: card_form_change=true; card_has_forms=true; card_name="Lycanroc"; card_stage=2;  card_type_a=10; card_type_b=-1; 
	if card_form_value<333 {
	card_base_hp=75; card_base_atk=115+55; card_base_def=65+65; card_grid_x=13; card_grid_y=34; }
	else if card_form_value<666 {
	card_base_hp=85; card_base_atk=115+55; card_base_def=75+75; card_grid_x=14; card_grid_y=34; }
	else {
	card_base_hp=75; card_base_atk=117+55; card_base_def=65+65; card_grid_x=15; card_grid_y=34; }
	break;
	
	case 0746: card_form_change=true; card_has_forms=true; card_name="Wishiwashi"; card_stage=1;  card_type_a=3; card_type_b=-1;
		if card_form_value<500 {  card_stage=1;
		card_base_hp=45; card_base_atk=20+25; card_base_def=20+25; card_grid_x=1; card_grid_y=35;}
		else{  card_stage=2;
		card_base_hp=45; card_base_atk=140+140; card_base_def=130+135; card_grid_x=2; card_grid_y=35;}
		break;
	
	case 0747: card_name="Mareanie"; card_stage=1; card_evo[0]=748; card_type_a=12; card_type_b=3; card_base_hp=50; card_base_atk=53+43; card_base_def=62+52; card_grid_x=3; card_grid_y=35; break;
	case 0748: card_name="Toxapex"; card_stage=2;  card_type_a=12; card_type_b=3; card_base_hp=50; card_base_atk=63+53; card_base_def=152+142; card_grid_x=4; card_grid_y=35; break;
	case 0749: card_name="Mudbray"; card_stage=1; card_evo[0]=750; card_type_a=9; card_type_b=-1; card_base_hp=70; card_base_atk=100+45; card_base_def=70+55; card_grid_x=5; card_grid_y=35; break;
	case 0750: card_name="Mudsdale"; card_stage=2;  card_type_a=9; card_type_b=-1; card_base_hp=100; card_base_atk=125+55; card_base_def=100+85; card_grid_x=6; card_grid_y=35; break;
	case 0751: card_name="Dewpider"; card_stage=1; card_evo[0]=752; card_type_a=3; card_type_b=11; card_base_hp=38; card_base_atk=40+40; card_base_def=52+72; card_grid_x=7; card_grid_y=35; break;
	case 0752: card_name="Araquanid"; card_stage=2;  card_type_a=3; card_type_b=11; card_base_hp=68; card_base_atk=70+50; card_base_def=92+132; card_grid_x=8; card_grid_y=35; break;
	case 0753: card_name="Fomantis"; card_stage=1; card_evo[0]=754; card_type_a=1; card_type_b=-1; card_base_hp=40; card_base_atk=55+50; card_base_def=35+35; card_grid_x=9; card_grid_y=35; break;
	case 0754: card_name="Lurantis"; card_stage=2;  card_type_a=1; card_type_b=-1; card_base_hp=70; card_base_atk=105+80; card_base_def=90+90; card_grid_x=10; card_grid_y=35; break;
	case 0755: card_name="Morelull"; card_stage=1; card_evo[0]=756; card_type_a=1; card_type_b=8; card_base_hp=40; card_base_atk=35+65; card_base_def=55+75; card_grid_x=11; card_grid_y=35; break;
	case 0756: card_name="Shiinotic"; card_stage=2;  card_type_a=1; card_type_b=8; card_base_hp=60; card_base_atk=45+90; card_base_def=80+100; card_grid_x=12; card_grid_y=35; break;
	case 0757: card_name="Salandit"; card_stage=1; card_evo[0]=758; card_type_a=12; card_type_b=2; card_base_hp=48; card_base_atk=44+71; card_base_def=40+40; card_grid_x=13; card_grid_y=35; break;
	case 0758: card_name="Salazzle"; card_stage=2;  card_type_a=12; card_type_b=2; card_base_hp=68; card_base_atk=64+111; card_base_def=60+60; card_grid_x=14; card_grid_y=35; break;
	case 0759: card_name="Stufful"; card_stage=1; card_evo[0]=760; card_type_a=0; card_type_b=6; card_base_hp=70; card_base_atk=75+45; card_base_def=50+50; card_grid_x=15; card_grid_y=35; break;
	case 0760: card_name="Bewear"; card_stage=2;  card_type_a=0; card_type_b=6; card_base_hp=120; card_base_atk=125+55; card_base_def=80+60; card_grid_x=1; card_grid_y=36; break;
	case 0761: card_name="Bounsweet"; card_stage=1; card_evo[0]=762; card_type_a=1; card_type_b=-1; card_base_hp=42; card_base_atk=30+30; card_base_def=38+38; card_grid_x=2; card_grid_y=36; break;
	case 0762: card_name="Steenee"; card_stage=2; card_evo[0]=763; card_type_a=1; card_type_b=-1; card_base_hp=52; card_base_atk=40+40; card_base_def=48+48; card_grid_x=3; card_grid_y=36; break;
	case 0763: card_name="Tsareena"; card_stage=3;  card_type_a=1; card_type_b=-1; card_base_hp=72; card_base_atk=120+50; card_base_def=98+98; card_grid_x=5; card_grid_y=36; break;
	case 0764: card_name="Comfey"; card_stage=1;  card_type_a=8; card_type_b=-1; card_base_hp=51; card_base_atk=52+82; card_base_def=90+110; card_grid_x=7; card_grid_y=36; break;
	case 0765: card_name="Oranguru"; card_stage=1;  card_type_a=0; card_type_b=7; card_base_hp=90; card_base_atk=60+90; card_base_def=80+110; card_grid_x=9; card_grid_y=36; break;
	case 0766: card_name="Passimian"; card_stage=1;  card_type_a=6; card_type_b=-1; card_base_hp=100; card_base_atk=120+40; card_base_def=90+60; card_grid_x=10; card_grid_y=36; break;
	case 0767: card_name="Wimpod";card_evo[0]=768; card_stage=1;  card_type_a=11; card_type_b=3; card_base_hp=25; card_base_atk=35+20; card_base_def=40+30; card_grid_x=11; card_grid_y=36; break;
	case 0768: card_name="Golisopod"; card_stage=2;  card_type_a=11; card_type_b=3; card_base_hp=75; card_base_atk=125+60; card_base_def=140+90; card_grid_x=12; card_grid_y=36; break;
	case 0769: card_name="Sandygast"; card_stage=1; card_evo[0]=770; card_type_a=16; card_type_b=9; card_base_hp=55; card_base_atk=55+70; card_base_def=80+45; card_grid_x=13; card_grid_y=36; break;
	case 0770: card_name="Palossand"; card_stage=2;  card_type_a=16; card_type_b=9; card_base_hp=85; card_base_atk=75+100; card_base_def=110+75; card_grid_x=14; card_grid_y=36; break;
	case 0771: card_name="Pyukumuku"; card_stage=1;  card_type_a=3; card_type_b=-1; card_base_hp=55; card_base_atk=60+30; card_base_def=130+130; card_grid_x=15; card_grid_y=36; break;
	case 0772: card_name="Type: Null"; card_stage=1; card_evo[0]=773; card_enigma=true; card_type_a=0; card_type_b=-1; card_base_hp=95; card_base_atk=95+95; card_base_def=95+95; card_grid_x=1; card_grid_y=37; break;
	
	case 0773: 
		card_sheet=sp_poke_c;
		card_form_change=true; card_has_forms=true;
		card_name="Silvally"; 
		card_stage=2;  card_enigma=true; 
		card_base_hp=95; card_base_atk=95+95; card_base_def=95+95;
		if card_form_value<55{
		card_type_a=0; card_type_b=-1; 
		card_grid_x=1; card_grid_y=4; 
		}
		else if card_form_value<110{
		card_type_a=1; card_type_b=-1; 
		card_grid_x=12; card_grid_y=4; 
		}
		else if card_form_value<165{
		card_type_a=2; card_type_b=-1; 
		card_grid_x=10; card_grid_y=4; 
		}
		else if card_form_value<220{
		card_type_a=3; card_type_b=-1; 
		card_grid_x=11; card_grid_y=4; 
		}
		else if card_form_value<275{
		card_type_a=4; card_type_b=-1; 
		card_grid_x=13; card_grid_y=4; 
		}
		else if card_form_value<330{
		card_type_a=5; card_type_b=-1; 
		card_grid_x=3; card_grid_y=4; 
		}
		else if card_form_value<385{
		card_type_a=6; card_type_b=-1; 
		card_grid_x=2; card_grid_y=4; 
		}
		else if card_form_value<440{
		card_type_a=7; card_type_b=-1; 
		card_grid_x=14; card_grid_y=4; 
		}
		else if card_form_value<495{
		card_type_a=8; card_type_b=-1; 
		card_grid_x=3; card_grid_y=5; 
		}
		else if card_form_value<550{
		card_type_a=9; card_type_b=-1; 
		card_grid_x=5; card_grid_y=4; 
		}
		else if card_form_value<605{
		card_type_a=10; card_type_b=-1; 
		card_grid_x=6; card_grid_y=4; 
		}
		else if card_form_value<660{
		card_type_a=11; card_type_b=-1; 
		card_grid_x=7; card_grid_y=4; 
		}
		else if card_form_value<715{
		card_type_a=12; card_type_b=-1; 
		card_grid_x=4; card_grid_y=4; 
		}
		else if card_form_value<770{
		card_type_a=13; card_type_b=-1; 
		card_grid_x=15; card_grid_y=4; 
		}
		else if card_form_value<825{
		card_type_a=14; card_type_b=-1; 
		card_grid_x=1; card_grid_y=5; 
		}
		else if card_form_value<880{
		card_type_a=15; card_type_b=-1; 
		card_grid_x=9; card_grid_y=4; 
		}
		else if card_form_value<935{
		card_type_a=16; card_type_b=-1; 
		card_grid_x=8; card_grid_y=4; 
		}
		else{
		card_type_a=17; card_type_b=-1; 
		card_grid_x=2; card_grid_y=5; 
		}
		break;
	
	case 0774: card_form_change=true; card_has_forms=true; card_name="Minior"; card_stage=1;  card_type_a=10; card_type_b=5; 
		if card_form_value<300 {
		card_base_hp=60; card_base_atk=60+60; card_base_def=100+100; card_grid_x=3; card_grid_y=37; }
		else if card_form_value<400 {
		card_base_hp=60; card_base_atk=100+100; card_base_def=60+60; card_grid_x=5; card_grid_y=37; }
		else if card_form_value<500 {
		card_base_hp=60; card_base_atk=100+100; card_base_def=60+60; card_grid_x=7; card_grid_y=37; }
		else if card_form_value<600 {
		card_base_hp=60; card_base_atk=100+100; card_base_def=60+60; card_grid_x=9; card_grid_y=37; }
		else if card_form_value<700 {
		card_base_hp=60; card_base_atk=100+100; card_base_def=60+60; card_grid_x=11; card_grid_y=37; }
		else if card_form_value<800 {
		card_base_hp=60; card_base_atk=100+100; card_base_def=60+60; card_grid_x=13; card_grid_y=37; }
		else if card_form_value<900 {
		card_base_hp=60; card_base_atk=100+100; card_base_def=60+60; card_grid_x=15; card_grid_y=37; }
		else{
		card_base_hp=60; card_base_atk=100+100; card_base_def=60+60; card_grid_x=2; card_grid_y=38; }
		break;
	
	case 0775: card_name="Komala"; card_stage=1;  card_type_a=0; card_type_b=-1; card_base_hp=65; card_base_atk=115+75; card_base_def=65+95; card_grid_x=4; card_grid_y=38; break;
	case 0776: card_name="Turtonator"; card_stage=1;  card_type_a=2; card_type_b=14; card_base_hp=60; card_base_atk=78+91; card_base_def=135+85; card_grid_x=5; card_grid_y=38; break;
	case 0777: card_name="Togedemaru"; card_stage=1;  card_type_a=4; card_type_b=15; card_base_hp=65; card_base_atk=98+40; card_base_def=63+73; card_grid_x=6; card_grid_y=38; break;
	case 0778: card_name="Mimikyu"; card_stage=1;  card_type_a=16; card_type_b=8; card_base_hp=55; card_base_atk=90+50; card_base_def=80+105; card_grid_x=7; card_grid_y=38; break;
	case 0779: card_name="Bruxish"; card_stage=1;  card_type_a=3; card_type_b=7; card_base_hp=68; card_base_atk=105+70; card_base_def=70+70; card_grid_x=8; card_grid_y=38; break;
	case 0780: card_name="Drampa"; card_stage=1;  card_type_a=0; card_type_b=14; card_base_hp=78; card_base_atk=60+135; card_base_def=85+91; card_grid_x=9; card_grid_y=38; break;
	case 0781: card_name="Dhelmise"; card_stage=1;  card_type_a=16; card_type_b=1; card_base_hp=70; card_base_atk=131+86; card_base_def=100+90; card_grid_x=10; card_grid_y=38; break;
	case 0782: card_name="Jangmo-o"; card_pseudo=true; card_stage=1; card_evo[0]=783; card_type_a=14; card_type_b=-1; card_base_hp=45; card_base_atk=55+45; card_base_def=65+45; card_grid_x=12; card_grid_y=38; break;
	case 0783: card_name="Hakamo-o"; card_pseudo=true; card_stage=2; card_evo[0]=784; card_type_a=14; card_type_b=6; card_base_hp=55; card_base_atk=75+65; card_base_def=90+70; card_grid_x=13; card_grid_y=38; break;
	case 0784: card_name="Kommo-o"; card_pseudo=true; card_stage=3;  card_type_a=14; card_type_b=6; card_base_hp=75; card_base_atk=110+100; card_base_def=125+105; card_grid_x=14; card_grid_y=38; break;
	case 0785: card_name="Tapu Koko"; card_stage=1;  card_enigma=true; card_type_a=4; card_type_b=8; card_base_hp=70; card_base_atk=115+95; card_base_def=85+75; card_grid_x=15; card_grid_y=38; break;
	case 0786: card_name="Tapu Lele"; card_stage=1;  card_enigma=true; card_type_a=7; card_type_b=8; card_base_hp=70; card_base_atk=85+130; card_base_def=75+115; card_grid_x=1; card_grid_y=39; break;
	case 0787: card_name="Tapu Bulu"; card_stage=1;  card_enigma=true; card_type_a=1; card_type_b=8; card_base_hp=70; card_base_atk=130+85; card_base_def=115+95; card_grid_x=2; card_grid_y=39; break;
	case 0788: card_name="Tapu Fini"; card_stage=1;  card_enigma=true; card_type_a=3; card_type_b=8; card_base_hp=70; card_base_atk=75+95; card_base_def=115+130; card_grid_x=3; card_grid_y=39; break;
	case 0789: card_name="Cosmog"; card_stage=1; card_evo[0]=790;  card_enigma=true; card_type_a=7; card_type_b=-1; card_base_hp=43; card_base_atk=29+29; card_base_def=31+31; card_grid_x=4; card_grid_y=39; break;
	case 0790: card_name="Cosmoem"; card_stage=2; card_evo[0]=791; card_evo[1]=792; card_enigma=true; card_type_a=7; card_type_b=-1; card_base_hp=43; card_base_atk=29+29; card_base_def=131+131; card_grid_x=5; card_grid_y=39; break;
	case 0791: card_name="Solgaleo"; card_stage=3;  card_enigma=true; card_type_a=7; card_type_b=15; card_base_hp=137; card_base_atk=137+113; card_base_def=107+89; card_grid_x=6; card_grid_y=39; break;
	case 0792: card_name="Lunala"; card_stage=3;  card_enigma=true; card_type_a=7; card_type_b=16; card_base_hp=137; card_base_atk=113+137; card_base_def=89+107; card_grid_x=7; card_grid_y=39; break;
	case 0793: card_name="Nihilego"; card_stage=1;  card_enigma=true; card_type_a=10; card_type_b=12; card_base_hp=109; card_base_atk=53+127; card_base_def=47+131; card_grid_x=8; card_grid_y=39; break;
	case 0794: card_name="Buzzwole"; card_stage=1;  card_enigma=true; card_type_a=11; card_type_b=6; card_base_hp=107; card_base_atk=139+53; card_base_def=139+53; card_grid_x=9; card_grid_y=39; break;
	case 0795: card_name="Pheromosa"; card_stage=1;  card_enigma=true; card_type_a=11; card_type_b=6; card_base_hp=71; card_base_atk=137+137; card_base_def=37+37; card_grid_x=10; card_grid_y=39; break;
	case 0796: card_name="Xurkitree"; card_stage=1;  card_enigma=true; card_type_a=4; card_type_b=-1; card_base_hp=83; card_base_atk=89+173; card_base_def=71+71; card_grid_x=11; card_grid_y=39; break;
	case 0797: card_name="Celesteela"; card_stage=1;  card_enigma=true; card_type_a=15; card_type_b=5; card_base_hp=97; card_base_atk=101+107; card_base_def=103+101; card_grid_x=12; card_grid_y=39; break;
	case 0798: card_name="Kartana"; card_stage=1;  card_enigma=true; card_type_a=1; card_type_b=15; card_base_hp=59; card_base_atk=181+59; card_base_def=131+31; card_grid_x=13; card_grid_y=39; break;
	case 0799: card_name="Guzzlord"; card_stage=1;  card_enigma=true; card_type_a=17; card_type_b=14; card_base_hp=223; card_base_atk=101+97; card_base_def=53+53; card_grid_x=14; card_grid_y=39; break;
	case 0800: card_form_change=true; card_has_forms=true; card_stage=1;  card_enigma=true; 
		if card_form_value<250 {
		card_name="Necrozma"; card_type_a=7; card_type_b=-1; card_base_hp=97; card_base_atk=107+127; card_base_def=101+89; card_grid_x=15; card_grid_y=39; }
		else if card_form_value<500 {
		card_name="Necrozma-M"; card_type_a=7; card_type_b=15; card_base_hp=97; card_base_atk=157+113; card_base_def=127+109; card_grid_x=2; card_grid_y=40; }
		else if card_form_value<750 {
		card_name="Necrozma-W"; card_type_a=7; card_type_b=16; card_base_hp=97; card_base_atk=113+157; card_base_def=109+127; card_grid_x=4; card_grid_y=40; }
		else{
		card_name="Necrozma-U"; card_type_a=7; card_type_b=14; card_base_hp=97; card_base_atk=167+167; card_base_def=97+97; card_grid_x=6; card_grid_y=40; }
		
		break;
	
	
	case 0801: card_has_forms=true;  card_name="Magearna"; card_stage=1;  card_enigma=true; card_type_a=15; card_type_b=8; card_base_hp=80; card_base_atk=95+130; card_base_def=115+115; 
	if card_form_value<500 {
	card_grid_x=8; card_grid_y=40; }
	else {
	card_grid_x=9; card_grid_y=40; }
	break;
	
	case 0802: card_name="Marshadow"; card_stage=1;  card_enigma=true; card_type_a=6; card_type_b=16; card_base_hp=90; card_base_atk=125+90; card_base_def=80+90; card_grid_x=10; card_grid_y=40; break;
	case 0803: card_name="Poipole"; card_stage=1; card_evo[0]=804; card_enigma=true; card_type_a=12; card_type_b=-1; card_base_hp=67; card_base_atk=73+73; card_base_def=67+67; card_grid_x=12; card_grid_y=40; break;
	case 0804: card_name="Naganadel"; card_stage=2;  card_enigma=true; card_type_a=12; card_type_b=14; card_base_hp=73; card_base_atk=73+127; card_base_def=73+73; card_grid_x=13; card_grid_y=40; break;
	case 0805: card_name="Stakataka"; card_stage=1;  card_enigma=true; card_type_a=10; card_type_b=15; card_base_hp=61; card_base_atk=131+53; card_base_def=211+101; card_grid_x=14; card_grid_y=40; break;
	case 0806: card_name="Blacephalon"; card_stage=1;  card_enigma=true; card_type_a=2; card_type_b=16; card_base_hp=53; card_base_atk=127+151; card_base_def=53+79; card_grid_x=1; card_grid_y=41; break;
	case 0807: card_name="Zeraora"; card_stage=1;  card_enigma=true; card_type_a=4; card_type_b=-1; card_base_hp=88; card_base_atk=112+102; card_base_def=75+80; card_grid_x=3; card_grid_y=41; break;
	
	// Gen 8
	
	case 0808: card_name="Meltan"; card_enigma=true;  card_stage=1; card_evo[0]=809; card_type_a=15; card_type_b=-1; card_base_hp=46; card_base_atk=65+55; card_base_def=65+35; card_grid_x=1; card_grid_y=1; break;
	case 0809: card_name="Melmetal"; card_enigma=true;  card_stage=2;  card_type_a=15; card_type_b=-1; card_base_hp=135; card_base_atk=143+80; card_base_def=143+65; card_grid_x=2; card_grid_y=1; break;
	
	case 0810: card_name="Grookey"; card_stage=1; card_evo[0]=811; card_starter=true; card_type_a=1; card_type_b=-1; card_base_hp=50; card_base_atk=65+40; card_base_def=50+40; card_grid_x=3; card_grid_y=1; break;
	case 0811: card_name="Thwackey"; card_stage=2; card_evo[0]=812; card_starter=true; card_type_a=1; card_type_b=-1; card_base_hp=70; card_base_atk=85+55; card_base_def=70+60; card_grid_x=4; card_grid_y=1; break;
	case 0812: card_name="Rillaboom"; card_stage=3;  card_starter=true; card_type_a=1; card_type_b=-1; card_base_hp=100; card_base_atk=125+60; card_base_def=90+70; card_grid_x=5; card_grid_y=1; break;
	case 0813: card_name="Scorbunny"; card_stage=1; card_evo[0]=814; card_starter=true; card_type_a=2; card_type_b=-1; card_base_hp=50; card_base_atk=71+40; card_base_def=40+40; card_grid_x=6; card_grid_y=1; break;
	case 0814: card_name="Raboot"; card_stage=2; card_evo[0]=815; card_starter=true; card_type_a=2; card_type_b=-1; card_base_hp=65; card_base_atk=86+55; card_base_def=60+60; card_grid_x=7; card_grid_y=1; break;
	case 0815: card_name="Cinderace"; card_stage=3;  card_starter=true; card_type_a=2; card_type_b=-1; card_base_hp=80; card_base_atk=116+65; card_base_def=75+75; card_grid_x=8; card_grid_y=1; break;
	case 0816: card_name="Sobble"; card_stage=1; card_evo[0]=817; card_starter=true; card_type_a=3; card_type_b=-1; card_base_hp=50; card_base_atk=40+70; card_base_def=40+40; card_grid_x=9; card_grid_y=1; break;
	case 0817: card_name="Drizzile"; card_stage=2; card_evo[0]=818; card_starter=true; card_type_a=3; card_type_b=-1; card_base_hp=65; card_base_atk=60+95; card_base_def=55+55; card_grid_x=10; card_grid_y=1; break;
	case 0818: card_name="Inteleon"; card_stage=3;  card_starter=true; card_type_a=3; card_type_b=-1; card_base_hp=70; card_base_atk=85+125; card_base_def=65+65; card_grid_x=11; card_grid_y=1; break;
	case 0819: card_name="Skwovet"; card_stage=1; card_evo[0]=820; card_type_a=0; card_type_b=-1; card_base_hp=70; card_base_atk=55+35; card_base_def=55+35; card_grid_x=12; card_grid_y=1; break;
	case 0820: card_name="Greedent"; card_stage=2;  card_type_a=0; card_type_b=-1; card_base_hp=120; card_base_atk=95+55; card_base_def=95+75; card_grid_x=13; card_grid_y=1; break;
	case 0821: card_name="Rookidee"; card_stage=1; card_evo[0]=822; card_type_a=5; card_type_b=-1; card_base_hp=38; card_base_atk=47+33; card_base_def=35+35; card_grid_x=14; card_grid_y=1; break;
	case 0822: card_name="Corvisquire"; card_stage=2; card_evo[0]=823; card_type_a=5; card_type_b=-1; card_base_hp=68; card_base_atk=67+43; card_base_def=55+55; card_grid_x=15; card_grid_y=1; break;
	case 0823: card_name="Corviknight"; card_stage=3;  card_type_a=5; card_type_b=15; card_base_hp=98; card_base_atk=87+53; card_base_def=105+85; card_grid_x=1; card_grid_y=2; break;
	case 0824: card_name="Blipbug"; card_stage=1; card_evo[0]=825; card_type_a=11; card_type_b=-1; card_base_hp=25; card_base_atk=20+25; card_base_def=20+45; card_grid_x=2; card_grid_y=2; break;
	case 0825: card_name="Dottler"; card_stage=2; card_evo[0]=826; card_type_a=11; card_type_b=7; card_base_hp=50; card_base_atk=35+50; card_base_def=80+90; card_grid_x=3; card_grid_y=2; break;
	case 0826: card_name="Orbeetle"; card_stage=3;  card_type_a=11; card_type_b=7; card_base_hp=60; card_base_atk=45+80; card_base_def=110+120; card_grid_x=4; card_grid_y=2; break;
	case 0827: card_name="Nickit"; card_stage=1; card_evo[0]=828; card_type_a=17; card_type_b=-1; card_base_hp=40; card_base_atk=28+47; card_base_def=28+52; card_grid_x=5; card_grid_y=2; break;
	case 0828: card_name="Thievul"; card_stage=2;  card_type_a=17; card_type_b=-1; card_base_hp=70; card_base_atk=58+87; card_base_def=58+92; card_grid_x=6; card_grid_y=2; break;
	case 0829: card_name="Gossifleur"; card_stage=1; card_evo[0]=830; card_type_a=1; card_type_b=-1; card_base_hp=40; card_base_atk=40+40; card_base_def=60+60; card_grid_x=7; card_grid_y=2; break;
	case 0830: card_name="Eldegoss"; card_stage=2;  card_type_a=1; card_type_b=-1; card_base_hp=60; card_base_atk=50+80; card_base_def=90+120; card_grid_x=8; card_grid_y=2; break;
	case 0831: card_name="Wooloo"; card_stage=1; card_evo[0]=832; card_type_a=0; card_type_b=-1; card_base_hp=42; card_base_atk=40+40; card_base_def=55+45; card_grid_x=9; card_grid_y=2; break;
	case 0832: card_name="Dubwool"; card_stage=2;  card_type_a=0; card_type_b=-1; card_base_hp=72; card_base_atk=80+60; card_base_def=100+90; card_grid_x=10; card_grid_y=2; break;
	case 0833: card_name="Chewtle"; card_stage=1; card_evo[0]=834; card_type_a=3; card_type_b=-1; card_base_hp=50; card_base_atk=64+38; card_base_def=50+38; card_grid_x=11; card_grid_y=2; break;
	case 0834: card_name="Drednaw"; card_stage=2;  card_type_a=3; card_type_b=10; card_base_hp=90; card_base_atk=115+48; card_base_def=90+68; card_grid_x=12; card_grid_y=2; break;
	case 0835: card_name="Yamper"; card_stage=1; card_evo[0]=836; card_type_a=4; card_type_b=-1; card_base_hp=59; card_base_atk=45+40; card_base_def=50+50; card_grid_x=13; card_grid_y=2; break;
	case 0836: card_name="Boltund"; card_stage=2;  card_type_a=4; card_type_b=-1; card_base_hp=69; card_base_atk=90+90; card_base_def=60+60; card_grid_x=14; card_grid_y=2; break;
	case 0837: card_name="Rolycoly"; card_stage=1; card_evo[0]=838; card_type_a=10; card_type_b=-1; card_base_hp=30; card_base_atk=40+40; card_base_def=50+50; card_grid_x=15; card_grid_y=2; break;
	case 0838: card_name="Carkol"; card_stage=2; card_evo[0]=839; card_type_a=10; card_type_b=2; card_base_hp=80; card_base_atk=60+60; card_base_def=90+70; card_grid_x=1; card_grid_y=3; break;
	case 0839: card_name="Coalossal"; card_stage=3;  card_type_a=10; card_type_b=2; card_base_hp=110; card_base_atk=80+80; card_base_def=120+90; card_grid_x=2; card_grid_y=3; break;
	case 0840: card_name="Applin"; card_stage=1; card_evo[0]=841; card_evo[1]=842; card_type_a=1; card_type_b=14; card_base_hp=40; card_base_atk=40+40; card_base_def=80+40; card_grid_x=3; card_grid_y=3; break;
	case 0841: card_name="Flapple"; card_stage=2;  card_type_a=1; card_type_b=14; card_base_hp=70; card_base_atk=110+95; card_base_def=80+60; card_grid_x=4; card_grid_y=3; break;
	case 0842: card_name="Appletun"; card_stage=2;  card_type_a=1; card_type_b=14; card_base_hp=110; card_base_atk=85+100; card_base_def=80+80; card_grid_x=5; card_grid_y=3; break;
	case 0843: card_name="Silicobra"; card_stage=1; card_evo[0]=844; card_type_a=9; card_type_b=-1; card_base_hp=52; card_base_atk=57+35; card_base_def=75+50; card_grid_x=6; card_grid_y=3; break;
	case 0844: card_name="Sandaconda"; card_stage=2;  card_type_a=9; card_type_b=-1; card_base_hp=72; card_base_atk=107+65; card_base_def=125+70; card_grid_x=7; card_grid_y=3; break;
	
	case 0845: //cosmetic but not in your control in cannon
		card_has_forms=true;
		card_name="Cramorant"; 
		card_stage=1;  
		card_type_a=5; card_type_b=3; 
		card_base_hp=70; 
		card_base_atk=85+85; 
		card_base_def=55+95; 
		if card_form_value<500 {
			card_grid_x=8; card_grid_y=3; 
		}
		else if card_form_value<750 {
			card_grid_x=9; card_grid_y=3; 
		}
		else {
			card_grid_x=10; card_grid_y=3; 
		}
		break;
	
	case 0846: card_name="Arrokuda"; card_stage=1; card_evo[0]=847; card_type_a=3; card_type_b=-1; card_base_hp=41; card_base_atk=63+40; card_base_def=40+30; card_grid_x=11; card_grid_y=3; break;
	case 0847: card_name="Barraskewda"; card_stage=2;  card_type_a=3; card_type_b=-1; card_base_hp=61; card_base_atk=123+60; card_base_def=60+50; card_grid_x=12; card_grid_y=3; break;
	case 0848: card_name="Toxel"; card_stage=1; card_evo[0]=849; card_type_a=4; card_type_b=12; card_base_hp=40; card_base_atk=38+54; card_base_def=35+35; card_grid_x=13; card_grid_y=3; break;
	
	case 0849: 
		card_has_forms=true;
		card_name="Toxtricity"; 
		card_stage=2;  
		card_type_a=4; card_type_b=12; 
		card_base_hp=75; 
		card_base_atk=98+114; 
		card_base_def=70+70; 
		if card_form_value<500 {
			card_grid_x=14; card_grid_y=3; 
		}
		else {
			card_grid_x=15; card_grid_y=3; 
		}
		break;
	
	case 0850: card_name="Sizzlipede"; card_stage=1; card_evo[0]=851; card_type_a=2; card_type_b=11; card_base_hp=50; card_base_atk=65+50; card_base_def=45+50; card_grid_x=1; card_grid_y=4; break;
	case 0851: card_name="Centiskorch"; card_stage=2;  card_type_a=2; card_type_b=11; card_base_hp=100; card_base_atk=115+90; card_base_def=65+90; card_grid_x=2; card_grid_y=4; break;
	case 0852: card_name="Clobbopus"; card_stage=1; card_evo[0]=853; card_type_a=6; card_type_b=-1; card_base_hp=50; card_base_atk=68+50; card_base_def=60+50; card_grid_x=3; card_grid_y=4; break;
	case 0853: card_name="Grapploct"; card_stage=2;  card_type_a=6; card_type_b=-1; card_base_hp=80; card_base_atk=118+70; card_base_def=90+80; card_grid_x=4; card_grid_y=4; break;
	case 0854: card_name="Sinistea"; card_stage=1; card_evo[0]=855; card_type_a=16; card_type_b=-1; card_base_hp=40; card_base_atk=45+74; card_base_def=45+54; card_grid_x=5; card_grid_y=4; break;
	case 0855: card_name="Polteageist"; card_stage=2;  card_type_a=16; card_type_b=-1; card_base_hp=60; card_base_atk=65+134; card_base_def=65+114; card_grid_x=6; card_grid_y=4; break;
	case 0856: card_name="Hatenna"; card_stage=1; card_evo[0]=857; card_type_a=7; card_type_b=-1; card_base_hp=42; card_base_atk=30+56; card_base_def=45+53; card_grid_x=7; card_grid_y=4; break;
	case 0857: card_name="Hattrem"; card_stage=2; card_evo[0]=858; card_type_a=7; card_type_b=-1; card_base_hp=57; card_base_atk=40+86; card_base_def=65+73; card_grid_x=8; card_grid_y=4; break;
	case 0858: card_name="Hatterene"; card_stage=3;  card_type_a=7; card_type_b=8; card_base_hp=57; card_base_atk=90+136; card_base_def=95+103; card_grid_x=9; card_grid_y=4; break;
	case 0859: card_name="Impidimp"; card_stage=1; card_evo[0]=860; card_type_a=17; card_type_b=8; card_base_hp=45; card_base_atk=45+55; card_base_def=30+40; card_grid_x=10; card_grid_y=4; break;
	case 0860: card_name="Morgrem"; card_stage=2; card_evo[0]=861; card_type_a=17; card_type_b=8; card_base_hp=65; card_base_atk=60+75; card_base_def=45+55; card_grid_x=11; card_grid_y=4; break;
	case 0861: card_name="Grimmsnarl"; card_stage=3;  card_type_a=17; card_type_b=8; card_base_hp=95; card_base_atk=120+95; card_base_def=65+75; card_grid_x=12; card_grid_y=4; break;
	case 0862: card_name="Obstagoon"; card_stage=3;  card_type_a=17; card_type_b=0; card_base_hp=93; card_base_atk=90+60; card_base_def=101+81; card_grid_x=13; card_grid_y=4; break;
	case 0863: card_name="Perrserker"; card_stage=2;  card_type_a=15; card_type_b=-1; card_base_hp=70; card_base_atk=110+50; card_base_def=100+60; card_grid_x=14; card_grid_y=4; break;
	case 0864: card_name="Cursola"; card_stage=2;  card_type_a=16; card_type_b=-1; card_base_hp=60; card_base_atk=95+145; card_base_def=50+130; card_grid_x=15; card_grid_y=4; break;
	case 0865: card_name="Sirfetch'd"; card_stage=2;  card_type_a=6; card_type_b=-1; card_base_hp=62; card_base_atk=135+68; card_base_def=95+82; card_grid_x=1; card_grid_y=5; break;
	case 0866: card_name="Mr. Rime"; card_stage=3;  card_type_a=13; card_type_b=7; card_base_hp=80; card_base_atk=85+110; card_base_def=75+100; card_grid_x=2; card_grid_y=5; break;
	case 0867: card_name="Runerigus"; card_stage=2;  card_type_a=9; card_type_b=16; card_base_hp=58; card_base_atk=95+50; card_base_def=145+105; card_grid_x=3; card_grid_y=5; break;
	case 0868: card_name="Milcery"; card_stage=1; card_evo[0]=869; card_type_a=8; card_type_b=-1; card_base_hp=45; card_base_atk=40+50; card_base_def=40+61; card_grid_x=4; card_grid_y=5; break;
	
	//******
	//THIS HAS 70 NON-SHINY FORMS IN CANNON D:
	case 0869: card_has_forms=true; card_name="Alcremie"; card_stage=2;  card_type_a=8; card_type_b=-1; card_base_hp=65; card_base_atk=60+110; card_base_def=75+121; card_grid_x=5; card_grid_y=5; break;
	//******
	
	case 0870: card_name="Falinks"; card_stage=1;  card_type_a=6; card_type_b=-1; card_base_hp=65; card_base_atk=100+70; card_base_def=100+60; card_grid_x=14; card_grid_y=5; break;
	case 0871: card_name="Pincurchin"; card_stage=1;  card_type_a=4; card_type_b=-1; card_base_hp=48; card_base_atk=101+91; card_base_def=95+85; card_grid_x=15; card_grid_y=5; break;
	case 0872: card_name="Snom"; card_stage=1; card_evo[0]=873; card_type_a=13; card_type_b=11; card_base_hp=30; card_base_atk=25+45; card_base_def=35+30; card_grid_x=1; card_grid_y=6; break;
	case 0873: card_name="Frosmoth"; card_stage=2;  card_type_a=13; card_type_b=11; card_base_hp=70; card_base_atk=65+125; card_base_def=60+90; card_grid_x=2; card_grid_y=6; break;
	case 0874: card_name="Stonjourner"; card_stage=1;  card_type_a=10; card_type_b=-1; card_base_hp=100; card_base_atk=125+20; card_base_def=135+20; card_grid_x=3; card_grid_y=6; break;
	
	case 0875: 
		card_form_change=true;
		card_has_forms=true;
		card_stage=1;  
		card_type_a=13; card_type_b=-1; 
		card_base_hp=75; 
		card_base_atk=80+65; 
		if card_form_value<500 {
			card_name="Eiscue-I"; 
			card_base_def=110+90; 
			card_grid_x=4; card_grid_y=6; 
		}
		else { // Just worse :(
			card_name="Eiscue-N"; 
			card_base_def=70+50; 
			card_grid_x=5; card_grid_y=6; 
		}
		break;
	
	case 0876: 
		card_has_forms=true;
		card_name="Indeedee"; 
		card_stage=1;  
		card_type_a=7; card_type_b=0; 
		card_base_hp=60; 
		card_base_atk=65+105; 
		card_base_def=55+95; 
		if card_form_value<500 { 
			card_grid_x=6; card_grid_y=6; 
		}
		else { 
			card_grid_x=7; card_grid_y=6; 
		}
		break;
	
	case 0877: 
		//Cannon wise it CAN change form but 
		//it is not in your control
		card_has_forms=true;
		card_name="Morpeko"; 
		card_stage=1;  
		card_type_a=4; card_type_b=17; 
		card_base_hp=58; 
		card_base_atk=95+70; 
		card_base_def=58+58; 
		if card_form_value<500 {
			card_grid_x=8; card_grid_y=6; 
		}
		else {
			card_grid_x=9; card_grid_y=6; 
		}
		break;
	
	case 0878: card_name="Cufant"; card_stage=1; card_evo[0]=879; card_type_a=15; card_type_b=-1; card_base_hp=72; card_base_atk=80+40; card_base_def=49+49; card_grid_x=10; card_grid_y=6; break;
	case 0879: card_name="Copperajah"; card_stage=2;  card_type_a=15; card_type_b=-1; card_base_hp=122; card_base_atk=130+80; card_base_def=69+69; card_grid_x=11; card_grid_y=6; break;
	case 0880: card_name="Dracozolt"; card_fossil=true; card_stage=1;  card_type_a=4; card_type_b=14; card_base_hp=90; card_base_atk=100+80; card_base_def=90+70; card_grid_x=12; card_grid_y=6; break;
	case 0881: card_name="Arctozolt"; card_fossil=true; card_stage=1;  card_type_a=4; card_type_b=13; card_base_hp=90; card_base_atk=100+90; card_base_def=90+80; card_grid_x=13; card_grid_y=6; break;
	case 0882: card_name="Dracovish"; card_fossil=true; card_stage=1;  card_type_a=3; card_type_b=14; card_base_hp=90; card_base_atk=90+70; card_base_def=100+80; card_grid_x=14; card_grid_y=6; break;
	case 0883: card_name="Arctovish"; card_fossil=true; card_stage=1;  card_type_a=3; card_type_b=13; card_base_hp=90; card_base_atk=90+80; card_base_def=100+90; card_grid_x=15; card_grid_y=6; break;
	case 0884: card_name="Duraludon"; card_stage=1;  card_type_a=15; card_type_b=14; card_base_hp=70; card_base_atk=95+120; card_base_def=115+50; card_grid_x=1; card_grid_y=7; break;
	case 0885: card_name="Dreepy"; card_pseudo=true; card_stage=1; card_evo[0]=886; card_type_a=14; card_type_b=16; card_base_hp=28; card_base_atk=60+40; card_base_def=30+30; card_grid_x=2; card_grid_y=7; break;
	case 0886: card_name="Drakloak"; card_pseudo=true; card_stage=2; card_evo[0]=887; card_type_a=14; card_type_b=16; card_base_hp=68; card_base_atk=80+60; card_base_def=50+50; card_grid_x=3; card_grid_y=7; break;
	case 0887: card_name="Dragapult"; card_pseudo=true; card_stage=3;  card_type_a=14; card_type_b=16; card_base_hp=88; card_base_atk=120+100; card_base_def=75+75; card_grid_x=4; card_grid_y=7; break;
	
	case 0888:
		card_form_change=true;
		card_has_forms=true;
		card_enigma=true; 
		card_stage=1;  
		card_base_hp=92; 
		if card_form_value<500 {
			card_name="Zacian"; 
			card_type_a=8; card_type_b=-1; 
			card_base_atk=130+80; 
			card_base_def=115+115; 
			card_grid_x=5; card_grid_y=7; 
		}
		else { //should ATK boost by 50% but didnt
			card_name="Zacian-C"; 
			card_type_a=8; card_type_b=15; 
			card_base_atk=170+80; 
			card_base_def=115+115; 
			card_grid_x=6; card_grid_y=7; 
		}
		break;
	
	case 0889: 
		card_form_change=true;
		card_has_forms=true;
		card_enigma=true; 
		card_stage=1; 
		card_base_hp=92;  
		if card_form_value<500 {
			card_name="Zamazenta"; 
			card_type_a=6; card_type_b=-1; 
			card_base_atk=130+80; 
			card_base_def=115+115; 
			card_grid_x=7; card_grid_y=7;
		}
		else { //should DEF boost by 50% but didnt
			card_name="Zamazenta-C"; 
			card_type_a=6; card_type_b=15; 
			card_base_atk=130+80; 
			card_base_def=145+145; 
			card_grid_x=8 card_grid_y=7;
		}
		break;
	
	case 0890: 
		card_has_forms=true;
		card_stage=1;  
		card_enigma=true; 
		card_type_a=12; card_type_b=14; 
		if card_form_value<=999 {
			card_name="Eternatus";  
			card_base_hp=140; 
			card_base_atk=85+145; 
			card_base_def=95+95; 
			card_grid_x=9; card_grid_y=7;
		}
		else { 
			//For the only gigamax that increases stat lol
			//Should be unobtainable. Just here for...testing.
			card_name="Eternamax";  
			card_base_hp=255; 
			card_base_atk=115+125; 
			card_base_def=250+250; 
			card_grid_x=4; card_grid_y=14;
		}
		break;
	
	case 0891: card_name="Kubfu"; card_stage=1; card_evo[0]=892; card_type_a=6; card_type_b=-1; card_base_hp=60; card_base_atk=90+53; card_base_def=60+50; card_grid_x=10; card_grid_y=7; card_enigma=true; break;
	
	case 0892: 
		//Not swappable in cannon
		card_has_forms=true;
		card_enigma=true; 
		card_stage=2;  
		card_base_hp=100;
		card_base_atk=130+63; 
		card_base_def=100+60; 
		
		if card_form_value<500 {
			card_name="Urshifu-S"; 
			card_type_a=6; card_type_b=17;  
			card_grid_x=11; card_grid_y=7; 
		}
		else {
			card_name="Urshifu-R"; 
			card_type_a=6; card_type_b=3;  
			card_grid_x=12; card_grid_y=7; 
		}
		break;
	
	case 0893: 
		card_has_forms=true;
		card_enigma=true; 
		card_name="Zarude"; 
		card_stage=1; 
		card_type_a=17; card_type_b=1; 
		card_base_hp=105; 
		card_base_atk=120+70; 
		card_base_def=105+95;  
		if card_form_value<500 { 
			card_grid_x=13; card_grid_y=7; 
		} 
		else { 	
			card_grid_x=14; card_grid_y=7; 
		}
		break;
	
	case 0894: card_name="Regieleki"; card_stage=1;  card_type_a=4; card_type_b=-1; card_base_hp=80; card_base_atk=100+100; card_base_def=50+50; card_grid_x=15; card_grid_y=7; card_enigma=true; break;
	case 0895: card_name="Regidrago"; card_stage=1;  card_type_a=14; card_type_b=-1; card_base_hp=200; card_base_atk=100+100; card_base_def=50+50; card_grid_x=1; card_grid_y=8; card_enigma=true; break;
	case 0896: card_name="Glastrier"; card_stage=1;  card_type_a=13; card_type_b=-1; card_base_hp=100; card_base_atk=145+65; card_base_def=130+110; card_grid_x=2; card_grid_y=8; card_enigma=true; break;
	case 0897: card_name="Spectrier"; card_stage=1;  card_type_a=16; card_type_b=-1; card_base_hp=100; card_base_atk=65+145; card_base_def=60+80; card_grid_x=3; card_grid_y=8; card_enigma=true; break;
	
	case 0898: 
		card_has_forms=true;
		card_form_change=true;
		card_enigma=true;
		card_stage=1; 
		card_base_hp=100; 
		
		if card_form_value<500 {
			card_name="Calyrex";  
			card_type_a=7; card_type_b=1; 
			card_base_atk=80+80; 
			card_base_def=80+80; 
			card_grid_x=4; card_grid_y=8; 
		}
		else if card_form_value<750 {
			card_name="Calyrex-I";  
			card_type_a=7; card_type_b=13; 
			card_base_atk=165+85; 
			card_base_def=150+130; 
			card_grid_x=5; card_grid_y=8; 
		}
		else {
			card_name="Calyrex-S";  
			card_type_a=7; card_type_b=16; 
			card_base_atk=85+165; 
			card_base_def=80+100; 
			card_grid_x=6; card_grid_y=8; 
		}
		break;
	
	// LEGENDS ARCEUS
	case 0899: card_name="Wyrdeer"; card_stage=2;  card_type_a=0; card_type_b=7; card_base_hp=103; card_base_atk=105+105; card_base_def=72+75; card_grid_x=7; card_grid_y=8; break;
	case 0900: card_name="Kleavor"; card_stage=2; card_type_a=11; card_type_b=10; card_base_hp=70; card_base_atk=135+45; card_base_def=95+70; card_grid_x=8; card_grid_y=8; break;
	case 0901: card_name="Ursaluna"; card_stage=3; card_type_a=9; card_type_b=0; card_base_hp=130; card_base_atk=140+45; card_base_def=105+80; card_grid_x=9; card_grid_y=8; break;
	case 0902: 
		card_name="Basculegion"; 
		card_stage=2; 
		card_type_a=3; card_type_b=16; 
		card_has_forms=true;	
		if card_form_value<833 {
			card_base_hp=120; 
			card_base_atk=92+100; 
			card_base_def=65+75; 
			card_grid_x=10; card_grid_y=8;}
		else {
			card_base_hp=120; 
			card_base_atk=112+80; 
			card_base_def=65+75; 
			card_grid_x=11; card_grid_y=8;}
		break;
	case 0903: card_name="Sneasler"; card_stage=2; card_type_a=6; card_type_b=12; card_base_hp=80; card_base_atk=130+40; card_base_def=60+80; card_grid_x=12; card_grid_y=8; break;
	case 0904: card_name="Overqwil"; card_stage=2;  card_type_a=17; card_type_b=12; card_base_hp=85; card_base_atk=115+65; card_base_def=95+65; card_grid_x=13; card_grid_y=8; break;
	case 0905: 
		card_name="Enamorus"; 
		card_form_change=true;
		card_stage=1;  card_enigma=true; 
		card_type_a=8; card_type_b=5; 
		card_has_forms=true;	
		if card_form_value<500 {
			card_base_hp=74; 
			card_base_atk=115+135; 
			card_base_def=70+80; 
			card_grid_x=14; card_grid_y=8; }
		else {
			card_base_hp=74; 
			card_base_atk=115+135; 
			card_base_def=110+100; 
			card_grid_x=15; card_grid_y=8; }
		break;
	
	
	// END OF MODDED CODE
		
	//
	case 2001:
		card_name="MissingNo.";
		card_stage=1; card_secret=true;
		card_type_a=05; card_type_b=00;
		card_base_hp=33; card_base_atk=136+6; card_base_def=0+6;
		//as requested
		card_grid_x=4; card_grid_y=14; break;
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
	default:
		card_sheet=sp_poke_c;
		card_name=card_id;
		card_stage=1;
		card_type_a=00; card_type_b=-1;
		card_base_hp=100; card_base_atk=100; card_base_def=100; //hp 3-20, def 1-5
		card_grid_x=5; card_grid_y=14; 
		break;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}