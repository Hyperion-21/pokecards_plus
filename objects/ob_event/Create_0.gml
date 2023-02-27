depth = -1000;

event_kind = ob_main.event_transition;
tooltip_text = "";
tooltip_lines = 0;
show_deck = false;
apply_event = false;
event_applied = false;
event_cancelled = false;
card_gen = -1;
used = false;


levelup_new_hp = 0;
levelup_new_atk = 0;
levelup_new_def = 0;

// Count berries (same as ob_card) 
for (var i = 0; i <= 3; i++)
{
    deck_berry_total[i] = 0;
}

for (var i = 0; i < ob_main.berrydeck_total; i++)
{
    deck_berry_total[ob_main.berry_card_id[i] - 3000]++;
}

switch (event_kind){
	case ref_event_cardpack:
		card_prize = 5;
		var main_amount = card_prize, berry_amount = round(main_amount/5);

		var holoset = false;
		var i = 0;
		repeat (card_prize)
		{
		    create_card_id = -1;
			card_gen = -1;
			if holoset = false
			{
				create_card_cat = 0;
				var holo =  instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
				with (holo)
				{
					card_holo = true;
				}
					holoset = true;
			}
			else {
			if (main_amount > 0 && berry_amount > 0)
		    {
		        create_card_cat = choose(0, 1);
		    }
		    else if (main_amount > 0 && berry_amount == 0)
		    {
		        create_card_cat = 0;
		    }
		    else if (main_amount == 0 && berry_amount > 0)
		    {
		        create_card_cat = 1;
		    }
		    if (create_card_cat == 0)
		    {
		        main_amount--;
		    }
		    else
		    {
		        berry_amount--;
		    }
				instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
			}
		    i++;
		}
		button_create = instance_create_layer(screen_main_x + cam_w - 24, screen_main_y + cam_h - 24, "instances", ob_button_16x16);
		button_create.button_id = 2;

	break;
	case ref_event_cardpack_1:
		card_prize = 5;
		var main_amount = card_prize;
		var holoset = false;
		var i = 0;
		repeat (card_prize)
		{
		    create_card_id = -1;
			create_card_cat = 0;
			card_gen = 1;
			if holoset = false
			{
			var holo =   instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
				with (holo)
				{
					card_holo = true;
				}
					holoset = true;
			}
			else
			{
				instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
			}
		    i++;
		}
		button_create = instance_create_layer(screen_main_x + cam_w - 24, screen_main_y + cam_h - 24, "instances", ob_button_16x16);
		button_create.button_id = 2;
	break;
	case ref_event_cardpack_2:
		card_prize = 5;
		var main_amount = card_prize;
		var holoset = false;
		var i = 0;
		repeat (card_prize)
		{
		    create_card_id = -1;
			create_card_cat = 0;
			card_gen = 2;
			if holoset = false
			{
			var holo =   instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
				with (holo)
				{
					card_holo = true;
				}
					holoset = true;
			}
			else
			{
				instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
			}
		    i++;
		}
		button_create = instance_create_layer(screen_main_x + cam_w - 24, screen_main_y + cam_h - 24, "instances", ob_button_16x16);
		button_create.button_id = 2;
	break;
	case ref_event_cardpack_3:
		card_prize = 5;
		var main_amount = card_prize;
		var holoset = false;
		var i = 0;
		repeat (card_prize)
		{
		    create_card_id = -1;
			create_card_cat = 0;
			card_gen = 3;
			if holoset = false
			{
			var holo =   instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
				with (holo)
				{
					card_holo = true;
				}
					holoset = true;
			}
			else
			{
				instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
			}
		    i++;
		}
		button_create = instance_create_layer(screen_main_x + cam_w - 24, screen_main_y + cam_h - 24, "instances", ob_button_16x16);
		button_create.button_id = 2;
	break;
	case ref_event_cardpack_4:
		card_prize = 5;
		var main_amount = card_prize;
		var holoset = false;
		var i = 0;
		repeat (card_prize)
		{
		    create_card_id = -1;
			create_card_cat = 0;
			card_gen = 4;
			if holoset = false
			{
			var holo =   instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
				with (holo)
				{
					card_holo = true;
				}
					holoset = true;
			}
			else
			{
				instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
			}
		    i++;
		}
		button_create = instance_create_layer(screen_main_x + cam_w - 24, screen_main_y + cam_h - 24, "instances", ob_button_16x16);
		button_create.button_id = 2;
	break;
	case ref_event_cardpack_5:
		card_prize = 5;
		var main_amount = card_prize;
		var holoset = false;
		var i = 0;
		repeat (card_prize)
		{
		    create_card_id = -1;
			create_card_cat = 0;
			card_gen = 5;
			if holoset = false
			{
			var holo =   instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
				with (holo)
				{
					card_holo = true;
				}
					holoset = true;
			}
			else
			{
				instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
			}
		    i++;
		}
		button_create = instance_create_layer(screen_main_x + cam_w - 24, screen_main_y + cam_h - 24, "instances", ob_button_16x16);
		button_create.button_id = 2;
	break;
	case ref_event_cardpack_6:
		card_prize = 5;
		var main_amount = card_prize;
		var holoset = false;
		var i = 0;
		repeat (card_prize)
		{
		    create_card_id = -1;
			create_card_cat = 0;
			card_gen = 6;
			if holoset = false
			{
			var holo =   instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
				with (holo)
				{
					card_holo = true;
				}
					holoset = true;
			}
			else
			{
				instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
			}
		    i++;
		}
		button_create = instance_create_layer(screen_main_x + cam_w - 24, screen_main_y + cam_h - 24, "instances", ob_button_16x16);
		button_create.button_id = 2;
	break;
	case ref_event_cardpack_7:
		card_prize = 5;
		var main_amount = card_prize;
		var holoset = false;
		var i = 0;
		repeat (card_prize)
		{
		    create_card_id = -1;
			create_card_cat = 0;
			card_gen = 7;
			if holoset = false
			{
			var holo =   instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
				with (holo)
				{
					card_holo = true;
				}
					holoset = true;
			}
			else
			{
				instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
			}
		    i++;
		}
		button_create = instance_create_layer(screen_main_x + cam_w - 24, screen_main_y + cam_h - 24, "instances", ob_button_16x16);
		button_create.button_id = 2;
	break;
	case ref_event_cardpack_8:
		card_prize = 5;
		var main_amount = card_prize;
		var holoset = false;
		var i = 0;
		repeat (card_prize)
		{
		    create_card_id = -1;
			create_card_cat = 0;
			card_gen = 8;
			if holoset = false
			{
			var holo =   instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
				with (holo)
				{
					card_holo = true;
				}
					holoset = true;
			}
			else
			{
				instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
			}
		    i++;
		}
		button_create = instance_create_layer(screen_main_x + cam_w - 24, screen_main_y + cam_h - 24, "instances", ob_button_16x16);
		button_create.button_id = 2;
	break;
	case ref_event_cardpack_9:
		card_prize = 5;
		var main_amount = card_prize;
		var holoset = false;
		var i = 0;
		repeat (card_prize)
		{
		    create_card_id = -1;
			create_card_cat = 0;
			card_gen = 9;

			if holoset = false
			{
			var holo =   instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
				with (holo)
				{
					card_holo = true;
				}
					holoset = true;
			}
			else
			{
				instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
			}
		    i++;
		}
		button_create = instance_create_layer(screen_main_x + cam_w - 24, screen_main_y + cam_h - 24, "instances", ob_button_16x16);
		button_create.button_id = 2;
	break;
	case ref_event_berry:
		card_prize = 4;
		var min_oran = 1, min_leppa = 1, min_lum = 1;

		var i = 0;
		repeat (card_prize)
		{
		    create_card_cat = 1;
		    if (min_oran > 0 && min_leppa > 0 && min_lum > 0)
		    {
		        create_card_id = choose(3000, 3001, 3002);
		    }
		    else if (min_oran > 0 && min_leppa > 0)
		    {
		        create_card_id = choose(3000, 3001);
		    }
		    else if (min_oran > 0 && min_lum > 0)
		    {
		        create_card_id = choose(3000, 3002);
		    }
		    else if (min_leppa > 0 && min_lum > 0)
		    {
		        create_card_id = choose(3001, 3002);
		    }
		    else if (min_oran > 0)
		    {
		        create_card_id = 3000;
		    }
		    else if (min_leppa > 0)
		    {
		        create_card_id = 3001;
		    }
		    else if (min_lum > 0)
		    {
		        create_card_id = 3002;
		    }
		    else
		    {
		        create_card_id = -1;
		    }
    
		    if (create_card_id == 3000)
		    {
		        min_oran--;
		    }
		    else if (create_card_id == 3001)
		    {
		        min_leppa--;
		    }
		    else if (create_card_id == 3002)
		    {
		        min_lum--;
		    }
    
		    instance_create_layer(screen_main_x + 118 + (73 * i), screen_main_y + 104, "instances", ob_card);
		    i++;
		}

		button_create = instance_create_layer(screen_main_x + cam_w - 24, screen_main_y + cam_h - 24, "instances", ob_button_16x16);
		button_create.button_id = 2;
	break;
	
	case ref_event_freecard:
		card_prize = 1;
		var i = 0;
		repeat (5)
		{
		    create_card_cat = 0;
		    create_card_id = -1;
			card_gen = -1;
    
		    //
		    instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
		    i++;
		} break;
	case ref_event_holo_freecard:
		card_prize = 1;
		var i = 0;
		repeat (5)
		{
		    create_card_cat = 0;
		    create_card_id = -1;
			card_gen = -1;
    
		    //
		    var holo = instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
			with (holo)
				{
					card_holo = true;
				}
		    i++;
		}
	break;
		case ref_event_delta:
		card_prize = 1;
		var i = 0;
		repeat (5)
		{
		    create_card_cat = 0;
		    create_card_id = -1;
			card_gen = -1;
    
		    //
		    var delta = instance_create_layer(screen_main_x + 83 + (72 * i), screen_main_y + 104, "instances", ob_card);
			with (delta)
				{
					card_delta = true;
					card_delta_type = -1;
					sc_determine_card_delta();
					sc_card_level_stats_all(false,true);
				}
		    i++;
		}
	break;
	
	case ref_event_grass:
	case ref_event_fire:
	case ref_event_water:
		//specific pokemon ids are checked manually when creating deck in tutorial
		//exact amount of cards and berries is also checked manually when entering tutorial
	
		card_prize = 10;
		var creatures_num = round(card_prize / 2);
		var berries_num = card_prize - creatures_num;
		var i = 0;


		var card_pool_gen_1_2
		var card_pool_gen_3_4
		var card_pool_gen_5_6
		var card_pool_gen_7_8

		var fire = false;
		var grass = false;
		var water = false;
		
		
		switch (event_kind){
			case ref_event_grass: 
				card_pool_gen_1_2 = [[10, 001],[10, 152],[10, 906]];
				card_pool_gen_3_4 = [[10, 252],[10, 387]];		
				card_pool_gen_5_6 = [[10, 495],[10, 650]];
				card_pool_gen_7_8 = [[10, 722],[10, 810]];
				var grass = true;
			break;
			case ref_event_fire: 
				card_pool_gen_1_2 = [[10, 004],[10, 155],[10, 909]];
				card_pool_gen_3_4 = [[10, 255],[10, 390]];		
				card_pool_gen_5_6 = [[10, 498],[10, 653]];
				card_pool_gen_7_8 = [[10, 725],[10, 813]];
				var fire = true;
			break;
			case ref_event_water: 
				card_pool_gen_1_2 = [[10, 007],[10, 158],[10, 912]];
				card_pool_gen_3_4 = [[10, 258],[10, 393]];		
				card_pool_gen_5_6 = [[10, 501],[10, 656]];
				card_pool_gen_7_8 = [[10, 728],[10, 816]];
				var water = true;
			break;
		}
		//
		// IF TESTING SET TRUE
		// with IDE mode(run from gamemaker) only failsafe if left enabled
		test = false;
		if(RUN_FROM_IDE and test){
			card_pool_gen_1_2 = [[10, 2001]];		
			card_pool_gen_3_4 = [[10, 2001]];		
			card_pool_gen_5_6 = [[10, 2001]];
			card_pool_gen_7_8 = [[10, 2001]];
		}
		//
		//
		var card_pool_compiled = [card_pool_gen_1_2, card_pool_gen_3_4, card_pool_gen_5_6, card_pool_gen_7_8];
		
		create_card_cat=0;
		repeat (creatures_num) {
			if i != 5
			{ create_card_id = sc_determine_starter_card(i, card_pool_compiled); 
				
					create_card_level=1;
					create_card_glyph_a=-1;
					create_card_glyph_b=-1;
					create_card_glyph_c=-1;
					create_card_innate=1;
					create_card_shiny=-1;
					create_card_holo=-1;
					create_card_delta=false;
					create_card_delta_type=-1;
					create_card_type_a=-1;
					create_card_type_b=-1;
					// Leave forms low so no one gets alolan rattata. (requires leppa berries due to dark typing.)
					create_card_form_value=0;
				var card_x=screen_main_x+83+(72*i), card_y=screen_main_y+104-47; 
			
				instance_create_layer(card_x,card_y,"instances",ob_card);	
				i++;
			} 

		}
		i = 0;
		create_card_cat=1;
		repeat (berries_num){
			// Only creating Oran berries for starters.
			
			if grass == true
			{
				create_card_id=3002;
			}
			else if fire == true
			{
				create_card_id=3001;
			}
			else if water == true
			{
				create_card_id=3000;
			}
		
			var card_x=screen_main_x+83+(72*(i)), card_y=screen_main_y+104+47;
		
			instance_create_layer(card_x,card_y,"instances",ob_card);		
			i++;
		}
	
		button_create=instance_create_layer(screen_main_x+cam_w-24,screen_main_y+cam_h-24,"instances",ob_button_16x16);
		button_create.button_id=2;
	break;
	
	case ref_event_levelup:
	case ref_event_evolution:
	case ref_event_glyph:
	case ref_event_tribute:
	case ref_event_campfire:
	case ref_event_candy:
	case ref_event_sacrifice:
	case ref_event_megaevolve:
	case ref_event_changeform:
	case ref_event_deglyph:
		show_deck = true;

		inventory_x = 4;
		inventory_y = 4;
		hold_inventory_bar = false;

		deck_x = 4;
		deck_y = 204;
		hold_deck_bar = false;

		if (event_kind == ref_event_glyph)
		{
		    glyph_add_id = ob_main.current_glyph_add;
		}

		evolution_retry = false;
		evolution_position = 0;
		// 5am spatti remove and replace with better xD
		count = 0;
		//
		for (var i = 0; i < 8; i++)
		{
		    evo_list[i] = -1;
		}

		card_event_inventory_total = 0;
		card_event_total = 0;
		var i = 0;
		repeat (ob_main.maindeck_total)
		{
		    if (ob_main.serial_card_indeck[ob_main.main_card_serial[i]][0] == true)
		    {
		        card_event_total++;
		    }
		    else
		    {
		        card_event_inventory_total++;
		    }
		    i++;
		}

		var i = 0, ii = 0, iii = 0;
		repeat (ob_main.maindeck_total)
		{
		    create_card_cat = 0;
		    create_card_id = ob_main.main_card_id[i];
		    create_card_level = ob_main.main_card_level[i];
		    create_card_glyph_a = ob_main.main_card_glyph_a[i];
		    create_card_glyph_b = ob_main.main_card_glyph_b[i];
		    create_card_glyph_c = ob_main.main_card_glyph_c[i];
		    create_card_innate = ob_main.main_card_innate[i];
			create_card_shiny = ob_main.main_card_shiny[i];
			create_card_holo = ob_main.main_card_holo[i];
			create_card_delta = ob_main.main_card_delta[i];
			create_card_delta_type = ob_main.main_card_delta_type[i];
		    create_card_type_a = ob_main.main_card_type_a[i];
		    create_card_type_b = ob_main.main_card_type_b[i];
		    create_card_form_value = ob_main.main_card_form_value[i];
    
		    if (ob_main.serial_card_indeck[ob_main.main_card_serial[i]][0] == true)
		    {
		        card_event[ii] = instance_create_layer(x, y, "instances", ob_card);
		        card_event[ii].num_in_all = i;
        
		        ii++;
		    }
		    else
		    {
		        card_inventory[iii] = instance_create_layer(x, y, "instances", ob_card);
		        card_inventory[iii].num_in_all = i;
        
		        iii++;
		    }
		    i++;
		}

		var spacing = 71;
		if (event_kind == ref_event_tribute || event_kind == ref_event_sacrifice)
		{
		    var spacing = 142 - 35;
		    event_space_total = 2;
		    for (var i = 0; i < event_space_total; i++)
		    {
		        event_space_id[i] = instance_create_layer(screen_main_x + 227 - 35 + 71 * i, screen_main_y + 109, "instances", ob_card_space);
		    }
		}
		else
		{
		    var spacing = 71;
		    event_space_total = 1;
		    for (var i = 0; i < event_space_total; i++)
		    {
		        event_space_id[i] = instance_create_layer(screen_main_x + 227, screen_main_y + 109, "instances", ob_card_space);
		    }
		}

		var i = 0, button_create;
		repeat (2)
		{
		    button_create = instance_create_layer(screen_main_x + 227 + spacing, screen_main_y + 117 + 42 * i, "instances", ob_button_31x24);
		    button_create.button_id = i;
		    i++;
		}
	break;
}