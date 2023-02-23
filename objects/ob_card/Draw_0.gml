draw_set_alpha(1);
//

if instance_exists(ob_control) { var reference_id=ob_control; }
else if instance_exists(ob_deckbuild) { var reference_id=ob_deckbuild; }
else if instance_exists(ob_event) { var reference_id=ob_event; }


//————————————————————————————————————————————————————————————————————————————————————————————————————
if effect_damaged>0 { var draw_x=x+irandom_range(-2,2), draw_y=y+irandom_range(-2,2); }
else{ var draw_x=x, draw_y=y; }
//
var rel_hud=ceil(ob_main.moving_hud);
//
var in_view=false;

// Missingno glitch
if card_id = 2001{
	var count1max = irandom_range(20,60);
	var count2max = irandom_range(20,60);
	var count3max = irandom_range(20,60);
	count[0] += 1;
	count[1] += 1;
	count[2] += 1;
	if count[0] >= count1max{
			var drawskew_x=irandom_range(-2,2), drawskew_y=irandom_range(-2,2);
			count[0] = 0;
			count1max = irandom_range(20,60);
		}else{
			var drawskew_x= 0, drawskew_y= 0;
		}
		if count[1] >= count2max{
			var drawskew_x2=irandom_range(-2,2), drawskew_y2=irandom_range(-2,2);
			count[1] = 0;
			count2max = irandom_range(20,60);
		}else{
			var drawskew_x2= 0, drawskew_y2= 0;
		}
		if count[2] >= count3max{
			var drawskew_x3=irandom_range(-2,2), drawskew_y3=irandom_range(-2,2);
			count[2] = 0;
			count3max = irandom_range(20,60);
		}else{
			var drawskew_x3= 0, drawskew_y3= 0;
		}		
	}else{
		var drawskew_x = 0;
		var drawskew_y = 0;
		var drawskew_x2 = 0;
		var drawskew_y2 = 0;
		var drawskew_x3 = 0;
		var drawskew_y3 = 0;
	}







if reference_id=ob_control or
(reference_id=ob_event and x>=screen_main_x-60 and x<=screen_main_x+cam_w+60) or
(reference_id=ob_deckbuild and x>=screen_deck_x-60 and x<=screen_deck_x+cam_w+60) {
	in_view=true;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_cat=0 and card_face=true and in_view=true {
	var card_chomp = false;
	var card_color=c_white, namebar_color=c_white;
	//
	if card_type_a=00 { namebar_color=make_colour_rgb(169,182,214); }
	else if card_type_a=01 { namebar_color=make_colour_rgb(174,214,170); }
	else if card_type_a=02 { namebar_color=make_colour_rgb(219,181,174); }
	else if card_type_a=03 { namebar_color=make_colour_rgb(170,191,214); }
	else if card_type_a=04 { namebar_color=make_colour_rgb(214,207,170); }
	else if card_type_a=05 { namebar_color=make_colour_rgb(170,177,214); }
	else if card_type_a=06 { namebar_color=make_colour_rgb(214,170,183); }
	else if card_type_a=07 { namebar_color=make_colour_rgb(214,170,171); }
	else if card_type_a=08 { namebar_color=make_colour_rgb(214,170,210); }
	else if card_type_a=09 { namebar_color=make_colour_rgb(214,186,170); }
	else if card_type_a=10 { namebar_color=make_colour_rgb(214,202,170); }
	else if card_type_a=11 { namebar_color=make_colour_rgb(200,214,170); }
	else if card_type_a=12 { namebar_color=make_colour_rgb(199,170,213); }
	else if card_type_a=13 { namebar_color=make_colour_rgb(172,214,208); }
	else if card_type_a=14 { namebar_color=make_colour_rgb(173,196,214); }
	else if card_type_a=15 { namebar_color=make_colour_rgb(175,205,214); }
	else if card_type_a=16 { namebar_color=make_colour_rgb(176,186,214); }
	else if card_type_a=17 { namebar_color=make_colour_rgb(191,177,214); }
	else if card_type_a=19 { namebar_color=make_colour_rgb(114,115,168); } //shadow
	else if card_type_a=20 { namebar_color=make_colour_rgb(218,237,255); } //crystal
	else if card_type_a=21 { namebar_color=make_colour_rgb(128,112,152); } //bird
	else if card_type_a=22 { namebar_color=make_colour_rgb(122,122,122); } //???

	//
	if card_innate= -1 { card_color=global.color_card_sacrificed; }
	else if card_innate=0 { card_color=global.color_card_light; }
	else if card_innate>=innate_max { card_color=namebar_color; }
	else if card_delete_timer>0 { card_color=global.color_gray; }
	//
	//CARD BASE
	if(card_innate < 0) {
		if(card_chomp){
			draw_sprite_general(sp_sheet,0,84,40,sprite_width,40,draw_x,draw_y+40,1,1,0,card_color,card_color,card_color,card_color,1);
		} else {
			draw_sprite_general(sp_sheet,0,84,0,sprite_width,sprite_height,draw_x,draw_y,1,1,0,card_color,card_color,card_color,card_color,1);
		}
	}
	else if card_enigma=false and card_secret=false {
		draw_sprite_general(sp_sheet,0,16*5+4,16*0,sprite_width,sprite_height,draw_x,draw_y,1,1,0,card_color,card_color,card_color,card_color,1);
	}
	else { 
		draw_sprite_general(sp_sheet,0,16*13+4,16*0,sprite_width,sprite_height,draw_x,draw_y,1,1,0,card_color,card_color,card_color,card_color,1); 
	}

/// HOLO FOIL
if card_holo = true
{
	var holo = sp_holo; // Set the sprite to use for animation
	var holo_speed = 0.09; // Set the animation speed
	draw_sprite_ext(holo, floor(holo_index), draw_x+5, draw_y+5, 1, 1, 0, namebar_color, 1);
	draw_sprite_ext(sp_holosparkle, floor(holo_index), draw_x+5, draw_y+5, 1, 1, 0, namebar_color, 1);// Draw the sprite using draw_sprite_ext() and the current image index
if card_shiny = true
{
	// Use the function to modify the color before drawing the sprite
	// Create event code


	var holocolor;
	var time = current_time / 1000; // Convert current_time to seconds
	var r = 0.5 + 0.5 * sin(2 * pi * (time / 12));
	var g = 0.5 + 0.5 * sin(2 * pi * (time / 6));
	var b = 0.5 + 0.5 * sin(2 * pi * (time / 3));
	holocolor = make_color_rgb(r * 255, g * 255, b * 255);

	draw_sprite_ext(holo, floor(holo_index), draw_x+5, draw_y+5, 1, 1, 0, holocolor, 0.2);
	draw_sprite_ext(sp_holosparkle, floor(holo_index), draw_x+5, draw_y+5, 1, 1, 0, holocolor, 0.2);// Draw the sprite using draw_sprite_ext() and the current image index

	}
	holo_index += holo_speed; // Advance the image index based on the animation speed
	if (holo_index >= sprite_get_number(holo)) 
		{
		  holo_index = 0; // Reset to the first frame when we reach the end of the animation
		}
}	

	//
	//INNATE LEVEL
	var i=0;
	if card_innate>1 {
		repeat (card_innate-1) {
			draw_sprite_general(sp_sheet,0,16*1,16*1,3,3,draw_x+27-((card_innate-2)*2)+(i*4),draw_y+3,1,1,0,card_color,card_color,card_color,card_color,1);
			i++;
		}
	}
	else if card_innate=0 {
		draw_sprite_general(sp_sheet,0,16*2,16*1,3,3,draw_x+27,draw_y+3,1,1,0,card_color,card_color,card_color,card_color,1);
	}
	else if card_innate=-1 {
		i=0;
		repeat (3) {
			if(card_chomp){
				draw_sprite_general(sp_sheet,0,16*2,16*1,3,3,draw_x+27-((2)*2)+(i*4),draw_y+65,1,1,0,card_color,card_color,card_color,card_color,1);
			} else {
				draw_sprite_general(sp_sheet,0,16*2,16*1,3,3,draw_x+27-((2)*2)+(i*4),draw_y+3,1,1,0,card_color,card_color,card_color,card_color,1);
			}
			i++;
		}
	}
	//
	//SHINY
	if card_shiny = true{
	draw_sprite_general(sp_sheet,0,48,16,32,6,draw_x+12,draw_y+33,1,1,0,card_color,card_color,card_color,card_color,1);
	draw_sprite_general(sp_sheet,0,48,22,32,12,draw_x+12,draw_y+33,1,1,0,c_white,c_white,c_white,c_white,1);
	}
	//
	//NAMEBAR
	draw_sprite_general(sp_sheet,0,16*1,16*2,53,10,draw_x+2,draw_y+41,1,1,0,namebar_color,global.color_white,global.color_white,namebar_color,1);
	
	//DELTA
	if card_delta = true{
	draw_sprite_general(sp_sheet,0,273,64,32,6,draw_x+13,draw_y+71,1,1,0,card_color,card_color,card_color,card_color,1);
	draw_sprite_general(sp_sheet,0,273,70,32,6,draw_x+13,draw_y+72,1,1,0,c_white,c_white,c_white,c_white,1);
	}	
	
	
	
	
	//SPRITE
	if(card_innate >= 0 || !card_chomp) && card_has_animate = false
	{
		draw_sprite_general(card_sheet,0,65*(card_grid_x-1)+1,33*(card_grid_y-1)+1,64,32,draw_x-4,draw_y+jumpy+3,1,1,0,c_white,c_white,c_white,c_white,1);
	} else if card_has_animate = true
	{
		var spr = anim_sp;

		
		anim_speed = 0.2;
		anim_index += anim_speed; // Advance the image index based on the animation speed
		if (anim_index >= sprite_get_number(spr)) 
			{
			  anim_index = 0; // Reset to the first frame when we reach the end of the animation
			}
		if sprite_get_width(spr) <= 47
		{
			var spr_width = sprite_get_width(spr);
			var add_spr = floor(sprite_get_width(spr)/5);
		}
		else
		{
			var spr_width = 47;
			var add_spr = 0;
		}
		if sprite_get_height(spr) <= 32
		{
			var spr_height = sprite_get_height(spr)/2;
		}
		else
		{
			var spr_height = 32;			
		}
		draw_sprite_general(spr,floor(anim_index),0,spr_height,spr_width,32,draw_x+5+add_spr,draw_y+5,1,1,0,c_white,c_white,c_white,c_white,1);
		if card_shiny = true
		{
			draw_sprite_general(sp_sheet,0,48,22,32,12,draw_x+12,draw_y+33,1,1,0,c_white,c_white,c_white,c_white,1);
		}
	}
	//
	//TYPES
	if card_innate >= 0 || !card_chomp {
		draw_sprite_general(sp_sheet,0,16*(card_type_a+1),16*5,12,11,(draw_x+drawskew_x)+2,(draw_y+drawskew_y)+2,1,1,0,c_white,c_white,c_white,c_white,1);
		if card_type_b>=0 { draw_sprite_general(sp_sheet,0,16*(card_type_b+1),16*5,12,11,(draw_x+drawskew_x2)+2,(draw_y+drawskew_y2)+12,1,1,0,c_white,c_white,c_white,c_white,1); }
	}
	//
	//GLYPHS
	if card_glyph_a>=0{
		draw_sprite_general(sp_sheet,0,16*(ob_main.ref_glyph_img[card_glyph_a]-1),16*6,12,11,(draw_x+drawskew_x)+43,(draw_y+drawskew_y)+2,1,1,0,c_white,c_white,c_white,c_white,1);
	}
	//else if card_glyph_a>=glyph_common_amount {
	//	draw_sprite_general(sp_sheet,0,16*(glyph_common_amount+1),16*6,12,11,draw_x+43,draw_y+2,1,1,0,c_white,c_white,c_white,c_white,1);
	//}
	if card_glyph_b>=0{
		draw_sprite_general(sp_sheet,0,16*(ob_main.ref_glyph_img[card_glyph_b]-1),16*6,12,11,(draw_x+drawskew_x2)+43,(draw_y+drawskew_y2)+12,1,1,0,c_white,c_white,c_white,c_white,1);
	}
	//else if card_glyph_b>=glyph_common_amount {
	//	draw_sprite_general(sp_sheet,0,16*(glyph_common_amount+1),16*6,12,11,draw_x+43,draw_y+12,1,1,0,c_white,c_white,c_white,c_white,1);
	//}
	if card_glyph_c>=0{
		draw_sprite_general(sp_sheet,0,16*(ob_main.ref_glyph_img[card_glyph_c]-1),16*6,12,11,(draw_x+drawskew_x3)+43,(draw_y+drawskew_y3)+22,1,1,0,c_white,c_white,c_white,c_white,1);
	}
	//else if card_glyph_c>=glyph_common_amount {
	//	draw_sprite_general(sp_sheet,0,16*(glyph_common_amount+1),16*6,12,11,draw_x+43,draw_y+22,1,1,0,c_white,c_white,c_white,c_white,1);
	//}
	//
	//COST
	if card_innate >= 0 || !card_chomp {
		var i=0;
		repeat (4) {
			if card_cost[i]>=0 { draw_sprite_general(sp_sheet,0,16*(card_cost[i]+1),16*3,4,4,((draw_x+drawskew_x)+3+4*i),(draw_y+drawskew_y)+35,1,1,0,c_white,c_white,c_white,c_white,1); }
			i++;
		}
	}
	//
	//ATTACK
	if reference_id=ob_control {
		if already_attacked=false and card_environment=false and card_played=true and card_trash=false and card_enemy=false and ob_control.battler_turn=1 and ob_control.turn_num>2 {
			var opposite_card=-1;
			for (var i=5; i<=9; i++;) {
				if ob_control.card_space_id[i].occupy_id=id and ob_control.card_space_id[i-5].occupy_id!=-1 {
					opposite_card=ob_control.card_space_id[i-5].occupy_id;
				}
			}
			if opposite_card!=-1 and sc_type_bonus(card_type_a,card_type_b,opposite_card.card_type_a,opposite_card.card_type_b) {
				draw_sprite_general(sp_sheet,0,16*2,16*15,16,16,(draw_x+drawskew_x2)+20,(draw_y+drawskew_y2)-8,1,1,0,c_white,c_white,c_white,c_white,1);
			}
			else {
				draw_sprite_general(sp_sheet,0,16*1,16*15,16,16,(draw_x+drawskew_x2)+20,(draw_y+drawskew_y2)-8,1,1,0,c_white,c_white,c_white,c_white,1);
			}
		}
	}
	//
	//STATS
	if card_environment=false { var var_level_rank=ceil(card_level/advantage_level_interval); } else { var var_level_rank=0; }
	draw_sprite_general(sp_sheet,0,16*17,16*var_level_rank,49,2,draw_x+4,draw_y+56,1,1,0,card_color,card_color,card_color,card_color,1);
	//
	draw_set_font(fn_m3x6);
	draw_set_halign(fa_center);
	sc_drawtext((draw_x+drawskew_x3)+29,(draw_y+drawskew_y3)+39,card_name,global.color_white,global.color_black,1,(1/1.5),0,-1);
	sc_drawtext((draw_x+drawskew_x)+29,(draw_y+drawskew_y)+50,"lv " + string(card_level),global.color_gray,global.color_black,1,(1/1.7),0,-1);
	//sc_drawtext(draw_x+29,draw_y+4,"#" + string(card_id) + "\nv " + string(card_value) + "\nfv " + string(card_form_value) + "\ns " + string(card_serial),c_aqua,c_black,1,1,0,-1);
	//
	
	//CALCULATE PREVIEW DAMAGE
	var num_color=c_white;
	draw_set_halign(fa_left);
	if card_atk > card_full_atk{num_color=global.color_friendly;}
	else if card_atk < card_full_atk {num_color=global.color_damage;}
	else {num_color=global.color_white; }	
	sc_drawtext((draw_x+drawskew_x)+5,(draw_y+drawskew_y)+66,string(card_atk),num_color,global.color_black,1,(1/1.7),0,-1);		
	draw_set_halign(fa_center);
	
	if card_hp<card_full_hp { num_color=global.color_damage; }
	else { num_color=global.color_fullhp; }
	if card_innate >= 0 || !card_chomp {
		sc_drawtext((draw_x+drawskew_x)+29,(draw_y+drawskew_y)+60,string(card_hp),num_color,global.color_black,1,(1/1.7),0,-1);
	}
	
	draw_set_halign(fa_right);
	if card_def<card_full_def { num_color=global.color_damage; }
	else if card_def>card_full_def { num_color=global.color_friendly; }
	else { num_color=global.color_white; }
	sc_drawtext((draw_x+drawskew_x)+53,(draw_y+drawskew_y)+66,string(card_def),num_color,global.color_black,1,(1/1.7),0,-1);
	//
	//DELETE
	if card_delete_timer>0 {
		draw_sprite_general(sp_sheet,0,16*37+4,16*0,57,80,draw_x,draw_y,1,1,0,c_white,c_white,c_white,c_white,1);
		draw_healthbar(draw_x+8,draw_y+55,draw_x+48,draw_y+58,card_delete_timer*100/card_delete_timer_max,global.color_black,global.color_damage,global.color_damage,0,true,false);
		//
		draw_set_font(fn_matchup);
		draw_set_halign(fa_center);
		
if card_holo = true && card_shiny = true && card_secret = true
{
	var 	bonus = 6
}
else if card_holo = true && card_shiny = true
{
	var 	bonus = 4
}
else if card_holo = true
{
	var bonus = 2;
}

else if card_shiny = true
{
	var 	bonus = 2
}
else if card_secret = true
{
	var 	bonus = 2
}
else
{
	var bonus = 1;
}
		if(card_innate = -1){
			sc_drawtext(draw_x+29,draw_y+11,"$1",global.color_card_light,global.color_black,1,1,0,-1);
		} else {
			sc_drawtext(draw_x+29,draw_y+11,"$" + string(round(card_value*sell_value_multiplier*bonus)),global.color_card_light,global.color_black,1,1,0,-1);
		}
		
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if card_cat=1 and card_face=true and in_view=true {
	var card_color=c_white;
	if reference_id=ob_deckbuild and mouse_x>=x and mouse_y>=y and mouse_x<x+sprite_width and mouse_y<y+sprite_height { card_color=global.color_gray; }
	//
	draw_sprite_general(sp_sheet,0,16*9+4,16*0,sprite_width,sprite_height,draw_x,draw_y,1,1,0,card_color,card_color,card_color,card_color,1);
	draw_sprite_general(sp_sheet,0,16*1,16*2,53,10,draw_x+2,draw_y+41,1,1,0,
	global.color_card_mid,global.color_card_light,global.color_card_light,global.color_card_mid,1);
	draw_sprite_general(sp_berries,0,32*(card_id-3000)+1,1,32,32,draw_x+12,draw_y+4,1,1,0,card_color,card_color,card_color,card_color,1);
	//
	draw_set_font(fn_m3x6);
	draw_set_halign(fa_center);
	sc_drawtext(draw_x+29,draw_y+39,card_name,global.color_white,global.color_black,1,(1/1.5),0,-1);
	//
	draw_sprite_general(sp_sheet,0,16*(card_id-3000+1),16*3,4,4,draw_x+26,draw_y+63,1,1,0,card_color,card_color,card_color,card_color,1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_set_font(fn_m6x11);
	draw_set_halign(fa_right);
	//
	if reference_id=ob_deckbuild and ob_deckbuild.deck_berry_total[card_id-3000]>0 {
		if ob_deckbuild.deck_berry_used[card_id-3000]=ob_deckbuild.deck_berry_total[card_id-3000] { var num_color=global.color_fullhp; }
		else if ob_deckbuild.deck_berry_used[card_id-3000]=0 { var num_color=global.color_damage; }
		else { var num_color=global.color_white; }
		//
		if ob_deckbuild.deck_berry_used[card_id-3000]<ob_deckbuild.deck_berry_total[card_id-3000] {
			draw_sprite_general(sp_sheet,0,16*9,16*9,16,16,draw_x+42,draw_y+53-rel_hud,1,1,0,c_white,c_white,c_white,c_white,0.8);
		}
		if ob_deckbuild.deck_berry_used[card_id-3000]>0 {
			draw_sprite_general(sp_sheet,0,16*10,16*9,16,16,draw_x+42,draw_y+72+rel_hud,1,1,0,c_white,c_white,c_white,c_white,0.8);
		}
		sc_drawtext(draw_x+54,draw_y+64,string(ob_deckbuild.deck_berry_used[card_id-3000]),num_color,global.color_black,1,0.8,0,-1);
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if card_face=false {
	if card_trash=false { var overlay_color=c_white; } else { var overlay_color=global.color_gray; }
	if card_cat=0 or card_enemy=true {
		draw_sprite_general(sp_sheet,0,16*25+4,16*0,sprite_width,sprite_height,draw_x,draw_y,1,1,0,overlay_color,overlay_color,overlay_color,overlay_color,1);
	}
	else if card_cat=1 {
		draw_sprite_general(sp_sheet,0,16*29+4,16*0,sprite_width,sprite_height,draw_x,draw_y,1,1,0,overlay_color,overlay_color,overlay_color,overlay_color,1);
	}
}
