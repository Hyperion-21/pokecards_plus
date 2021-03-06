depth = 200;
 
if (instance_exists(ob_control))
{
    var reference_id = ob_control;
}
else if (instance_exists(ob_deckbuild))
{
    var reference_id = ob_deckbuild;
}
else if (instance_exists(ob_event))
{
    var reference_id = ob_event;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if (reference_id == ob_deckbuild || (reference_id == ob_event && ob_event.show_deck == true))
{
    card_face = true;
}
else
{
    card_face = false;
}
card_played = false;
card_trash = false;
card_enemy = false;

// 
card_cat = reference_id.create_card_cat;
for (var i = 0; i <= deck_setup_max; i++)
{
    if (card_cat == 0 && reference_id == ob_deckbuild)
    {
        card_indeck[i] = reference_id.create_card_indeck[i];
    }
    else
    {
        card_indeck[i] = false;
    }
}
if (card_cat == 0 && reference_id == ob_deckbuild)
{
    card_serial = reference_id.create_card_serial;
}
else
{
    card_serial = -1;
}

// 
num_in_maindeck = -1;
num_in_berrydeck = -1;
num_in_all = -1;

// 
potential_x = x;
potential_y = y;

// 
for (var i = 0; i <= 3; i++)
{
    consumed_berry[i] = 0;
}

// 
already_attacked = false;
effect_damaged = 0;

// 
card_delete_timer = 0;
card_delete_timer_max = 60;

// 
auto_turn_add = false;
if (card_cat == 0 && reference_id == ob_control)
{
    enemy_randomizer = reference_id.create_enemy_randomizer;
}
else
{
    enemy_randomizer = false;
}
if (card_cat == 0 && reference_id == ob_control)
{
    enemy_costcount = reference_id.create_enemy_costcount;
}
else
{
    enemy_costcount = false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_cat=0 {
	var random_group_chance = irandom(9999);
	//
	do {
		card_id = reference_id.create_card_id;
		card_mega = false;
		if (card_id == -1)
		{
		    var random_card = true;
		}
		else
		{
		    var random_card = false;
		}

		// 
		var choose_id_enigma = false;
		var choose_id_stage_2 = false;
		var choose_id_stage_3 = false;
		var choose_id_normal = false;

		var allow_id_pseudo = false;
		var allow_id_fossil = false;
		var allow_id_starter = false;
		var allow_id_baby = false;

		//————————————————————————————————————————————————————————————————————————————————————————————————————
		if (random_card && !enemy_randomizer)
		{
			// [weight, ref_card_group, free] Determine event odds.
			var groups = [
				[ob_main.event_card_weight[event_card_group_secret], event_card_group_secret],
				[ob_main.event_card_weight[event_card_group_environment], event_card_group_environment],
				[ob_main.event_card_weight[event_card_group_enigma], event_card_group_enigma],
				[ob_main.event_card_weight[event_card_group_stage_2], event_card_group_stage_2],
				[ob_main.event_card_weight[event_card_group_stage_3], event_card_group_stage_3],
				[ob_main.event_card_weight[event_card_group_common], event_card_group_common]
			];
		
			var selected_card_group = sc_determine_card_group(groups);
			
			if(ob_main.latest_zone <= 0 && (selected_card_group != event_card_group_environment || selected_card_group != event_card_group_common)){
				selected_card_group = event_card_group_common;
			}
			
			switch(selected_card_group){
				case event_card_group_secret:
			        card_id = irandom_range(1, secret_cards_total) + 2000;
				break;
				case event_card_group_environment:
			        card_id = irandom_range(1, environment_cards_total) + 2500;
				break;
				case event_card_group_enigma:
		            choose_id_enigma = true;
				break;
				case event_card_group_stage_2:
		            choose_id_stage_2 = true;
				break;
				case event_card_group_stage_3:
		            choose_id_stage_3 = true;
				break;
				case event_card_group_common:
		            choose_id_normal = true;
				break;
				default:
				break;
			}
			
			if (card_id == -1){
		        card_id = irandom_range(1, normal_poke_id_max);
			}
		    card_innate = 1;
			
			if (selected_card_group != event_card_group_secret && selected_card_group != event_card_group_environment) {
		        allow_id_pseudo = choose(true, false);
		        allow_id_fossil = choose(true, false);
		        allow_id_starter = choose(true, false, false, false);
		        allow_id_baby = choose(true, false, false, false);
			}
    
			card_level = irandom_range(ob_main.card_level_spawn_min, ob_main.card_level_spawn_limit);
		    card_form_value = irandom(999);
		    card_glyph_a = -1;
		    card_glyph_b = -1;
		    card_glyph_c = -1;
		}

		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else if (random_card && enemy_randomizer)
		{
		    if (random_group_chance < 500)
		    {
		        // 5% environment card
		        card_id = irandom_range(1, environment_cards_total) + 2500;
		        card_innate = 1;
		    }
		    else
		    {
		        card_id = irandom_range(1, normal_poke_id_max);
        
		        //
		        if (reference_id.create_card_innate == -1)
		        {
		            var card_enemy_innate_value = irandom(999);
		            if (ob_main.playing_gym == true || ob_main.playing_elite == true || ob_main.playing_champion == true)
		            {
		                if (card_enemy_innate_value < (10 + ob_main.area_zone * 10))
		                {
		                    card_innate = innate_max;
		                } // 1% - 9%
		                else if (card_enemy_innate_value < (40 + ob_main.area_zone * 20))
		                {
		                    card_innate = 3;
		                } // 3% - 11%
		                else if (card_enemy_innate_value < (100 + ob_main.area_zone * 30))
		                {
		                    card_innate = 2;
		                } // 6% - 14%
		                else
		                {
		                    card_innate = 1;
		                } // 90% - 66%
		            }
		            else
		            {
		                if (card_enemy_innate_value < (10 + ob_main.area_zone * 5))
		                {
		                    card_innate = innate_max;
		                } // 1% - 5%
		                else if (card_enemy_innate_value < (40 + ob_main.area_zone * 10))
		                {
		                    card_innate = 3;
		                } // 3% - 7%
		                else if (card_enemy_innate_value < (100 + ob_main.area_zone * 15))
		                {
		                    card_innate = 2;
		                } // 6% - 10%
		                else
		                {
		                    card_innate = 1;
		                } // 90% - 78%
		            }
		        }
		        else
		        {
		            card_innate = reference_id.create_card_innate;
		        }
        
		        //
		        var random_id_chance = irandom(99);
		        if (random_id_chance < 90)
		        {
		            allow_id_pseudo = true;
		        } // 90% pseudo allowed
		        var random_id_chance = irandom(99);
		        if (random_id_chance < 75)
		        {
		            allow_id_fossil = true;
		        } // 75% fossil allowed
		        var random_id_chance = irandom(99);
		        if (random_id_chance < 75)
		        {
		            allow_id_starter = true;
		        } // 75% starter allowed
		        var random_id_chance = irandom(99);
		        if (random_id_chance < 50)
		        {
		            allow_id_baby = true;
		        } // 50% baby allowed
		    }
    
		    //
		    if (reference_id.create_card_level == -1)
		    {
		        do
		        {
		            var accepted_level = true;
		            card_level = irandom_range(ob_main.card_level_enemy_min, ob_main.card_level_enemy_limit);
            
		            //
		            if (card_level == ob_main.card_level_enemy_limit && ob_main.zone_first_lap == true &&
		                ob_main.playing_gym == false && ob_main.playing_elite == false && ob_main.playing_champion == false)
		            {
		                accepted_level = choose(true, false, false); // 2/3 chance to re-roll
		            }
		        } until (accepted_level == true)
		    }
		    else
		    {
		        card_level = reference_id.create_card_level;
		    }
		    card_glyph_a = reference_id.create_card_glyph_a;
		    card_glyph_b = reference_id.create_card_glyph_b;
		    card_glyph_c = reference_id.create_card_glyph_c;
		    if (reference_id.create_card_form_value == -1)
		    {
		        card_form_value = irandom(999);
		    }
		    else
		    {
		        card_form_value = reference_id.create_card_form_value;
		    }
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else {
			card_level = reference_id.create_card_level;
			card_glyph_a = reference_id.create_card_glyph_a;
			card_glyph_b = reference_id.create_card_glyph_b;
			card_glyph_c = reference_id.create_card_glyph_c;
			card_innate = reference_id.create_card_innate;
			card_form_value = reference_id.create_card_form_value;
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		sc_pokelist();
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		// SAVE COMPATIBILITY (v1.3.0.1) + (v1.5.0.0)
		if (!random_card)
		{
		    if ((card_id == 109 || card_id == 110) && card_glyph_a >= glyph_common_amount)
		    {
		        card_glyph_a = ref_glyph_mist;
		    } // koffing, weezing
		    else if (card_id == 132 && card_glyph_a != ref_glyph_transform)
		    {
		        card_glyph_a = ref_glyph_transform;
		    } // ditto
		    else if (card_id == 235 && card_glyph_a != ref_glyph_sketch)
		    {
		        card_glyph_a = ref_glyph_sketch;
		    } // smeargle
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		if (random_card || card_glyph_a == -2 || card_glyph_b == -2 || card_glyph_c == -2)
		{
			// in case they were -2, which is used for semi-random enemy cards
		    if (card_glyph_a == -2)
		    {
		        card_glyph_a = -1;
		    }
		    if (card_glyph_b == -2)
		    {
		        card_glyph_b = -1;
		    }
		    if (card_glyph_c == -2)
		    {
		        card_glyph_c = -1;
		    }
    
		    if (card_id == 109 || card_id == 110)
		    {
		        card_glyph_a = choose(-1, -1, ref_glyph_mist);
		    } // koffing, weezing
		    else if (card_id == 132)
		    {
		        card_glyph_a = ref_glyph_transform;
		    } // ditto
		    else if (card_id == 235)
		    {
		        card_glyph_a = ref_glyph_sketch;
		    } // smeargle
    
		    //
		    if (enemy_randomizer == false)
		    {
		        var card_glyph_chance = irandom(999), card_glyph_total = 0;
		        if (card_glyph_chance < 5)
		        {
		            card_glyph_total = 2;
		        } // 0.5%
		        else if (card_glyph_chance < 25)
		        {
		            card_glyph_total = 1;
		        } // 2%
        
		        //
		        if (card_glyph_total >= 1 && card_glyph_a == -1)
		        {
		            card_glyph_a = sc_glyph_random(card_environment);
		        }
		        if (card_glyph_total >= 2 && card_glyph_b == -1)
		        {
		            do
		            {
		                card_glyph_b = sc_glyph_random(card_environment);
		            } until (card_glyph_b != card_glyph_a)
		        }
		    }
		    else
		    {
		        var card_glyph_chance = irandom(9999), card_glyph_total = 0;
		        if (card_environment == true)
		        {
		            var card_glyph_chance_limit = 2500 + 625 * ob_main.area_zone;
		        } // 25%, 31.25%, 37.5%, 43.75%, 50%, 56.25%, 62.5%, 68.75%, (75%)
		        else if (ob_main.playing_gym == true || ob_main.playing_elite == true || ob_main.playing_champion == true)
		        {
		            var card_glyph_chance_limit = 1500 + 225 * ob_main.area_zone;
		        } // 15%, 17.25%, 19.5%, 21.75%, 24%, 26.25%, 28.5%, 30.75%, (33%)
		        else
		        {
		            var card_glyph_chance_limit = 980 + 190 * ob_main.area_zone;
		        } // 9.8%, 11.7%, 13.6%, 15.5%, 17.4%, 19.3%, 21.2%, 23.1%, (25%)
        
		        //
		        if (card_glyph_chance < card_glyph_chance_limit)
		        {
		            card_glyph_chance = irandom(99);
		            if (card_glyph_chance < 20)
		            {
		                card_glyph_total = 3;
		            } // 20%
		            else if (card_glyph_chance < 50)
		            {
		                card_glyph_total = 2;
		            } // 30%
		            else if (card_glyph_chance < 100)
		            {
		                card_glyph_total = 1;
		            } // 50%
            
		            //
		            if (card_glyph_total >= 1 && card_glyph_a == -1)
		            {
		                card_glyph_a = sc_glyph_random(card_environment);
		            }
		            if (card_glyph_total >= 2 && card_glyph_b == -1)
		            {
		                do
		                {
		                    card_glyph_b = sc_glyph_random(card_environment);
		                } until (card_glyph_b != card_glyph_a)
		            }
		            if (card_glyph_total == 3 && card_glyph_c == -1)
		            {
		                do
		                {
		                    card_glyph_c = sc_glyph_random(card_environment);
		                } until (card_glyph_c != card_glyph_a && card_glyph_c != card_glyph_b)
		            }
		        }
		    }
		}

		//————————————————————————————————————————————————————————————————————————————————————————————————————
		var card_rarity = round(sqrt(card_base_hp + card_base_atk + card_base_def) * 10 - 100);
		//
		if (random_card)
		{
		    var card_rarity_chance = 0, card_rarity_soft_min = 0, card_rarity_soft_max = -1;
    
		    if (!enemy_randomizer)
		    {
		        var card_rarity_chance_max = 145;
		        card_rarity_chance = irandom(card_rarity_chance_max - 1) + 1;
		    }
		    else
		    {
		        if (card_environment)
		        {
		            var card_rarity_chance_max = 145;
		            card_rarity_chance = irandom(card_rarity_chance_max - 1) + 1;
		        }
		        else if (ob_main.playing_gym || ob_main.playing_elite || ob_main.playing_champion)
		        {
		            var card_rarity_chance_max = 220; // about +50% to increase chance for stronger pokemon
		            card_rarity_soft_min = 42 + ob_main.area_zone * 4; // 42-74, about 200-300 base stat total (201.64-302.76)
		            if (ob_main.area_zone == 0)
		            {
		                card_rarity_soft_max = 81;
		            } // about 330 base stat total (327.61)
		            card_rarity_chance = irandom(card_rarity_chance_max - 1) + 1;
		        }
		        else
		        {
		            var card_rarity_chance_max = 180; // about +25% to increase chance for stronger pokemon
		            var card_rarity_irandom_max = 60 + ob_main.latest_zone * 45; // 60 (above lowest normal-type and dragon-type), 105, 150 (145), 179
		            if (card_rarity_irandom_max > card_rarity_chance_max - 1)
		            {
		                card_rarity_irandom_max = card_rarity_chance_max - 1;
		            }
		            card_rarity_chance = irandom(card_rarity_irandom_max) + 1;
		        }
		    }
			//
		    var card_rarity_check = false;
		    if (card_rarity_chance > card_rarity || card_rarity_chance == card_rarity_chance_max)
		    {
		        card_rarity_check = true;
        
		        //
		        if (!enemy_randomizer)
		        {
		            if (!card_enigma && choose_id_enigma)
		            {
		                card_rarity_check = false;
		            }
		            else if (card_stage != 2 && choose_id_stage_2)
		            {
		                card_rarity_check = false;
		            }
		            else if (card_stage != 3 && choose_id_stage_3)
		            {
		                card_rarity_check = false;
		            }
		            else if ((card_stage > 1 || card_enigma) && choose_id_normal)
		            {
		                card_rarity_check = false;
		            }
		        }
		        else
		        {
		            if (card_enigma)
		            {
		                card_rarity_check = false;
		            }
		        }

				if (card_pseudo && !allow_id_pseudo)
		        {
		            card_rarity_check = false;
		        }
		        if (card_fossil && !allow_id_fossil)
		        {
		            card_rarity_check = false;
		        }
		        if (card_starter && !allow_id_starter)
		        {
		            card_rarity_check = false;
		        }
		        if (card_stage == 0 && !allow_id_baby)
		        {
		            card_rarity_check = false;
		        }
				
		        if (card_rarity_check)
		        {
		            if (card_rarity < card_rarity_soft_min)
		            {
		                card_rarity_check = choose(false, false, false, true);
		            } // 25%
		        }
				
		        if (card_rarity_check)
		        {
		            if (card_rarity_soft_max > -1 && card_rarity > card_rarity_soft_max)
		            {
		                card_rarity_check = choose(false, false, false, true);
		            } // 25%
		        }
				
		        if (card_rarity_check)
		        {
		            card_rarity_chance = irandom(34) + 1; // level 10: 30 (max) + 5 (higher chances in general)
		            if (card_rarity_chance >= round(sqrt(card_level - 1) * 10))
		            {
		                card_rarity_check = true;
		            }
		            else
		            {
		                card_rarity_check = false;
		            }
		        }
				
		        if (card_rarity_check && enemy_randomizer && !card_environment)
		        {
		            card_rarity_check = false;
					
		            for (var i = 0; i <= 17; i++)
		            {
		                var type_condition_chance = irandom(99);
		                if (type_condition_chance < ob_control.enemy_type_chance[i] && (card_type_a == i || card_type_b == i))
		                {
		                    card_rarity_check = true;
		                }
		            }
		        }
		    }
		}
	} until (!random_card || (card_rarity_check && card_name != ""));
	
	sc_card_level_stats_all(true,true);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if (card_cat == 1)
{
    card_id = reference_id.create_card_id;
    if (card_id == -1)
    {
        var random_card = true;
    }
    else
    {
        var random_card = false;
    }
    
    //
    if (random_card)
    {
        var card_berry_chance = irandom(99);
        if (card_berry_chance < 85)
        {
            card_id = choose(3000, 3001, 3002);
        }
        else
        {
            card_id = 3003;
        } // 15% (keep in mind number of extra enigma berries in enemy decks in sc_enemy_berry_deck)
    }
    
    //
    switch (card_id)
    {
        case 3000:
            card_name = "Oran Berry";
            break;
        case 3001:
            card_name = "Leppa Berry";
            break;
        case 3002:
            card_name = "Lum Berry";
            break;
        case 3003:
            card_name = "Enigma Berry";
            break;
    }
}