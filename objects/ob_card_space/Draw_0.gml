// If this card space is the trash space in battle, draw the appropriate sprite for it.
if (trash) {
    draw_sprite_general(sp_sheet, 0, 596, 0, sprite_width, sprite_height, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 0.5);
	return;
}

// If we are in an event.
if (instance_exists(ob_event))
{
    if (mouse_x >= x + 4 && mouse_y >= y + 4 && mouse_x < x + sprite_width - 4 && mouse_y < y + sprite_height - 4)
    {
        var var_event_alpha = 1;
    }
    else
    {
        var var_event_alpha = 0.5;
    }
	
	if ((ob_event.event_kind != ref_event_tribute && ob_event.event_kind != ref_event_sacrifice) || ob_event.event_space_id[1] != id)
	{
		draw_sprite_general(sp_sheet, 0, 16 * (1 + ob_event.event_kind * 2), 240, 26, 26, x + 16, y + 26, 1, 1, 0, c_white, c_white, c_white, c_white, var_event_alpha);
	}

	
	switch(ob_event.event_kind){
		case ref_event_campfire:
			draw_sprite_general(sp_sheet, 0, 560, 240, 26, 26, x + 16, y + 26, 1, 1, 0, c_white, c_white, c_white, c_white, var_event_alpha);
		break;
		case ref_event_candy:
			draw_sprite_general(sp_sheet, 0, 624, 272, 26, 26, x + 16, y + 26, 1, 1, 0, c_white, c_white, c_white, c_white, var_event_alpha);
		break;
		case ref_event_megaevolve:
			draw_sprite_general(sp_sheet, 0, 528, 240, 26, 26, x + 16, y + 26, 1, 1, 0, c_white, c_white, c_white, c_white, var_event_alpha);
		break;
		case ref_event_changeform:
			draw_sprite_general(sp_sheet, 0, 592, 240, 26, 26, x + 16, y + 26, 1, 1, 0, c_white, c_white, c_white, c_white, var_event_alpha);
		break;
		case ref_event_sacrifice:
			draw_sprite_general(sp_sheet, 0, 464, 240, 26, 26, x + 16, y + 26, 1, 1, 0, c_white, c_white, c_white, c_white, var_event_alpha);
		break;
		case ref_event_deglyph:
			draw_sprite_general(sp_sheet, 0, 624, 240, 26, 26, x + 16, y + 26, 1, 1, 0, c_white, c_white, c_white, c_white, var_event_alpha);
		break;
		case ref_event_levelup:
	        draw_set_font(fn_matchup);
			draw_set_halign(fa_center);
			if (occupy_id != -1 && occupy_id.card_level < ob_main.card_level_player_limit && occupy_id.card_innate > 0 && ob_main.event_cost_standby_levelup > 0)
			{
			    if (ob_main.money - ob_main.event_cost_standby >= ob_main.event_cost_standby_levelup)
			    {
			        var money_color = global.color_card_light;
			    }
			    else
			    {
			        var money_color = global.color_damage;
			    }
			    sc_drawtext(x - 108, y + 20, "Cost: $" + string(ob_main.event_cost_standby_levelup) + " / $" + string(ob_main.money - ob_main.event_cost_standby),
			        money_color, global.color_black, 1, 1, 0, -1);
    
			    with (occupy_id)
			    {
			        ob_event.levelup_new_hp = sc_card_level_stats_main(0, card_level + 1);
			        ob_event.levelup_new_atk = sc_card_level_stats_main(1, card_level + 1);
			        ob_event.levelup_new_def = sc_card_level_stats_main(2, card_level + 1);
			    }
			    var hp_diff = ob_event.levelup_new_hp - occupy_id.card_full_hp;
			    var atk_diff = ob_event.levelup_new_atk - occupy_id.card_full_atk;
			    var def_diff = ob_event.levelup_new_def - occupy_id.card_full_def;
    
			    var levelup_info_text = "+" + string(hp_diff) + " HP / +" + string(atk_diff) + " ATK / +" + string(def_diff) + " DEF";
			    if (occupy_id.card_level mod advantage_level_interval == 0 && occupy_id.card_environment == false)
			    {
			        levelup_info_text = levelup_info_text + " / +1 TYPE BONUS";
			    }
			    sc_drawtext(x - 108, y + 40, levelup_info_text, global.color_card_mid, global.color_black, 1, 1, 0, -1);
			}

		break;
		case ref_event_glyph:
			draw_sprite_general(sp_sheet, 0,16*(ob_main.ref_glyph_img[ob_main.current_glyph_add]-1),97, 12, 11, x + 41, y + 4, 1, 1, 0, c_white, c_white, c_white, c_white, var_event_alpha);

			draw_set_font(fn_matchup);
			draw_set_halign(fa_center);
			if (occupy_id != -1 && occupy_id.card_innate > 0 && occupy_id.card_environment == false &&
			    ((occupy_id.card_glyph_a == -1) || (occupy_id.card_glyph_a >= glyph_common_amount && occupy_id.card_glyph_b == -1) ||
			    (occupy_id.card_glyph_a >= glyph_common_amount && occupy_id.card_glyph_b >= glyph_common_amount && occupy_id.card_glyph_c == -1)))
			{
			    // berry costs from sc_card_level_stats_all
			    var imaginary_card_cost;
			    for (var i = 0; i <= 3; i++)
			    {
			        imaginary_card_cost[i] = sc_card_cost_map(occupy_id.card_cost_total + 1, occupy_id.card_enigma, occupy_id.card_type_a, occupy_id.card_type_b, i);
			    }
    
		    // water, ice, steel, normal, dragon, ghost       
		    if (imaginary_card_cost[occupy_id.card_cost_total] == 03 || imaginary_card_cost[occupy_id.card_cost_total] == 13 || imaginary_card_cost[occupy_id.card_cost_total] == 15 ||
		        imaginary_card_cost[occupy_id.card_cost_total] == 00 || imaginary_card_cost[occupy_id.card_cost_total] == 14 || imaginary_card_cost[occupy_id.card_cost_total] == 16)
		    {
		        var new_cost_text = "Oran Berry";
		    } // fire, psychic, fairy, fighting, ground, dark
		    else if (imaginary_card_cost[occupy_id.card_cost_total] == 02 || imaginary_card_cost[occupy_id.card_cost_total] == 07 ||
		        imaginary_card_cost[occupy_id.card_cost_total] == 08 || imaginary_card_cost[occupy_id.card_cost_total] == 06 ||
		        imaginary_card_cost[occupy_id.card_cost_total] == 09 || imaginary_card_cost[occupy_id.card_cost_total] == 17)
		    {
		        var new_cost_text = "Leppa Berry";
		    } // grass, electric, poison, bug, steel, flying
		    else if (imaginary_card_cost[occupy_id.card_cost_total] == 01 || imaginary_card_cost[occupy_id.card_cost_total] == 04 ||
		        imaginary_card_cost[occupy_id.card_cost_total] == 12 || imaginary_card_cost[occupy_id.card_cost_total] == 11 ||
		        imaginary_card_cost[occupy_id.card_cost_total] == 05 || imaginary_card_cost[occupy_id.card_cost_total] == 10)
		    {
		        var new_cost_text = "Lum Berry";
		    } // enigma
		    else if (imaginary_card_cost[occupy_id.card_cost_total] == 18 || imaginary_card_cost[occupy_id.card_cost_total] == 19 || imaginary_card_cost[occupy_id.card_cost_total] == 20 ||
					 imaginary_card_cost[occupy_id.card_cost_total] == 21 || imaginary_card_cost[occupy_id.card_cost_total] == 22)
		    {
		        var new_cost_text = "Enigma Berry";
		    }

    
			    sc_drawtext(x - 108, y + 30, "Card cost: +1 " + new_cost_text, global.color_card_light, global.color_black, 1, 1, 0, -1);
			}

		break;
		default:
		break;
	}
}
    
draw_sprite_general(sp_sheet, 0, 532, 0, sprite_width, sprite_height, x, y, 1, 1, 0, global.color_background_tile, global.color_background_tile, global.color_background_tile, global.color_background_tile, 1);
draw_sprite_general(sp_sheet, 0, 532, 0, sprite_width, sprite_height, x, y, 1, 1, 0, c_white, c_white, c_white, c_white, 0.4);
    
// This draws the total berries placed in the card space.
if berries_total > 0 {
	var i = 0;
	var var_berries_total;

	var_berries_total[0] = berries_total_type[0];
	var_berries_total[1] = berries_total_type[1];
	var_berries_total[2] = berries_total_type[2];
	var_berries_total[3] = berries_total_type[3];
	repeat (berries_total)
	{
	    var ii = 0, berry_drawn = false;
	    do
	    {
	        if var_berries_total[ii] > 0
	        {
	            draw_sprite_general(sp_sheet, 0, 16 * (ii + 1), 64, 5, 5, x + 5 + 6 * i, y + 70, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
	            var_berries_total[ii]--;
	            berry_drawn = true;
	        }
	        ii++;
	    } until (berry_drawn == true)
	    i++;
	}
}

//draw_set_halign(fa_left)
//draw_text(x+15,y + 80, card_bonus_atk);