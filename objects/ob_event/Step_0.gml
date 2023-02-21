// Show the deck and inventory if required for this event.
if (show_deck)
{
    var i = 0;
    repeat (card_event_total)
    {
		if (!variable_instance_exists(card_event[i], "card_played")) {
			i++;
			continue;
		}
		
        if (card_event[i].card_played == false)
        {
            card_event[i].potential_x = screen_main_x + deck_x + (60 * i);
            card_event[i].potential_y = screen_main_y + deck_y;
        }
        i++;
    }
    i = 0;
    repeat (card_event_inventory_total)
    {
		if (!variable_instance_exists(card_inventory[i], "card_played")) {
			i++;
			continue;
		}

		
        if (card_inventory[i].card_played == false)
        {
            card_inventory[i].potential_x = screen_main_x + inventory_x + (60 * i);
            card_inventory[i].potential_y = screen_main_y + inventory_y;
        }
        i++;
    }
    
    if (mouse_y >= screen_main_y + inventory_y && mouse_y < screen_main_y + inventory_y + 80 + 8 && ob_main.cursor_hide == false)
    {
        if (mouse_wheel_up())
        {
            inventory_x += 32;
            if (inventory_x > 4)
            {
                inventory_x = 4;
            }
        }
        else if (mouse_wheel_down() && cam_w < (card_event_inventory_total * 60))
        {
            inventory_x -= 32;
            if (inventory_x < cam_w - (card_event_inventory_total * 60) - 1)
            {
                inventory_x = cam_w - (card_event_inventory_total * 60) - 1;
            }
        }
    }
    else if (mouse_y >= screen_main_y + deck_y - 8 && mouse_y < screen_main_y + deck_y + 80 && ob_main.cursor_hide == false)
    {
        if (mouse_wheel_up())
        {
            deck_x += 32;
            if (deck_x > 4)
            {
                deck_x = 4;
            }
        }
        else if (mouse_wheel_down() && cam_w < (card_event_total * 60))
        {
            deck_x -= 32;
            if (deck_x < cam_w - (card_event_total * 60) - 1)
            {
                deck_x = cam_w - (card_event_total * 60) - 1;
            }
        }
    }
        
    if (mouse_check_button(mb_left) && ob_main.cursor_hide == false && cam_w < (card_event_inventory_total * 60) &&
        ((mouse_y >= screen_main_y + inventory_y + 80 && mouse_y < screen_main_y + inventory_y + 88) || hold_inventory_bar == true))
    {
        var mouse_pos = mouse_x - screen_main_x - 8 - 4;
        var mouse_pos_max = cam_w - 16 - 10;
        var inventory_pos_max = cam_w - (card_event_inventory_total * 60) - 5;
        
        var inventory_x_percent = mouse_pos * 100 / mouse_pos_max;
        inventory_x = round(inventory_x_percent * inventory_pos_max / 100) + 4;
        if (inventory_x > 4)
        {
            inventory_x = 4;
        }
        else if (inventory_x < cam_w - (card_event_inventory_total * 60) - 1)
        {
            inventory_x = cam_w - (card_event_inventory_total * 60) - 1;
        }
        hold_inventory_bar = true;
    }
    else if (mouse_check_button(mb_left) && ob_main.cursor_hide == false && cam_w < (card_event_total * 60) &&
        ((mouse_y >= screen_main_y + deck_y - 10 && mouse_y < screen_main_y + deck_y - 2) || hold_deck_bar == true))
    {
        var mouse_pos = mouse_x - screen_main_x - 8 - 4;
        var mouse_pos_max = cam_w - 16 - 10;
        var deck_pos_max = cam_w - (card_event_total * 60) - 5;
        
        var deck_x_percent = mouse_pos * 100 / mouse_pos_max;
        deck_x = round(deck_x_percent * deck_pos_max / 100) + 4;
        if (deck_x > 4)
        {
            deck_x = 4;
        }
        else if (deck_x < cam_w - (card_event_total * 60) - 1)
        {
            deck_x = cam_w - (card_event_total * 60) - 1;
        }
        hold_deck_bar = true;
    }
    else if (!mouse_check_button(mb_left) || ob_main.cursor_hide == true)
    {
        hold_inventory_bar = false;
        hold_deck_bar = false;
    }
    
    // when moving last cards in list
    if (cam_w < (card_event_total * 60))
    {
        if (deck_x < cam_w - (card_event_total * 60) - 1)
        {
            deck_x = cam_w - (card_event_total * 60) - 1;
        }
    }
    else
    {
        deck_x = 4;
    }
}
else // If we are not showing the deck, we are dealing with a card event or battle.
{
    if (card_prize == 0)
    {
        ob_main.event_transition = event_kind;
    }
}

//————————————————————————————————————————————————————————————————————————————————————————————————————
if (apply_event) {
	var i = 0, card_id_in_space;
	repeat (event_space_total)
	{
	    card_id_in_space[i] = -1;
	    if (event_space_id[i].occupy_id != -1)
	    {
	        var ii = 0;
        
	        if (event_space_id_deck[i])
	        {
	            repeat (card_event_total)
	            {
	                if (card_event[ii] == event_space_id[i].occupy_id)
	                {
	                    card_id_in_space[i] = event_space_id[i].occupy_id;
	                }
	                ii++;
	            }
	        }
	        else
	        {
	            repeat (card_event_inventory_total)
	            {
	                if (card_inventory[ii] == event_space_id[i].occupy_id)
	                {
	                    card_id_in_space[i] = event_space_id[i].occupy_id;
	                }
	                ii++;
	            }
	        }
	    }
	    i++;
	}
		
	switch (event_kind){
		case ref_event_levelup:
			if (card_id_in_space[0] != -1)
			{
			    if (card_id_in_space[0].card_level < ob_main.card_level_player_limit && card_id_in_space[0].card_innate > 0 &&
			        ob_main.money - ob_main.event_cost_standby >= ob_main.event_cost_standby_levelup)
			    {
			        card_id_in_space[0].card_level++;
			        sc_card_effect(event_space_id[0].x, event_space_id[0].y, 0, false, true);
			        with (card_id_in_space[0])
			        {
			            sc_card_level_stats_all(true, true);
			        }
        
			        event_applied = true;
			        ob_main.event_cost_standby += ob_main.event_cost_standby_levelup;
			        sc_playsound(sn_upgrade, 50, false, false);
			        ob_main.main_card_level[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_level;
			    }
				else
				{
					sc_playsound(sn_hurt,50,false,false);
				}
			}
		break;
		case ref_event_evolution:
			if (card_id_in_space[0] != -1)
			{
				//var i = 0;
				//for (var i=0; i<ob_main.maindeck_total; i++;) {
					
					//if (ob_main.main_card_id[i] = card_id_in_space[0].card_id)
					//{
						//duplicate += 1;
					//} //  || (ob_main.main_card_id[i] = card_id_in_space[0].card_evo[0])
				//}
							
					//ob_main.serial_card_indeck[ob_main.main_card_serial[i]][0]
			    if ( evo_list[0] != -1 && evo_list[0] <= normal_poke_id_max && card_id_in_space[0].card_innate > 0 &&
			        (ob_main.money - ob_main.event_cost_standby >= ob_main.event_cost[ref_event_evolution]) or (count>0))
			    {
					free=false;
			        do
			        {
			            card_id_in_space[0].card_id = evo_list[evolution_position];
			            evolution_position++;
						count++;
			            if (evolution_position > 7)
			            {
			                evolution_position = 0;
			            }
					} until (card_id_in_space[0].card_id != -1 && card_id_in_space[0].card_id <= normal_poke_id_max)
					if(count>1){free=true;}
					if(!free){sc_card_effect(event_space_id[0].x, event_space_id[0].y, 0, false, true);}
			        with (card_id_in_space[0])
			        {
			            sc_pokelist();
						if card_delta = true
						{
							card_type_a = card_delta_type;
							card_type_b = -1;
						}
			            sc_card_level_stats_all(true, true);
			        }
					if card_id_in_space[0].card_has_rush = true and card_id_in_space[0].card_glyph_a != ref_glyph_rush  && 
					card_id_in_space[0].card_has_taunt = true and card_id_in_space[0].card_glyph_b != ref_glyph_taunt {
						card_id_in_space[0].card_glyph_a=ref_glyph_rush; 
						card_id_in_space[0].card_glyph_b=ref_glyph_taunt; 
						ob_main.main_card_glyph_a[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_a;
						ob_main.main_card_glyph_b[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_b;} 							
					else if card_id_in_space[0].card_has_rush = true and card_id_in_space[0].card_glyph_a != ref_glyph_rush { 
						card_id_in_space[0].card_glyph_a=ref_glyph_rush; 
						ob_main.main_card_glyph_a[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_a;} 
					else if card_id_in_space[0].card_has_taunt = true and card_id_in_space[0].card_glyph_a != ref_glyph_taunt { 
						card_id_in_space[0].card_glyph_a=ref_glyph_taunt; 
						ob_main.main_card_glyph_a[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_a;} 		
					else if card_id_in_space[0].card_has_rush = false && card_id_in_space[0].card_glyph_a = ref_glyph_rush { card_id_in_space[0].card_glyph_a = -1;}
					else if card_id_in_space[0].card_has_rush = false && card_id_in_space[0].card_glyph_b = ref_glyph_rush { card_id_in_space[0].card_glyph_b = -1;}
					else if card_id_in_space[0].card_has_taunt = false && card_id_in_space[0].card_glyph_a = ref_glyph_taunt { card_id_in_space[0].card_glyph_a = -1;}
					else if card_id_in_space[0].card_has_taunt = false && card_id_in_space[0].card_glyph_b = ref_glyph_taunt { card_id_in_space[0].card_glyph_b = -1;}
					if(!free){ob_main.event_cost_standby += ob_main.event_cost[ref_event_evolution];
			        sc_playsound(sn_upgrade, 50, false, false);}
			        ob_main.main_card_id[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_id;
			    	event_applied = true;
			        //evolution_retry = true;

						sc_playsound(sn_hurt,50,false,false)
					}				
				
			}
			else {evolution_position = 0;}
		break;
		case ref_event_megaevolve:
			if (card_id_in_space[0] != -1)
			{
			    if (card_id_in_space[0].card_can_mega)
			    {
			        do
			        {
			            if (card_id_in_space[0].card_form_value <= 999)
			            {
									if card_id_in_space[0].card_id == 006 //checks for charizard and allows for third mega form
									{
										card_id_in_space[0].card_form_value = choose(1000,1001,1002);
									}
									else
									{
										card_id_in_space[0].card_form_value = 1000 + irandom(1);
									}			                
			            }
			            else
			            {
			                card_id_in_space[0].card_form_value = irandom(999);
			            }
			        } until (card_id_in_space[0].card_id != -1 && card_id_in_space[0].card_id <= normal_poke_id_max)
			        sc_card_effect(event_space_id[0].x, event_space_id[0].y, 0, false, true);
			        with (card_id_in_space[0])
			        {
			            sc_pokelist();
						if card_delta = true
						{
							card_type_a = card_delta_type;
							card_type_b = -1;
						}
			            sc_card_level_stats_all(true, true);
			        }
					if card_id_in_space[0].card_has_rush = true and card_id_in_space[0].card_glyph_a != ref_glyph_rush  && 
						card_id_in_space[0].card_has_taunt = true and card_id_in_space[0].card_glyph_b != ref_glyph_taunt {
						card_id_in_space[0].card_glyph_a=ref_glyph_rush; 
						card_id_in_space[0].card_glyph_b=ref_glyph_taunt; 
						ob_main.main_card_glyph_a[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_a;
						ob_main.main_card_glyph_b[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_b;} 							
					else if card_id_in_space[0].card_has_rush = true and card_id_in_space[0].card_glyph_a != ref_glyph_rush { 
						card_id_in_space[0].card_glyph_a=ref_glyph_rush; 
						ob_main.main_card_glyph_a[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_a;} 
					else if card_id_in_space[0].card_has_taunt = true and card_id_in_space[0].card_glyph_a != ref_glyph_taunt { 
						card_id_in_space[0].card_glyph_a=ref_glyph_taunt; 
						ob_main.main_card_glyph_a[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_a;} 		
					else if card_id_in_space[0].card_has_rush = false && card_id_in_space[0].card_glyph_a = ref_glyph_rush { card_id_in_space[0].card_glyph_a = -1;}
					else if card_id_in_space[0].card_has_rush = false && card_id_in_space[0].card_glyph_b = ref_glyph_rush { card_id_in_space[0].card_glyph_b = -1;}
					else if card_id_in_space[0].card_has_taunt = false && card_id_in_space[0].card_glyph_a = ref_glyph_taunt { card_id_in_space[0].card_glyph_a = -1;}
					else if card_id_in_space[0].card_has_taunt = false && card_id_in_space[0].card_glyph_b = ref_glyph_taunt { card_id_in_space[0].card_glyph_b = -1;}						
			        event_applied = true;
			        evolution_retry = true;
			        sc_playsound(sn_upgrade, 50, false, false);
			        ob_main.main_card_form_value[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_form_value;
			    }
			}
		break;
		case ref_event_changeform:
			if (card_id_in_space[0] != -1)
			{
				if (card_id_in_space[0].card_has_forms && card_id_in_space[0].card_form_change == true)
				{
				    if (card_id_in_space[0].card_id == 493 or card_id_in_space[0].card_id == 773) //Arceus or Silvally
				    {
				        do
				        {
				            //
				            if (card_id_in_space[0].card_form_value < 935)
				            {
				                card_id_in_space[0].card_form_value += 55;
				            }
				            else
				            {
				                card_id_in_space[0].card_form_value = irandom(54);
				            }
				        } until (card_id_in_space[0].card_id != -1 && card_id_in_space[0].card_id <= normal_poke_id_max)
				    }
					else if (card_id_in_space[0].card_id == 555)
				    {
				        do
				        {
				            //should work but did not test
				            if (card_id_in_space[0].card_form_value < 250)
				            {
				                card_id_in_space[0].card_form_value+=250;
				            }
							else if (card_id_in_space[0].card_form_value < 500)
				            {
				                card_id_in_space[0].card_form_value-=250;
				            }
							else if (card_id_in_space[0].card_form_value < 750)
				            {
				                card_id_in_space[0].card_form_value+=250;
				            }
				            else
				            {
				                card_id_in_space[0].card_form_value-=250;
				            }
				        } until (card_id_in_space[0].card_id != -1 && card_id_in_space[0].card_id <= normal_poke_id_max)
				    }
				    else if (card_id_in_space[0].card_can_mega && card_id_in_space[0].card_form_value > 999)
				    {
				        do
				        {
							if card_id_in_space[0].card_id == 006 //checks for charizard and allows for third mega form
							{
										if (card_id_in_space[0].card_form_value == 1000)
										{
												card_id_in_space[0].card_form_value = choose(1001,1002);
										}
										else if (card_id_in_space[0].card_form_value == 1001)
										{
												card_id_in_space[0].card_form_value = choose(1000,1002);
										}
										else if (card_id_in_space[0].card_form_value == 1002)
										{
												card_id_in_space[0].card_form_value = choose(1000,1001);
										}	
							} 
				            else if (card_id_in_space[0].card_form_value == 1000)
				            {
									
										card_id_in_space[0].card_form_value = 1001;
				            }
				            else
				            {
				                card_id_in_space[0].card_form_value = 1000;
				            }
				        } until (card_id_in_space[0].card_id != -1 && card_id_in_space[0].card_id <= normal_poke_id_max)
				    }
				    else
				    {
				        do
				        {
				            if (card_id_in_space[0].card_form_value < 500)
				            {
				                card_id_in_space[0].card_form_value = irandom(499) + 500;
				            }
				            else
				            {
				                card_id_in_space[0].card_form_value = irandom(499);
				            }
				        } until (card_id_in_space[0].card_id != -1 && card_id_in_space[0].card_id <= normal_poke_id_max)
				    }
				    sc_card_effect(event_space_id[0].x, event_space_id[0].y, 0, false, true);
				    with (card_id_in_space[0])
				    {
				        sc_pokelist();
				        sc_card_level_stats_all(true, true);
				    }
        
					if card_id_in_space[0].card_has_rush = true and card_id_in_space[0].card_glyph_a != ref_glyph_rush  && 
						card_id_in_space[0].card_has_taunt = true and card_id_in_space[0].card_glyph_b != ref_glyph_taunt {
						card_id_in_space[0].card_glyph_a=ref_glyph_rush; 
						card_id_in_space[0].card_glyph_b=ref_glyph_taunt; 
						ob_main.main_card_glyph_a[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_a;
						ob_main.main_card_glyph_b[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_b;} 							
					else if card_id_in_space[0].card_has_rush = true and card_id_in_space[0].card_glyph_a != ref_glyph_rush { 
						card_id_in_space[0].card_glyph_a=ref_glyph_rush; 
						ob_main.main_card_glyph_a[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_a;} 
					else if card_id_in_space[0].card_has_taunt = true and card_id_in_space[0].card_glyph_a != ref_glyph_taunt { 
						card_id_in_space[0].card_glyph_a=ref_glyph_taunt; 
						ob_main.main_card_glyph_a[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_a;} 		
					else if card_id_in_space[0].card_has_rush = false && card_id_in_space[0].card_glyph_a = ref_glyph_rush { card_id_in_space[0].card_glyph_a = -1;}
					else if card_id_in_space[0].card_has_rush = false && card_id_in_space[0].card_glyph_b = ref_glyph_rush { card_id_in_space[0].card_glyph_b = -1;}
					else if card_id_in_space[0].card_has_taunt = false && card_id_in_space[0].card_glyph_a = ref_glyph_taunt { card_id_in_space[0].card_glyph_a = -1;}
					else if card_id_in_space[0].card_has_taunt = false && card_id_in_space[0].card_glyph_b = ref_glyph_taunt { card_id_in_space[0].card_glyph_b = -1;}
					//if(!free){ob_main.event_cost_standby += ob_main.event_cost[ref_event_evolution];
			       // sc_playsound(sn_upgrade, 50, false, false);}
			        ob_main.main_card_id[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_id;
		
				    event_applied = true;
				    evolution_retry = true;
				    sc_playsound(sn_upgrade, 50, false, false);
				    ob_main.main_card_form_value[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_form_value;
				}
				else if (card_id_in_space[0].card_has_forms && card_id_in_space[0].card_can_mega = false){
									        do
				        {
				            if (card_id_in_space[0].card_form_value < 500)
				            {
				                card_id_in_space[0].card_form_value = irandom(499) + 500;
				            }
				            else
				            {
				                card_id_in_space[0].card_form_value = irandom(499);
				            }
				        } until (card_id_in_space[0].card_id != -1 && card_id_in_space[0].card_id <= normal_poke_id_max)
										    sc_card_effect(event_space_id[0].x, event_space_id[0].y, 0, false, true);
				    with (card_id_in_space[0])
				    {
				        sc_pokelist();
				        sc_card_level_stats_all(true, true);
				    }
        
				    event_applied = true;
				    evolution_retry = true;
				    sc_playsound(sn_upgrade, 50, false, false);
				    ob_main.main_card_form_value[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_form_value;
				}
					
			}
		break;
		case ref_event_glyph:
			if (card_id_in_space[0] != -1)
			{
			    if (card_id_in_space[0].card_glyph_c == -1 && (card_id_in_space[0].card_innate > 0 or (glyph_add_id = ref_glyph_adversity && card_id_in_space[0].card_innate = -1 )) &&
			        card_id_in_space[0].card_glyph_a != glyph_add_id && card_id_in_space[0].card_glyph_b != glyph_add_id && card_id_in_space[0].card_glyph_c != glyph_add_id)
			    {
			        sc_insert_into_free_glyph_slot(card_id_in_space[0], glyph_add_id);
			        sc_card_effect(event_space_id[0].x, event_space_id[0].y, 0, false, true);
			        with (card_id_in_space[0])
			        {
			            sc_card_level_stats_all(true, true);
			        }
        
			        event_applied = true;
			        sc_playsound(sn_upgrade, 50, false, false);
			        ob_main.main_card_glyph_a[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_a;
			        ob_main.main_card_glyph_b[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_b;
			        ob_main.main_card_glyph_c[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_c;
			    }
				else
				{
					sc_playsound(sn_hurt,50,false,false);
				}
			}
		break;
		case ref_event_tribute:
			if (card_id_in_space[0] != -1 && card_id_in_space[1] != -1) {
				if (card_id_in_space[0].card_innate > 0 && card_id_in_space[1].card_innate < innate_max && card_id_in_space[0].card_environment == false && card_id_in_space[1].card_environment == false)
				{
				    card_id_in_space[0].card_innate--;
				    card_id_in_space[0].effect_damaged = 1;
    
				    card_id_in_space[1].card_innate++;
				    sc_card_effect(event_space_id[1].x, event_space_id[1].y, 0, false, true);
				    sc_playsound(sn_upgrade, 50, false, false);
    
				    with (card_id_in_space[0])
				    {
				        sc_card_level_stats_all(true, true);
				    }
				    with (card_id_in_space[1])
				    {
				        sc_card_level_stats_all(true, true);
				    }
    
				    event_applied = true;
				    ob_main.main_card_innate[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_innate;
				    ob_main.main_card_innate[card_id_in_space[1].num_in_all] = card_id_in_space[1].card_innate;
				}
				else
				{
					sc_playsound(sn_hurt,50,false,false);
				}
			}
		break;
		case ref_event_sacrifice:
			if (card_id_in_space[0] != -1 && card_id_in_space[1] != -1 && !card_id_in_space[1].card_environment) {
				if ((card_id_in_space[0].card_glyph_a != -1 || card_id_in_space[0].card_glyph_b != -1 || card_id_in_space[0].card_glyph_c != -1) && card_id_in_space[0].card_innate > 0) && 
				((card_id_in_space[0].card_glyph_a != ref_glyph_rush && card_id_in_space[0].card_glyph_b != ref_glyph_rush && card_id_in_space[0].card_glyph_c != ref_glyph_rush)) && 
				((card_id_in_space[0].card_glyph_a != ref_glyph_taunt && card_id_in_space[0].card_glyph_b != ref_glyph_taunt && card_id_in_space[0].card_glyph_c != ref_glyph_taunt)) && 
				((card_id_in_space[0].card_glyph_a != ref_glyph_transform && card_id_in_space[0].card_glyph_b != ref_glyph_transform && card_id_in_space[0].card_glyph_c != ref_glyph_transform)) && 
				((card_id_in_space[0].card_glyph_a != ref_glyph_sketch && card_id_in_space[0].card_glyph_b != ref_glyph_sketch && card_id_in_space[0].card_glyph_c != ref_glyph_sketch)) && 
				((card_id_in_space[0].card_glyph_a != ref_glyph_command && card_id_in_space[0].card_glyph_b != ref_glyph_command && card_id_in_space[0].card_glyph_c != ref_glyph_command)) && 
				((card_id_in_space[0].card_glyph_a != ref_glyph_adaptability && card_id_in_space[0].card_glyph_b != ref_glyph_adaptability && card_id_in_space[0].card_glyph_c != ref_glyph_adaptability)){
					var devour = false;
					if(card_id_in_space[0].card_innate < 2 && card_id_in_space[0].card_innate != -1){
						if (card_id_in_space[0].card_glyph_c != -1 && !sc_glyph_bound(card_id_in_space[0].card_glyph_c) && !sc_glyph_exists_on_card(card_id_in_space[1], card_id_in_space[0].card_glyph_c))
						{
						    sc_insert_into_free_glyph_slot(card_id_in_space[1], card_id_in_space[0].card_glyph_c);
						    card_id_in_space[0].card_glyph_c = -1;
						}

						if (card_id_in_space[0].card_glyph_b != -1 && !sc_glyph_bound(card_id_in_space[0].card_glyph_b) && !sc_glyph_exists_on_card(card_id_in_space[1], card_id_in_space[0].card_glyph_b))
						{
						    sc_insert_into_free_glyph_slot(card_id_in_space[1], card_id_in_space[0].card_glyph_b);
						    card_id_in_space[0].card_glyph_b = -1;
						}

						if (card_id_in_space[0].card_glyph_a != -1 && !sc_glyph_bound(card_id_in_space[0].card_glyph_a) && !sc_glyph_exists_on_card(card_id_in_space[1], card_id_in_space[0].card_glyph_a))
						{
						    sc_insert_into_free_glyph_slot(card_id_in_space[1], card_id_in_space[0].card_glyph_a);
						    card_id_in_space[0].card_glyph_a = -1;
						}
						devour = true;
						card_id_in_space[0].card_innate = -1;
					} else {
						card_id_in_space[0].card_innate--;
						if (card_id_in_space[0].card_glyph_c != -1 && !sc_glyph_bound(card_id_in_space[0].card_glyph_c) && !sc_glyph_exists_on_card(card_id_in_space[1], card_id_in_space[0].card_glyph_c))
						{
						    sc_insert_into_free_glyph_slot(card_id_in_space[1], card_id_in_space[0].card_glyph_c);
						    card_id_in_space[0].card_glyph_c = -1;
						}
						else if (card_id_in_space[0].card_glyph_b != -1 && !sc_glyph_bound(card_id_in_space[0].card_glyph_b) && !sc_glyph_exists_on_card(card_id_in_space[1], card_id_in_space[0].card_glyph_b))
						{
						    sc_insert_into_free_glyph_slot(card_id_in_space[1], card_id_in_space[0].card_glyph_b);
						    card_id_in_space[0].card_glyph_b = -1;
						}
						else if (card_id_in_space[0].card_glyph_a != -1 && !sc_glyph_bound(card_id_in_space[0].card_glyph_a) && !sc_glyph_exists_on_card(card_id_in_space[1], card_id_in_space[0].card_glyph_a))
						{
						    sc_insert_into_free_glyph_slot(card_id_in_space[1], card_id_in_space[0].card_glyph_a);
						    card_id_in_space[0].card_glyph_a = -1;
						}
						else {
							return; 
						}
				
						if (card_id_in_space[0].card_glyph_a == -1)
						{
						    if (sc_insert_into_free_glyph_slot(card_id_in_space[0], card_id_in_space[0].card_glyph_b))
						    {
						        card_id_in_space[0].card_glyph_b = -1;
						    }
						    else if (sc_insert_into_free_glyph_slot(card_id_in_space[0], card_id_in_space[0].card_glyph_c))
						    {
						        card_id_in_space[0].card_glyph_c = -1;
						    }
						}				
					}
			
					card_id_in_space[0].effect_damaged = 1;

					sc_card_effect(event_space_id[0].x, event_space_id[0].y, 0, false, true);
					sc_playsound(sn_hurt, 50, false, false);

					if (card_id_in_space[1].card_innate < innate_max)
					{
					    card_id_in_space[1].card_innate++;
					}
					sc_card_effect(event_space_id[1].x, event_space_id[1].y, 0, false, true);
					sc_playsound(sn_upgrade, 50, false, false);

					event_applied = true;
				    ob_main.main_card_innate[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_innate;
					ob_main.main_card_innate[card_id_in_space[1].num_in_all] = card_id_in_space[1].card_innate;
					ob_main.main_card_shiny[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_shiny;
					ob_main.main_card_shiny[card_id_in_space[1].num_in_all] = card_id_in_space[1].card_shiny;
					ob_main.main_card_holo[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_holo;
					ob_main.main_card_holo[card_id_in_space[1].num_in_all] = card_id_in_space[1].card_holo;
					ob_main.main_card_delta[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_delta;
					ob_main.main_card_delta[card_id_in_space[1].num_in_all] = card_id_in_space[1].card_delta;
					ob_main.main_card_delta_type[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_delta_type;
					ob_main.main_card_delta_type[card_id_in_space[1].num_in_all] = card_id_in_space[1].card_delta_type;
					ob_main.main_card_type_a[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_type_a;
					ob_main.main_card_type_b[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_type_b;
					ob_main.main_card_glyph_a[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_a;
					ob_main.main_card_glyph_b[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_b;
					ob_main.main_card_glyph_c[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_c;
					ob_main.main_card_glyph_a[card_id_in_space[1].num_in_all] = card_id_in_space[1].card_glyph_a;
					ob_main.main_card_glyph_b[card_id_in_space[1].num_in_all] = card_id_in_space[1].card_glyph_b;
					ob_main.main_card_glyph_c[card_id_in_space[1].num_in_all] = card_id_in_space[1].card_glyph_c;

					with (card_id_in_space[0])
					{
					    if (devour) && card_environment=false
					    {
					        sc_playsound(sn_faint, 50, false, false);
							instance_destroy();
					    }
					    else if card_environment=false
					    {
					        sc_card_level_stats_all(true, true);
					    }
					}
					event_space_id[0].occupy_id = -1;
					
					with (card_id_in_space[1])
					{
					    sc_card_level_stats_all(true, true);
					}
					

				}
				else
				{
					sc_playsound(sn_hurt,50,false,false);
				}
			}
		break;
		case ref_event_deglyph:
			if (card_id_in_space[0] != -1) {
				if (card_id_in_space[0].card_glyph_a > 0 || card_id_in_space[0].card_glyph_b || card_id_in_space[0].card_glyph_c) {
					if (card_id_in_space[0].card_glyph_c != -1 && !sc_glyph_bound(card_id_in_space[0].card_glyph_c))
					{
					    card_id_in_space[0].card_glyph_c = -1;
					}

					else if (card_id_in_space[0].card_glyph_b != -1 && !sc_glyph_bound(card_id_in_space[0].card_glyph_b))
					{
					    card_id_in_space[0].card_glyph_b = -1;
					}

					else if (card_id_in_space[0].card_glyph_a != -1 && !sc_glyph_bound(card_id_in_space[0].card_glyph_a))
					{
					    card_id_in_space[0].card_glyph_a = -1;
					}
					else {
						return;
					}
			
					card_id_in_space[0].effect_damaged = 1;

					sc_card_effect(event_space_id[0].x, event_space_id[0].y, 0, false, true);
					sc_playsound(sn_hurt, 50, false, false);

					with (card_id_in_space[0])
					{
					    sc_card_level_stats_all(true, true);
					}

					event_applied = true;
					ob_main.main_card_innate[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_innate;
					ob_main.main_card_glyph_a[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_a;
					ob_main.main_card_glyph_b[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_b;
					ob_main.main_card_glyph_c[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_glyph_c;
				}
				else
				{
					sc_playsound(sn_hurt,50,false,false);
				}
			}
		break;
		case ref_event_campfire:
			if (card_id_in_space[0] != -1)
			{
			    if (card_id_in_space[0].card_innate < innate_max && card_id_in_space[0].card_environment == false)
			    {
			        card_id_in_space[0].card_innate++;
			        sc_card_effect(event_space_id[0].x, event_space_id[0].y, 0, false, true);
			        sc_playsound(sn_upgrade, 50, false, false);
        
			        with (card_id_in_space[0])
			        {
			            sc_card_level_stats_all(true, true);
			        }
        
			        event_applied = true;
			        ob_main.main_card_innate[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_innate;
			    }
				else
				{
					sc_playsound(sn_hurt,50,false,false);
				}
			}
		break;
		case ref_event_candy:
			if (card_id_in_space[0] != -1)
			{
			    if (card_id_in_space[0].card_innate < innate_max+1 && card_id_in_space[0].card_environment == false)
			    {
			        card_id_in_space[0].card_innate = (innate_max+1);
			        sc_card_effect(event_space_id[0].x, event_space_id[0].y, 0, false, true);
			        sc_playsound(sn_upgrade, 50, false, false);
        
			        with (card_id_in_space[0])
			        {
			            sc_card_level_stats_all(true, true);
			        }
        
			        event_applied = true;
			        ob_main.main_card_innate[card_id_in_space[0].num_in_all] = card_id_in_space[0].card_innate;
			    }
				else
				{
					sc_playsound(sn_hurt,50,false,false);
				}
			}
		break;	
		default:
		break;
	}
	
	apply_event=false;
}