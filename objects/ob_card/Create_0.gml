depth=200;
card_shiny = false;
card_holo = false;
card_delta = false;
card_delta_type = -1;
card_bonus_atk = 0;
card_glyph_a = -1;
card_glyph_b = -1;
card_glyph_c = -1;
card_full_atk = -1;
card_has_animate = false;
randomize(); //random seed
card_gen = -1;
count[0] = 0;
count[1] = 0;
count[2] = 0;
marked = false;

jumpmax = -5;
jumptimer = irandom_range(50,1000);
jumpcount = 0;
jumpy = 0;
jumping = 1;
jumpfloor = choose(0.5,2);


dupe = 0;

card_berry = -1;
card_animate = false;

holo_index = irandom_range(0,21);
anim_index = irandom_range(0,5);

//
if instance_exists(ob_control) { var reference_id=ob_control; }
else if instance_exists(ob_deckbuild) { var reference_id=ob_deckbuild; }
else if instance_exists(ob_event) { var reference_id=ob_event; }

if instance_exists(ob_main){
	var secret_chance = ob_main.event_card_weight[event_card_group_secret];
	var environment_chance = ob_main.event_card_weight[event_card_group_environment] + secret_chance;
	if ob_main.area_zone=0 and ob_main.zone_first_lap=true and ob_main.roadmap_area=0
	{
			var enigma_chance = 0
	}
	else
	{
			var enigma_chance = ob_main.event_card_weight[event_card_group_enigma] + environment_chance;
	}
	var stage_2_chance = ob_main.event_card_weight[event_card_group_stage_2] + enigma_chance;
	var stage_3_chance = ob_main.event_card_weight[event_card_group_stage_3] + stage_2_chance;
	var pseudo_chance = ob_main.event_card_addition_chance[event_card_type_pseudo];
	var fossil_chance = ob_main.event_card_addition_chance[event_card_type_fossil];
	var starter_chance = ob_main.event_card_addition_chance[event_card_type_starter];
	var baby_chance = ob_main.event_card_addition_chance[event_card_type_baby];
	var shiny_chance = ob_main.shiny_chance;
	var delta_chance = ob_main.delta_chance;
	var animate_chance = ob_main.animate_chance;
}
	
//————————————————————————————————————————————————————————————————————————————————————————————————————
if reference_id=ob_deckbuild or (reference_id=ob_event and ob_event.show_deck=true) { card_face=true; }
else { card_face=false; }
card_played=false;
card_trash=false;
card_enemy=false;
//
card_cat=reference_id.create_card_cat;
for (var i=0; i<=deck_setup_max; i++;) {
	if card_cat=0 and reference_id=ob_deckbuild { card_indeck[i]=reference_id.create_card_indeck[i]; }
	else { card_indeck[i]=false; }
}
if card_cat=0 and reference_id=ob_deckbuild { card_serial=reference_id.create_card_serial; }
else { card_serial=-1; }
//
num_in_maindeck=-1;
num_in_berrydeck=-1;
num_in_all=-1;
//
potential_x=x;
potential_y=y;
//
for (var i=0; i<=3; i++;) {
	consumed_berry[i]=0;
}

//
already_attacked=false;
effect_damaged=0;
//
card_delete_timer=0;
card_delete_timer_max=60;
//
auto_turn_add=false;
if card_cat=0 and reference_id=ob_control { enemy_randomizer=reference_id.create_enemy_randomizer; }
else { enemy_randomizer=false; }
if card_cat=0 and reference_id=ob_control { enemy_costcount=reference_id.create_enemy_costcount; }
else { enemy_costcount=false; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_cat=0 {
	var random_group_chance=irandom(9999);
	var random_shiny_chance=irandom(8192);
	var random_delta_chance=irandom(8192);
	var random_animate_chance=irandom(8192);
var poke_floor, poke_max;

if reference_id = ob_event
{

		switch (ob_event.card_gen) {
	    case -1:
	        poke_floor = 1;
	        poke_max = normal_poke_id_max;
	        break;
	    case 1:
	        poke_floor = 1;
	        poke_max = 151;
			random_card = false;			
	        break;
	    case 2:
	        poke_floor = 152;
	        poke_max = 251;
			random_card = false;			
	        break;
	    case 3:
	        poke_floor = 252;
	        poke_max = 386;
			random_card = false;			
	        break;
	    case 4:
	        poke_floor = 387;
	        poke_max = 493;
			random_card = false;			
	        break;
	    case 5:
	        poke_floor = 494;
	        poke_max = 649;
			random_card = false;			
	        break;
	    case 6:
	        poke_floor = 650;
	        poke_max = 721;
			random_card = false;			
	        break;
	    case 7:
	        poke_floor = 722;
	        poke_max = 809;
			random_card = false;			
	        break;
	    case 8:
	        poke_floor = 810;
	        poke_max = 905;
			random_card = false;			
	        break;
	    case 9:
	        poke_floor = 906;
	        poke_max = 1008;
			random_card = false;
	        break;
	}
}
else
{	        poke_floor = 1;
	        poke_max = normal_poke_id_max;
}

	//
		do {
		if ob_main.shinycharm > 0
			{
				var charm = ob_main.shinycharm_chance;
			}
			else
			{
				var charm = 0;
			}
		if random_shiny_chance < (shiny_chance+charm){
				card_shiny = true;
		}
		if random_delta_chance < delta_chance
		{
			card_delta = true;
			card_delta_type = irandom_range(00,17);
		}
		card_id=reference_id.create_card_id;
		if card_id=-1 { var random_card=true; } else { var random_card=false; }
		//
		var choose_id_enigma=false, choose_id_stage_2=false, choose_id_stage_3=false, choose_id_normal=false;
		var allow_id_pseudo=false, allow_id_fossil=false, allow_id_starter=false, allow_id_baby=false;
		//———————————————————————————————————————————————————————————————————————————————————————————————————— /// card rarity rolls
		if random_card=true and enemy_randomizer=false {
			if random_group_chance< secret_chance {                /// rolls secret
				card_id=irandom_range(1,secret_cards_total)+2000;
				card_innate=1;
				if card_shiny = true {card_innate=innate_max + 1;}
			}
			else if random_group_chance< environment_chance && poke_max = normal_poke_id_max {              /// rolls environment
				card_id=irandom_range(1,environment_cards_total)+2500;
				card_innate=1;
				card_shiny = false;
			}
			else {
				card_id=irandom_range(poke_floor,poke_max);    ///rolls standard
				card_innate=1;
				//
				if random_group_chance< enigma_chance { choose_id_enigma=true; }          ///rolls legendary
				else if random_group_chance< stage_2_chance { choose_id_stage_2=true; }   ///rolls 2 stage
				else if random_group_chance< stage_3_chance { choose_id_stage_3=true; }   ///rolls 3 stage
				else { choose_id_normal=true; } 
				//
				var random_id_chance=irandom(99); if random_id_chance< pseudo_chance { allow_id_pseudo=true; } //50% pseudo allowed
				var random_id_chance=irandom(99); if random_id_chance< fossil_chance { allow_id_fossil=true; } //50% fossil allowed
				var random_id_chance=irandom(99); if random_id_chance< starter_chance { allow_id_starter=true; } //25% starter allowed
				var random_id_chance=irandom(99); if random_id_chance< baby_chance { allow_id_baby=true; } //25% baby allowed
				if card_shiny = true {card_innate=innate_max + 1;} /// sets 4 hearts for shiny
			}
			
			//
			card_level=irandom_range(ob_main.card_level_spawn_min,ob_main.card_level_spawn_limit);
			card_glyph_a=-1;
			card_glyph_b=-1;
			card_glyph_c=-1;
			card_form_value=irandom(999);
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else if random_card=true and enemy_randomizer=true {
			if random_group_chance<500 { //5% environment card
				card_id=irandom_range(1,environment_cards_total)+2500;
				card_innate=1;
				if ob_main.option_state[opt_challenge]=ch_rainbow
					{
						card_delta = true;
						card_delta_type = irandom_range(0,17);
						card_type_a = card_delta_type;
						card_type_b = -1;
					}
					else if ob_main.option_state[opt_challenge]  != ch_delta
					{
						card_shiny = false;
						card_delta = false;
					}
			}
			else {
				card_id=irandom_range(1,normal_poke_id_max); /// Sets enemies to never have shinies.
				//
				if reference_id.create_card_innate=-1 {
					var card_enemy_innate_value=irandom(999);
					if ob_main.playing_gym=true or ob_main.playing_elite=true or ob_main.playing_champion=true {
						if ob_main.area_zone < area_zone_max
						{
							if card_enemy_innate_value<(10+ob_main.area_zone*10) { card_innate=innate_max; } //1% - 9%
							else if card_enemy_innate_value<(40+ob_main.area_zone*20) { card_innate=3; } //3% - 11%
							else if card_enemy_innate_value<(100+ob_main.area_zone*30) { card_innate=2; } //6% - 14%
							else { card_innate=1; } //90% - 66%
						}
						else 
						{
							if card_enemy_innate_value < 450 {card_innate = innate_max;}
							else if card_enemy_innate_value >= 450 {card_innate = innate_max+1;}
							choose_id_stage_3=true;
						}							
					if ob_main.option_state[opt_challenge]=ch_rainbow
					{
						card_delta = true;
						card_delta_type = irandom_range(0,17);
						card_type_a = card_delta_type;
						card_type_b = -1;
					}
					else if ob_main.option_state[opt_challenge]  != ch_delta
					{
						card_shiny = false;
						card_delta = false;
					}
					}
					else {
						if ob_main.area_zone < area_zone_max
						{
							if card_enemy_innate_value<(10+ob_main.area_zone*5) { card_innate=innate_max; } //1% - 5%
							else if card_enemy_innate_value<(40+ob_main.area_zone*10) { card_innate=3; } //3% - 7%
							else if card_enemy_innate_value<(100+ob_main.area_zone*15) { card_innate=2; } //6% - 10%
							else { card_innate=1; } //90% - 78%
						}
						else 
						{
							if card_enemy_innate_value < 100 {card_innate = innate_max-1;}
							else if card_enemy_innate_value < 450 {card_innate = innate_max;}
							else if card_enemy_innate_value >= 450 {card_innate = innate_max+1;}
							choose_id_stage_3=true;
						}	
						if ob_main.option_state[opt_challenge]=ch_rainbow
						{
							card_delta = true;
							card_delta_type = irandom_range(0,17);
							card_type_a = card_delta_type;
							card_type_b = -1;
						}
						else if ob_main.option_state[opt_challenge]  != ch_delta
						{
							card_shiny = false;
							card_delta = false;
						}
					}
				}
				else { card_innate= innate_max;
					//reference_id.create_card_innate;
					card_shiny = false; }
				//
				var random_id_chance=irandom(99); if random_id_chance<90 { allow_id_pseudo=true; } //90% pseudo allowed
				var random_id_chance=irandom(99); if random_id_chance<75 { allow_id_fossil=true; } //75% fossil allowed
				var random_id_chance=irandom(99); if random_id_chance<75 { allow_id_starter=true; } //75% starter allowed
				var random_id_chance=irandom(99); if random_id_chance<50 { allow_id_baby=true; } //50% baby allowed
			}
			//
			if reference_id.create_card_level=-1 {
				do {
					var accepted_level=true;
					card_level=irandom_range(ob_main.card_level_enemy_min,ob_main.card_level_enemy_limit);
					//
					if card_level=ob_main.card_level_enemy_limit and ob_main.zone_first_lap=true and
					ob_main.playing_gym=false and ob_main.playing_elite=false and ob_main.playing_champion=false {
						accepted_level=choose(true,false,false); //2/3 chance to re-roll
					}
				} until (accepted_level=true);
			}
			else { card_level=reference_id.create_card_level; }
			card_glyph_a=reference_id.create_card_glyph_a;
			card_glyph_b=reference_id.create_card_glyph_b;
			card_glyph_c=reference_id.create_card_glyph_c;
			if reference_id.create_card_form_value=-1 { card_form_value=irandom(999); }
			else { card_form_value=reference_id.create_card_form_value; }
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else {
			
			card_level=reference_id.create_card_level;
			card_glyph_a=reference_id.create_card_glyph_a;
			card_glyph_b=reference_id.create_card_glyph_b;
			card_glyph_c=reference_id.create_card_glyph_c;
			card_innate=reference_id.create_card_innate;
			card_shiny=reference_id.create_card_shiny;
			card_holo=reference_id.create_card_holo;
			card_delta=reference_id.create_card_delta;
			card_delta_type=reference_id.create_card_delta_type;
			card_type_a=reference_id.create_card_type_a;
			card_type_b=reference_id.create_card_type_b;
			card_form_value=reference_id.create_card_form_value;
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		sc_pokelist();
		
		if random_animate_chance < animate_chance && card_has_animate = true
		{
			card_animate = true;			
		}

		if card_has_rush = true and card_has_taunt = true { card_glyph_a=ref_glyph_rush; card_glyph_b=ref_glyph_taunt; } //rush and taunt
		else if card_has_rush = true and card_glyph_a!=ref_glyph_rush { card_glyph_a=ref_glyph_rush; } //rush	
		else if card_has_taunt = true and card_glyph_a!=ref_glyph_taunt { card_glyph_a=ref_glyph_taunt; } //rush	

		if card_delta = true
		{
				if card_environment = true
				{
					card_delta = false;
				}
				else
				{
						if card_type_b = -1
						{
							var reroll = 1;
						}
						else 
						{
							var reroll = choose(0,0,1);
						}
					if card_type_a = (03 or 13 or 16 or 17 or 00 or 14) && reroll = 1// oran berry
					{
						card_delta_type = choose(02,07,08,06,09,10,01,04,12,11,15,05); // lum or leppa
					}
					else if card_type_a = (02 or 07 or 08 or 06 or 09 or 10)  && reroll = 1// oran berry
					{
						card_delta_type = choose(03,13,16,17,00,14,01,04,12,11,15,05); // lum or leppa
					}
					if card_type_a = (01 or 04 or 12 or 11 or 15 or 05)  && reroll = 1// oran berry
					{
						card_delta_type = choose(02,07,08,06,09,10,03,13,16,17,00,14); // lum or leppa
					}
					card_type_a = card_delta_type;
					card_type_b = -1;
				}
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		// SAVE COMPATIBILITY (v1.3.0.1) + (v1.5.0.0)
		if random_card=false {
			if (card_id=109 or card_id=110) and card_glyph_a>=glyph_common_amount { card_glyph_a=ref_glyph_mist; } //koffing, weezing
			else if (card_id=132  or card_id=2006) and card_glyph_a!=ref_glyph_transform { card_glyph_a=ref_glyph_transform; } //ditto
			else if card_id=235 and card_glyph_a!=ref_glyph_sketch { card_glyph_a=ref_glyph_sketch; } //smeargle
			else if card_id=2504 and card_glyph_a!=ref_glyph_determination{ card_glyph_a=ref_glyph_determination; } //red
			else if card_id=2505 and card_glyph_a!=ref_glyph_command{ card_glyph_a=ref_glyph_command; } //blue
			else if (card_has_rush = true and card_has_taunt = true) and (card_glyph_a!=ref_glyph_rush or card_glyph_b!=ref_glyph_taunt) { card_glyph_a=ref_glyph_rush; card_glyph_b=ref_glyph_taunt; } //rush and taunt	
			else if card_has_rush = true and card_glyph_a!=ref_glyph_rush{ card_glyph_a=ref_glyph_rush; } //rush 
			else if card_has_taunt = true and card_glyph_a!=ref_glyph_taunt{ card_glyph_a=ref_glyph_taunt; } //taunt
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		if random_card=true or card_glyph_a=-2 or card_glyph_b=-2 or card_glyph_c=-2 {
			if card_glyph_a=-2 { card_glyph_a=-1; } //in case they were -2, which is used for semi-random enemy cards
			if card_glyph_b=-2 { card_glyph_b=-1; }
			if card_glyph_c=-2 { card_glyph_c=-1; }
			//
			if card_id=109 or card_id=110 { card_glyph_a=choose(-1,-1,ref_glyph_mist); } //koffing, weezing
			else if card_id=132 or card_id=2006 { card_glyph_a=ref_glyph_transform; } //ditto
			else if card_id=235 { card_glyph_a=ref_glyph_sketch; } //smeargle
			else if card_id=2504 { card_glyph_a=ref_glyph_determination; } //red
			else if card_id=2505 { card_glyph_a=ref_glyph_command; } //blue
			else if (card_has_rush = true and card_has_taunt = true) and (card_glyph_a!=ref_glyph_rush or card_glyph_b!=ref_glyph_taunt) { card_glyph_a=ref_glyph_rush; card_glyph_b=ref_glyph_taunt; } //rush and taunt
			else if card_has_rush = true and card_glyph_a!=ref_glyph_rush{ card_glyph_a=ref_glyph_rush; } //rush 
			else if card_has_taunt = true and card_glyph_a!=ref_glyph_taunt{ card_glyph_a=ref_glyph_taunt; } //taunt
			//
			if enemy_randomizer=false {
				var card_glyph_chance=irandom(999), card_glyph_total=0;
				if card_glyph_chance<5 { card_glyph_total=2; } //0.5%
				else if card_glyph_chance<25 { card_glyph_total=1; } //2%
				//
				if card_glyph_total>=1 and card_glyph_a=-1 {
					card_glyph_a=sc_glyph_random(card_environment);
				}
				if card_glyph_total>=2 and card_glyph_b=-1 {
					do {
						card_glyph_b=sc_glyph_random(card_environment);
					} until (card_glyph_b!=card_glyph_a);
				}
			}
			else {
				var card_glyph_chance=irandom(9999), card_glyph_total=0;
				if card_environment=true { var card_glyph_chance_limit=2500+625*ob_main.area_zone; } //25%, 31.25%, 37.5%, 43.75%, 50%, 56.25%, 62.5%, 68.75%, (75%)
				else if ob_main.playing_gym=true or ob_main.playing_elite=true or ob_main.playing_champion=true {
					var card_glyph_chance_limit=1500+225*ob_main.area_zone; } //15%, 17.25%, 19.5%, 21.75%, 24%, 26.25%, 28.5%, 30.75%, (33%)
				else { var card_glyph_chance_limit=980+190*ob_main.area_zone; } //9.8%, 11.7%, 13.6%, 15.5%, 17.4%, 19.3%, 21.2%, 23.1%, (25%)
				//
				if card_glyph_chance<card_glyph_chance_limit {
					card_glyph_chance=irandom(99);
					if card_glyph_chance<20 { card_glyph_total=3; } //20%
					else if card_glyph_chance<50 { card_glyph_total=2; } //30%
					else if card_glyph_chance<100 { card_glyph_total=1; } //50%
					//
					if card_glyph_total>=1 and card_glyph_a=-1 {
						card_glyph_a=sc_glyph_random(card_environment);
					}
					if card_glyph_total>=2 and card_glyph_b=-1 {
						do {
							card_glyph_b=sc_glyph_random(card_environment);
						} until (card_glyph_b!=card_glyph_a);
					}
					if card_glyph_total=3 and card_glyph_c=-1 {
						do {
							card_glyph_c=sc_glyph_random(card_environment);
						} until (card_glyph_c!=card_glyph_a and card_glyph_c!=card_glyph_b);
					}
				}
			}
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		var card_rarity=round(sqrt(card_base_hp+card_base_atk+card_base_def)*10-100);
		//
		if random_card=true {
			var card_rarity_chance=0, card_rarity_soft_min=0, card_rarity_soft_max=-1;
			//
			if enemy_randomizer=false {
				var card_rarity_chance_max=145;
				card_rarity_chance=irandom(card_rarity_chance_max-1)+1;
			}
			else {
				if card_environment=true {
					var card_rarity_chance_max=145;
					card_rarity_chance=irandom(card_rarity_chance_max-1)+1;
				}
				else if ob_main.playing_gym=true or ob_main.playing_elite=true or ob_main.playing_champion=true {
					var card_rarity_chance_max=220; //about +50% to increase chance for stronger pokemon
					card_rarity_soft_min=42+ob_main.area_zone*4; //42-74, about 200-300 base stat total (201.64-302.76)
					if ob_main.area_zone=0 { card_rarity_soft_max=81; } //about 330 base stat total (327.61)
					card_rarity_chance=irandom(card_rarity_chance_max-1)+1;
				}
				else {
					var card_rarity_chance_max=180; //about +25% to increase chance for stronger pokemon
					var card_rarity_irandom_max=60+ob_main.latest_zone*45; //60 (above lowest normal-type and dragon-type), 105, 150 (145), 179
					if card_rarity_irandom_max>card_rarity_chance_max-1 { card_rarity_irandom_max=card_rarity_chance_max-1; }
					card_rarity_chance=irandom(card_rarity_irandom_max)+1;
				}
			}
			//
			var card_rarity_check=false;
			if card_rarity_chance>card_rarity or card_rarity_chance=card_rarity_chance_max {
				card_rarity_check=true;
				//
				if enemy_randomizer=false {
					if card_enigma=false and choose_id_enigma=true { card_rarity_check=false; }
					else if card_stage!=2 and choose_id_stage_2=true { card_rarity_check=false; }
					else if card_stage!=3 and choose_id_stage_3=true { card_rarity_check=false; }
					else if (card_stage>1 or card_enigma=true) and choose_id_normal=true { card_rarity_check=false; }
				}
				else if ob_main.newgameplus = true{
						if card_evo[0] != -1  { card_rarity_check=false; }
						}
				//
				if card_pseudo=true and allow_id_pseudo=false { card_rarity_check=false; }
				if card_fossil=true and allow_id_fossil=false { card_rarity_check=false; }
				if card_starter=true and allow_id_starter=false { card_rarity_check=false; }
				if card_stage=0 and allow_id_baby=false { card_rarity_check=false; }
				//
				if card_rarity_check=true {
					if card_rarity<card_rarity_soft_min { card_rarity_check=choose(false,false,false,true); } //25%
				}
				//
				if card_rarity_check=true {
					if card_rarity_soft_max>-1 and card_rarity>card_rarity_soft_max { card_rarity_check=choose(false,false,false,true); } //25%
				}
				//
				if card_rarity_check=true {
					card_rarity_chance=irandom(34)+1; //level 10: 30 (max) + 5 (higher chances in general)
					if card_rarity_chance>=round(sqrt(card_level-1)*10) { card_rarity_check=true; }
					else { card_rarity_check=false; }
				}
				//
				if card_rarity_check=true and enemy_randomizer=true and card_environment=false {
					card_rarity_check=false;
					
					choose_id_stage_3=true { card_rarity_check=false; }
					//
					for (var i=0; i<=17; i++;) {
						var type_condition_chance=irandom(99);
						if type_condition_chance<ob_control.enemy_type_chance[i] and (card_type_a=i or card_type_b=i) {
							card_rarity_check=true;
						}
					}
				}
			}
		}
		if enemy_randomizer=true && ob_main.newgameplus = true
		{
			if card_can_mega = true
			{
				card_form_value = 1000;
			}
			else if card_has_forms = true
			{
				if card_form_value < 500
				{
					card_form_value = irandom_range(500,999);
				}
			}
		
		}
	} until (random_card=false or (card_rarity_check=true and card_name!=""));
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	sc_card_level_stats_all(true,true);

}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if card_cat=1 {
	card_id=reference_id.create_card_id;
	if card_id=-1 { var random_card=true; } else { var random_card=false; }
	//
	if random_card=true {
		var card_berry_chance=irandom(99);
		if card_berry_chance<85 { card_id=choose(3000,3001,3002); }
		else { card_id=3003; } //15% (keep in mind number of extra enigma berries in enemy decks in sc_enemy_berry_deck)
	}
	//
	switch (card_id) {
		case 3000:
			card_name="Oran Berry"; break;
		case 3001:
			card_name="Leppa Berry"; break;
		case 3002:
			card_name="Lum Berry"; break;
		case 3003:
			card_name="Enigma Berry"; break;
	}
}

old_id = card_id; /// for transform