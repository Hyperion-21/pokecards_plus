card_cat=irandom(1);
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_cat=0 {
	card_id=irandom_range(1,15);
	card_level=irandom_range(1,20);
	card_exp=irandom(100);
	card_glyph_a=irandom_range(-1,17);
	if card_glyph_a>=0 { card_glyph_b=irandom_range(-1,17); }
	else { card_glyph_b=-1; }
	if card_glyph_b>=0 { card_glyph_c=irandom_range(-1,17); }
	else { card_glyph_c=-1; }
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	//00 normal, 01 grass, 02 fire, 03 water, 04 electric, 05 flying, 06 fighting, 07 psychic, 08 fairy
	//09 ground, 10 rock, 11 bug, 12 poison, 13 ice, 14 dragon, 15 steel, 16 ghost, 17 dark
	//
	if card_id<=386 { card_sheet=sp_poke_a; }
	else { card_sheet=sp_poke_b; }
	card_enigma=false;
	//
	switch (card_id) {
		case 001:
			card_name="Bulbasaur";
			card_evo[0]=002; card_type_a=01; card_type_b=12;
			card_base_hp=45; card_base_atk=49+65; card_base_def=49+65;
			card_grid_x=1; card_grid_y=1; break;
		case 002:
			card_name="Ivysaur";
			card_evo[0]=003; card_type_a=01; card_type_b=12;
			card_base_hp=60; card_base_atk=62+80; card_base_def=63+80;
			card_grid_x=2; card_grid_y=1; break;
		case 003:
			card_name="Venusaur";
			card_evo[0]=-1; card_type_a=01; card_type_b=12;
			card_base_hp=80; card_base_atk=82+100; card_base_def=83+100;
			card_grid_x=3; card_grid_y=1; break;
		case 004:
			card_name="Charmander";
			card_evo[0]=005; card_type_a=02; card_type_b=-1;
			card_base_hp=39; card_base_atk=52+60; card_base_def=43+50;
			card_grid_x=5; card_grid_y=1; break;
		case 005:
			card_name="Charmeleon";
			card_evo[0]=006; card_type_a=02; card_type_b=-1;
			card_base_hp=58; card_base_atk=64+80; card_base_def=58+65;
			card_grid_x=6; card_grid_y=1; break;
		case 006:
			card_name="Charizard";
			card_evo[0]=-1; card_type_a=02; card_type_b=05;
			card_base_hp=78; card_base_atk=84+109; card_base_def=78+85;
			card_grid_x=7; card_grid_y=1; break;
		case 007:
			card_name="Squirtle";
			card_evo[0]=008; card_type_a=03; card_type_b=-1;
			card_base_hp=44; card_base_atk=48+50; card_base_def=65+64;
			card_grid_x=10; card_grid_y=1; break;
		case 008:
			card_name="Wartortle";
			card_evo[0]=009; card_type_a=03; card_type_b=-1;
			card_base_hp=59; card_base_atk=63+65; card_base_def=80+80;
			card_grid_x=11; card_grid_y=1; break;
		case 009:
			card_name="Blastoise";
			card_evo[0]=-1; card_type_a=03; card_type_b=-1;
			card_base_hp=79; card_base_atk=83+85; card_base_def=100+105;
			card_grid_x=12; card_grid_y=1; break;
		case 010:
			card_name="Caterpie";
			card_evo[0]=011; card_type_a=11; card_type_b=-1;
			card_base_hp=45; card_base_atk=30+20; card_base_def=35+20;
			card_grid_x=14; card_grid_y=1; break;
		case 011:
			card_name="Metapod";
			card_evo[0]=012; card_type_a=11; card_type_b=-1;
			card_base_hp=50; card_base_atk=20+25; card_base_def=55+25;
			card_grid_x=15; card_grid_y=1; break;
		case 012:
			card_name="Butterfree";
			card_evo[0]=-1; card_type_a=11; card_type_b=05;
			card_base_hp=60; card_base_atk=45+90; card_base_def=50+80;
			card_grid_x=1; card_grid_y=2; break;
		case 013:
			card_name="Weedle";
			card_evo[0]=014; card_type_a=11; card_type_b=12;
			card_base_hp=40; card_base_atk=35+20; card_base_def=30+20;
			card_grid_x=2; card_grid_y=2; break;
		case 014:
			card_name="Kakuna";
			card_evo[0]=015; card_type_a=11; card_type_b=12;
			card_base_hp=45; card_base_atk=25+25; card_base_def=50+25;
			card_grid_x=3; card_grid_y=2; break;
		case 015:
			card_name="Beedrill";
			card_evo[0]=-1; card_type_a=11; card_type_b=12;
			card_base_hp=65; card_base_atk=90+45; card_base_def=40+80;
			card_grid_x=4; card_grid_y=2; break;
	}
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	card_full_hp=ceil((card_base_hp*card_level)/50);
	card_full_atk=ceil((card_base_atk*card_level)/100);
	card_full_def=ceil((card_base_def*card_level)/150);
	//
	card_atk=card_full_atk;
	card_def=card_full_def;
	card_hp=card_full_hp;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if card_cat=1 {
	card_id=irandom_range(2001,2004);
	//
	switch (card_id) {
		case 2001:
			card_name="Oran Berry"; break;
		case 2002:
			card_name="Leppa Berry"; break;
		case 2003:
			card_name="Lum Berry"; break;
		case 2004:
			card_name="Enigma Berry"; break;
	}
}