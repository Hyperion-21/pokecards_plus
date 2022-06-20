// Draw battle controls.
if (instance_exists(ob_control))
{
    switch (button_id)
    {
        case 0:
            if (ob_control.battler_turn == 1)
            {
                draw_sprite_general(sp_sheet, 0, 16 * 3, 16 * (7 + (ceil(button_state) * 2)), 31, 24, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
                
                var all_cards_attacked = true;
                for (var i = 0; i <= 4; i++)
                {
                    if (ob_control.card_space_id[i + 5].occupy_id != -1 &&
                        ob_control.card_space_id[i + 5].occupy_id.already_attacked == false && ob_control.card_space_id[i + 5].occupy_id.card_environment == false)
                    {
                        all_cards_attacked = false;
                    }
                }
                
                if (ob_control.card_draw_points > 0 && ob_control.turn_num > 2 && all_cards_attacked == false)
                {
                    draw_sprite_general(sp_sheet, 0, 16 * 1, 16 * 3, 4, 4, x + 25, y + 2 + ceil(button_state) * 2, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
                    draw_sprite_general(sp_sheet, 0, 16 * 2, 16 * 3, 4, 4, x + 25, y + 7 + ceil(button_state) * 2, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
                }
                else if (ob_control.card_draw_points > 0)
                {
                    draw_sprite_general(sp_sheet, 0, 16 * 1, 16 * 3, 4, 4, x + 25, y + 2 + ceil(button_state) * 2, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
                }
                else if (ob_control.turn_num > 2 && all_cards_attacked == false)
                {
                    draw_sprite_general(sp_sheet, 0, 16 * 2, 16 * 3, 4, 4, x + 25, y + 2 + ceil(button_state) * 2, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
                }
            }
            else
            {
                draw_sprite_general(sp_sheet, 0, 16 * 5, 16 * (7 + (ceil(button_state) * 2)), 31, 24, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
            }
            break;
        case 1:
            draw_sprite_general(sp_sheet, 0, 16 * button_id, 16 * (7 + (ceil(button_state) * 2)), 16, 16, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
            break;
        case 2:
            draw_sprite_general(sp_sheet, 0, 16 * button_id, 16 * (7 + (ceil(button_state) * 2)), 16, 16, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 0.5);
            break;
        case 3:
            draw_sprite_general(sp_sheet, 0, 16 * 2, 16 * (8 + (ceil(button_state) * 2)), 16, 16, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
            break;
        case 4:
            draw_sprite_general(sp_sheet, 0, 16 * 30, 16 * (7 + ceil(button_state)), 16, 16, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
            break;
        default:
            break;
    }
	return;
}

// Draw event controls.
if (instance_exists(ob_event))
{
    switch (button_id)
    {
        case 0:
            if (!ob_event.event_applied || ob_event.event_kind == ref_event_levelup || ob_event.event_kind == ref_event_evolution)
            {
                draw_sprite_general(sp_sheet, 0, 16 * 1, 16 * (16 + (ceil(button_state) * 2)), 31, 24, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
            }
            else if (ob_event.evolution_retry)
            {
                draw_sprite_general(sp_sheet, 0, 16 * 5, 16 * (16 + (ceil(button_state) * 2)), 31, 24, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
            }
            else if (ob_event.event_applied && !ob_event.evolution_retry && ob_event.event_kind != ref_event_levelup && ob_event.event_kind != ref_event_evolution)
            {
                draw_sprite_general(sp_sheet, 0, 16 * 3, 16 * (16 + (ceil(button_state) * 2)), 31, 24, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
            }
            break;
        case 1:
            if (ob_event.event_applied)
            {
                draw_sprite_general(sp_sheet, 0, 16 * 3, 16 * (7 + (ceil(button_state) * 2)), 31, 24, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
            }
            else
            {
                draw_sprite_general(sp_sheet, 0, 16 * 5, 16 * (7 + (ceil(button_state) * 2)), 31, 24, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
            }
            break;
        case 2:
            draw_sprite_general(sp_sheet, 0, 16 * 1, 16 * (8 + (ceil(button_state) * 2)), 16, 16, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
            break;
        default:
            break;
    }
	return;
}

// Draw deckbuilding controls.
if (instance_exists(ob_deckbuild))
{
    if (button_id < 10)
    {
        draw_sprite_general(sp_sheet, 0, 16 * (13 + button_id), 16 * (7 + ceil(button_state)), 16, 16, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
    }
    else
    {
        draw_sprite_general(sp_sheet, 0, 16 * (13 + 10), 16 * (7 + ceil(button_state)), 16, 16, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
    }
	return;
}

// Default button drawing if no instances exist.
switch (button_id)
{
    case 100:
        draw_sprite_general(sp_sheet, 0, 16 * 2, 16 * (7 + (ceil(button_state) * 2)), 16, 16, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
        break;
    case 101:
        draw_sprite_general(sp_sheet, 0, 16 * 24, 16 * (7 + ceil(button_state)), 16, 16, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
        break;
    case 102:
        draw_sprite_general(sp_sheet, 0, 16 * 25, 16 * (7 + ceil(button_state)), 16, 16, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
        break;
    case 103:
        draw_sprite_general(sp_sheet, 0, 16 * 26, 16 * (7 + ceil(button_state)), 16, 16, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
        break;
    case 104:
        draw_sprite_general(sp_sheet, 0, 16 * 2, 16 * (8 + (ceil(button_state) * 2)), 16, 16, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
        break;
}