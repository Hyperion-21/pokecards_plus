card_id=irandom_range(1,3);
card_level=irandom_range(1,20);
card_exp=irandom_range(0,100);
//————————————————————————————————————————————————————————————————————————————————————————————————————
//00 normal, 01 grass, 02 fire, 03 water, 04 electric, 05 flying, 06 fighting, 07 psychic, 08 fairy
//09 ground, 10 rock, 11 bug, 12 poison, 13 ice, 14 dragon, 15 steel, 16 ghost, 17 dark
//
switch (card_id) {
	case 001:
		card_name="Bulbasaur";
		card_evo[0]=002; card_type_a=01; card_type_b=12;
		card_base_hp=45; card_base_atk=49+65; card_base_def=49+65;
		card_sheet=sp_poke_a; card_grid_x=1; card_grid_y=1;
		break;
	case 002:
		card_name="Ivysaur";
		card_evo[0]=003; card_type_a=01; card_type_b=12;
		card_base_hp=60; card_base_atk=62+80; card_base_def=63+80;
		card_sheet=sp_poke_a; card_grid_x=2; card_grid_y=1;
		break;
	case 003:
		card_name="Venusaur";
		card_evo[0]=-1; card_type_a=01; card_type_b=12;
		card_base_hp=80; card_base_atk=82+100; card_base_def=83+100;
		card_sheet=sp_poke_a; card_grid_x=3; card_grid_y=1;
		break;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
card_full_hp=ceil((card_base_hp*card_level)/50);
card_full_atk=ceil((card_base_atk*card_level)/100);
card_full_def=ceil((card_base_def*card_level)/150);
//
card_atk=card_full_atk;
card_def=card_full_def;
card_hp=card_full_hp;