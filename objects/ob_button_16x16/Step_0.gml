if (instance_exists(ob_control) && button_id == 2)
{
    // exit battle
    if (mouse_x >= x && mouse_y >= y + 2 && mouse_x < x + sprite_width && mouse_y < y + sprite_height - 2 && ob_main.mouse_cursor == 0 && ob_control.battler_turn != 0)
    {
        ob_main.mouse_cursor = 1;
        
        if (mouse_check_button(mb_left) && ob_main.cursor_hide == false && button_state < 1)
        {
            if (mouse_check_button_pressed(mb_left))
            {
                sc_playsound(sn_click, 50, false, false);
            }
            
            button_state += 0.01;
            if (button_state == 1)
            {
                ob_control.battler_turn = 0;
                ob_main.event_transition = ref_event_exitbattle;
                ob_main.fade_black = 1;
            }
        }
        else
        {
            button_state -= 0.05;
        }
    }
    else
    {
        button_state -= 0.05;
    }
    
    if (button_state < 0)
    {
        button_state = 0;
    }
    ob_main.fade_black_exit = button_state;
    
    if (ob_main.cursor_hide == false && mouse_x >= x && mouse_y >= y + 2 && mouse_x < x + sprite_width && mouse_y < y + sprite_height - 2)
    {
        ob_control.tooltip_text = "Declare stalemate / exit battle (hold).";
        ob_control.tooltip_lines = 1;
    }
	
	return;
}

// Auto-attack
if (instance_exists(ob_control) && button_id == 4) { 
	if (mouse_x >= x && mouse_y >= y + 2 && mouse_x < x + sprite_width && mouse_y < y + sprite_height - 2 && ob_main.mouse_cursor == 0) {
		ob_main.mouse_cursor=1;
		
		if (mouse_check_button(mb_left) && ob_main.cursor_hide == false)
		{
		    if (mouse_check_button_pressed(mb_left))
		    {
		        sc_playsound(sn_click, 50, false, false);
		    }
    
		    button_state = 1;
		}
		else
		{
		    button_state = 0;
		}
	}
	else { 
		button_state = 0; 
	}
	
	if (ob_main.cursor_hide == false && mouse_x >= x && mouse_y >= y + 2 && mouse_x < x + sprite_width && mouse_y < y + sprite_height - 2)
	{
	    ob_control.tooltip_text = "Attack with all cards (hold).";
	    ob_control.tooltip_lines = 1;
	}
	
	return;
}

// exit game & delete save data
if (button_id == 100 || button_id == 102)
{
	if (mouse_x >= x && mouse_y >= y + 2 && mouse_x < x + sprite_width && mouse_y < y + sprite_height - 2 && ob_main.mouse_cursor == 0)
	{
	    ob_main.mouse_cursor = 1;
    
	    if (mouse_check_button(mb_left) && ob_main.cursor_hide == false && button_state < 1)
	    {
	        if (mouse_check_button_pressed(mb_left))
	        {
	            sc_playsound(sn_click, 50, false, false);
	        }
        
	        if (button_id == 100)
	        {
	            button_state += 0.01;
	        }
	        else if (button_id == 102)
	        {
	            button_state += 0.008;
	        }
	    }
	    else
	    {
	        button_state -= 0.05;
	    }
	}
	else
	{
	    button_state -= 0.05;
	}
	if (button_state < 0)
	{
	    button_state = 0;
	}
	if (button_id == 100)
	{
	    ob_main.fade_black_exit = button_state;
	}
	else if (button_id == 102)
	{
	    ob_main.fade_red_delete = button_state;
	}

	if (ob_main.cursor_hide == false && mouse_x >= x && mouse_y >= y + 2 && mouse_x < x + sprite_width && mouse_y < y + sprite_height - 2)
	{
	    switch (button_id)
	    {
	        case 100:
	            ob_main.tooltip_text = "Exit game (hold).";
	            break;
	        case 102:
	            ob_main.tooltip_text = "Delete all save data (hold).";
	            break;
	    }
	    ob_main.tooltip_lines = 1;
	}
	
	return;
}


//all other buttons
if (mouse_x >= x && mouse_y >= y + 2 && mouse_x < x + sprite_width && mouse_y < y + sprite_height - 2 && ob_main.mouse_cursor == 0)
{
    ob_main.mouse_cursor = 1;
    
    if (mouse_check_button_pressed(mb_left) && button_state == 0 && ob_main.cursor_hide == false)
    {
        sc_playsound(sn_click, 50, false, false);
        if (instance_exists(ob_control))
        {
            if (button_id == 0 && ob_control.battler_turn == 1)
            {
                ob_control.button_nextturn = true;
            }
            else if (button_id == 1)
            {
                ob_control.button_sorthand = true;
            }
            else if (button_id == 3)
            {
                ob_main.type_chart_toggle = true;
            }
        }
        else if (instance_exists(ob_event))
        {
            if (button_id == 0 && ob_event.event_cancelled == false &&
                 (ob_event.event_applied == false || ob_event.evolution_retry == true || ob_event.event_kind == ref_event_levelup || ob_event.event_kind == ref_event_deglyph || ob_event.event_kind == ref_event_evolution))
            {
                ob_event.apply_event = true;
            }
            else if (button_id == 1)
            {
                ob_main.event_transition = ob_event.event_kind;
                if (ob_event.event_applied == false)
                {
                    ob_event.event_cancelled = true;
                }
            }
            else if (button_id == 2)
            {
                with (ob_card)
                {
                    auto_turn_add = true;
                }
            }
        }
        else if (instance_exists(ob_deckbuild))
        {
            if (button_id <= 9)
            {
                ob_deckbuild.reorder_selected = button_id;
                ob_deckbuild.reorder_swap_standby = ob_deckbuild.reorder_selected;
                ob_deckbuild.reorder_type = ob_deckbuild.reorder_selected;
            }
            else if (button_id <= 14)
            {
                ob_deckbuild.deck_setup_load = button_id - 9;
                ob_deckbuild.reorder_swap_standby = ob_deckbuild.reorder_selected;
                ob_deckbuild.reorder_selected = 0;
                ob_deckbuild.reorder_type = ob_deckbuild.reorder_selected;
            }
            else if (button_id <= 19)
            {
                ob_deckbuild.deck_setup_save = button_id - 14;
                ob_deckbuild.reorder_swap_standby = ob_deckbuild.reorder_selected;
                ob_deckbuild.reorder_selected = 0;
                ob_deckbuild.reorder_type = ob_deckbuild.reorder_selected;
            }
        }
        else
        {
            if (button_id == 101)
            {
                // do nothing, only button_state=1 is needed
            }
            else if (button_id == 103)
            {
                ob_main.credits_screen_toggle = true;
            }
            else if (button_id == 104)
            {
                ob_main.type_chart_toggle = true;
            }
        }
        
        button_state = 1;
    }
    else
    {
        button_state -= 0.1;
    }
}
else
{
    button_state -= 0.1;
}

if (button_state < 0) 
{ 
	button_state=0; 
}

if (keyboard_check_pressed(vk_space) && !mouse_check_button(mb_left) && button_state == 0 && ob_main.cursor_hide == false)
{
    if (instance_exists(ob_event))
    {
        if (button_id == 2)
        {
            with (ob_card)
            {
                auto_turn_add = true;
            }
            button_state = 1;
        }
    }
}

if (ob_main.cursor_hide == false && mouse_x >= x && mouse_y >= y + 2 && mouse_x < x + sprite_width && mouse_y < y + sprite_height - 2)
{
    if (instance_exists(ob_deckbuild))
    {
        switch (button_id)
        {
            case 00:
                ob_deckbuild.tooltip_text = "Sort cards by number.";
                break;
            case 01:
                ob_deckbuild.tooltip_text = "Sort cards by level.";
                break;
            case 02:
                ob_deckbuild.tooltip_text = "Sort cards by attack points.";
                break;
            case 03:
                ob_deckbuild.tooltip_text = "Sort cards by defense points.";
                break;
            case 04:
                ob_deckbuild.tooltip_text = "Sort cards by hit points.";
                break;
            case 05:
                ob_deckbuild.tooltip_text = "Sort cards by type.";
                break;
            case 06:
                ob_deckbuild.tooltip_text = "Sort cards by Delta type.";
                break;
            case 07:
                ob_deckbuild.tooltip_text = "Sort cards by shiny.";
                break;
            case 08:
                ob_deckbuild.tooltip_text = "Sort cards by holographic.";
                break;
            case 09:
                ob_deckbuild.tooltip_text = "Sort cards by berry";
                break;
            case 10:
                ob_deckbuild.tooltip_text = "Load deck setup 1.";
                break;
            case 11:
                ob_deckbuild.tooltip_text = "Load deck setup 2.";
                break;
            case 12:
                ob_deckbuild.tooltip_text = "Load deck setup 3.";
                break;
            case 13:
                ob_deckbuild.tooltip_text = "Load deck setup 4.";
                break;
            case 14:
                ob_deckbuild.tooltip_text = "Load deck setup 5.";
                break;
            case 15:
                ob_deckbuild.tooltip_text = "Save deck setup 1.";
                break;
            case 16:
                ob_deckbuild.tooltip_text = "Save deck setup 2.";
                break;
            case 17:
                ob_deckbuild.tooltip_text = "Save deck setup 3.";
                break;
            case 18:
                ob_deckbuild.tooltip_text = "Save deck setup 4.";
                break;
            case 19:
                ob_deckbuild.tooltip_text = "Save deck setup 5.";
                break;
        }
        ob_deckbuild.tooltip_lines = 1;
    }
    else if (instance_exists(ob_control))
    {
        switch (button_id)
        {
            case 01:
                ob_control.tooltip_text = "Sort cards in hand.";
                break;
            case 03:
                ob_control.tooltip_text = "Type-advantage chart.";
                break;
        }
        ob_control.tooltip_lines = 1;
    }
    else if (button_id >= 100)
    {
        switch (button_id)
        {
            case 101:
                ob_main.tooltip_text = "Reset all options.";
                break;
            case 103:
                ob_main.tooltip_text = "Credits.";
                break;
            case 104:
                ob_main.tooltip_text = "Type-advantage chart.";
                break;
        }
        ob_main.tooltip_lines = 1;
    }
}
