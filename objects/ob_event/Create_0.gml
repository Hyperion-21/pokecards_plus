depth=-1000;
//————————————————————————————————————————————————————————————————————————————————————————————————————
event_kind=ob_main.event_transition;
tooltip_text="";
tooltip_lines=0;
show_deck=false;
apply_event=false;
event_applied=false;
event_cancelled=false;
//
levelup_new_hp=0;
levelup_new_atk=0;
levelup_new_def=0;
//————————————————————————————————————————————————————————————————————————————————————————————————————
//count berries (same as ob_card)
for (var i=0; i<=3; i++;) {
	deck_berry_total[i]=0;
}
for (var i=0; i<ob_main.berrydeck_total; i++;) {
	deck_berry_total[ob_main.berry_card_id[i]-3000]++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if event_kind=ref_event_cardpack or event_kind=ref_event_berry {
	if event_kind=ref_event_cardpack {
		card_prize=5;
		var main_amount=5, berry_amount=1;
		//
		var i=0;
		repeat (card_prize) {
			if main_amount>0 and berry_amount>0 { create_card_cat=choose(0,1); }
			else if main_amount>0 and berry_amount=0 { create_card_cat=0; }
			else if main_amount=0 and berry_amount>0 { create_card_cat=1; }
			if create_card_cat=0 { main_amount--; }
			else { berry_amount--; }
			create_card_id=-1;
			//
			instance_create_layer(screen_main_x+83+(72*i),screen_main_y+104,"instances",ob_card);
			i++;
		}
	}
	else if event_kind=ref_event_berry {
		card_prize=4;
		var min_oran=1, min_leppa=1, min_lum=1;
		//
		var i=0;
		repeat (card_prize) {
			create_card_cat=1;
			if min_oran>0 and min_leppa>0 and min_lum>0 { create_card_id=choose(3000,3001,3002); }
			else if min_oran>0 and min_leppa>0 { create_card_id=choose(3000,3001); }
			else if min_oran>0 and min_lum>0 { create_card_id=choose(3000,3002); }
			else if min_leppa>0 and min_lum>0 { create_card_id=choose(3001,3002); }
			else if min_oran>0 { create_card_id=3000; }
			else if min_leppa>0 { create_card_id=3001; }
			else if min_lum>0 { create_card_id=3002; }
			else { create_card_id=-1; }
			//
			if create_card_id=3000 { min_oran--; }
			else if create_card_id=3001 { min_leppa--; }
			else if create_card_id=3002 { min_lum--; }
			//
			instance_create_layer(screen_main_x+118+(73*i),screen_main_y+104,"instances",ob_card);
			i++;
		}
	}
	
	button_create=instance_create_layer(screen_main_x+cam_w-24,screen_main_y+cam_h-24,"instances",ob_button_16x16);
	button_create.button_id=2;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if event_kind=ref_event_freecard {
	card_prize=1;
	var i=0;
	repeat (5) {
		create_card_cat=0;
		create_card_id=-1;
		//
		instance_create_layer(screen_main_x+83+(72*i),screen_main_y+104,"instances",ob_card);
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if event_kind=ref_event_grass or event_kind=ref_event_fire or event_kind=ref_event_water {
	//specific pokemon ids are checked manually when creating deck in tutorial
	//exact amount of cards and berries is also checked manually when entering tutorial
	//
	card_prize=10;
	var i=0;
	
	repeat (card_prize) {
		if i<=4 {
			//Left these here for the ids xD
			/*
			if i=0 and event_kind=ref_event_grass { create_card_id=001; } //bulbasaur
			else if i=1 and event_kind=ref_event_grass { create_card_id=152; } //chikorita
			else if i=2 and event_kind=ref_event_grass { create_card_id=252; } //treecko
			else if i=3 and event_kind=ref_event_grass { create_card_id=387; } //turtwig
			else if i=4 and event_kind=ref_event_grass { create_card_id=495; } //snivy
			else if i=5 and event_kind=ref_event_grass { create_card_id=650; } //chespin
			else if i=6 and event_kind=ref_event_grass { create_card_id=722; } //rowlet
			
			
			else if i=0 and event_kind=ref_event_fire { create_card_id=004; } //charmander
			else if i=1 and event_kind=ref_event_fire { create_card_id=155; } //cyndaquil
			else if i=2 and event_kind=ref_event_fire { create_card_id=255; } //torchic
			else if i=3 and event_kind=ref_event_fire { create_card_id=390; } //chimchar
			else if i=4 and event_kind=ref_event_fire { create_card_id=498; } //tepig
			else if i=5 and event_kind=ref_event_fire { create_card_id=653; } //fennekin
			else if i=6 and event_kind=ref_event_fire { create_card_id=725; } //litten
			
			else if i=0 and event_kind=ref_event_water { create_card_id=007; } //squirtle
			else if i=1 and event_kind=ref_event_water { create_card_id=158; } //totodile
			else if i=2 and event_kind=ref_event_water { create_card_id=258; } //mudkip
			else if i=3 and event_kind=ref_event_water { create_card_id=393; } //piplup
			else if i=4 and event_kind=ref_event_water { create_card_id=501; } //oshawott
			else if i=5 and event_kind=ref_event_water { create_card_id=656; } //froakie
			else if i=6 and event_kind=ref_event_water { create_card_id=728; } //popplio
			*/
			
			create_card_cat=0;
			
			// Gens 1-2
			if i=0 {
				switch (irandom(1)) {
					default:
						create_card_id=999;//Hit that placeholder :P
						break;
					case 0:
						if event_kind=ref_event_grass { create_card_id=001; } //bulbasaur
						else if event_kind=ref_event_fire { create_card_id=004; } //charmander
						else if event_kind=ref_event_water { create_card_id=007; } //squirtle
						break;
					case 1:
						if event_kind=ref_event_grass { create_card_id=152; } //chikorita
						else if event_kind=ref_event_fire { create_card_id=155; } //cyndaquil
						else if event_kind=ref_event_water { create_card_id=158; } //totodile
						break;
				}
			}
			
			// Gens 3-5
			if i=1 {
				switch (irandom(2)) {
					default:
						create_card_id=999;//Hit that placeholder :P
						break;
					case 0:
						if event_kind=ref_event_grass { create_card_id=252; } //treecko
						else if event_kind=ref_event_fire { create_card_id=255; } //torchic
						else if event_kind=ref_event_water { create_card_id=258; } //mudkip
						break;
					case 1:
						if event_kind=ref_event_grass { create_card_id=387; } //turtwig
						else if event_kind=ref_event_fire { create_card_id=390; } //chimchar
						else if event_kind=ref_event_water { create_card_id=393; } //piplup
						break;
					case 2:
						if event_kind=ref_event_grass { create_card_id=495; } //snivy
						else if event_kind=ref_event_fire { create_card_id=498; } //tepig
						else if event_kind=ref_event_water { create_card_id=501; } //oshawott
						break;
				}
			}
			
			// Gens 6-8
			if i=2 {
				switch (irandom(2)) {
					default:
						create_card_id=999;//Hit that placeholder :P
						break;
					case 0:
						if event_kind=ref_event_grass { create_card_id=650; } //chespin
						else if event_kind=ref_event_fire { create_card_id=653; } //fennekin
						else if event_kind=ref_event_water { create_card_id=656; } //froakie
						break;
					case 1:
						if event_kind=ref_event_grass { create_card_id=722; } //rowlet
						else if event_kind=ref_event_fire { create_card_id=725; } //litten
						else if event_kind=ref_event_water { create_card_id=728; } //popplio
						break;
					case 2:
						if event_kind=ref_event_grass { create_card_id=810; } //grookey
						else if event_kind=ref_event_fire { create_card_id=813; } //scorbunny
						else if event_kind=ref_event_water { create_card_id=816; } //sobble
						break;
				}
			}
			
			// Birds
			if i=3 {
				switch (irandom(7)) {
					default:
						create_card_id=999;//Hit that placeholder :P
						break;
					case 0:
						create_card_id=016; //Pidgey
						break;
					case 1:
						create_card_id=163; //Hoothoot
						break;
					case 2:
						create_card_id=276; //Tailow
						break;
					case 3:
						create_card_id=396; //Starly - Not all birbs are born equal xD
						break;
					case 4:
						create_card_id=519; //Pidove
						break;
					case 5:
						create_card_id=661; //Fletchling - Not all birbs are born equal xD
						break;
					case 6:
						create_card_id=731; //Pikipek
						break;
					case 7:
						create_card_id=821; //Rookidee
						break;
				}
			}
			
			// Rodents
			if i=4 {
				switch (irandom(7)) {
					default:
						create_card_id=999;//Hit that placeholder :P
						break;
					case 0:
						create_card_id=019; //Rattata
						break;
					case 1:
						create_card_id=161; //Sentret
						break;
					case 2:
						create_card_id=263; //Zigzagoon
						break;
					case 3:
						create_card_id=399; //Bidoof
						break;
					case 4:
						create_card_id=504; //Patrat
						break;
					case 5:
						create_card_id=659; //Bunnelby
						break;
					case 6:
						create_card_id=734; //Yungoos
						break;
					case 7:
						create_card_id=819; // Skwovet
						break;
				}
			}
			
			
			//Template to add more
			/*
			if i=5 {
				switch (irandom(6)) {
					default:
						create_card_id=999;//Hit that placeholder :P
						break;
					case 0:
						create_card_id=
						break;
					case 1:
						create_card_id=
						break;
					case 2:
						create_card_id=
						break;
					case 3:
						create_card_id=
						break;
					case 4:
						create_card_id=
						break;
					case 5:
						create_card_id=
						break;
					case 6:
						create_card_id=
						break;
					
				}
			}
			*/
			create_card_level=1;
			create_card_glyph_a=-1;
			create_card_glyph_b=-1;
			create_card_glyph_c=-1;
			create_card_innate=1;
			create_card_form_value=0;//Leave forms low so no one gets alolan rattata(unplayable without leppas)
		}
		else {
			create_card_cat=1;
			if i<=5 { create_card_id=3000; } //oran
			//else { create_card_id=3001; } //leppa
			//else { create_card_id=3002; } //lum
		}
		
		//
		
		
		if i<=4 { var card_x=screen_main_x+83+(72*i), card_y=screen_main_y+104-47; }
		else { var card_x=screen_main_x+83+(72*(i-5)), card_y=screen_main_y+104+47; }
		
		/*
		if i<=6 { var card_x=screen_main_x+36+(62*i), card_y=screen_main_y+104-47; }
		else { var card_x=screen_main_x+36+(62*(i-7)), card_y=screen_main_y+104+47; }
		*/
		instance_create_layer(card_x,card_y,"instances",ob_card);		
		i++;
	}
	//
	button_create=instance_create_layer(screen_main_x+cam_w-24,screen_main_y+cam_h-24,"instances",ob_button_16x16);
	button_create.button_id=2;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if event_kind=ref_event_levelup or event_kind=ref_event_evolution or
event_kind=ref_event_glyph or event_kind=ref_event_tribute or 
event_kind=ref_event_campfire or event_kind=ref_event_sacrifice or 
event_kind=ref_event_megaevolve or event_kind=ref_event_changeform  or event_kind=ref_event_deglyph {
	show_deck=true;
	//
	inventory_x=4;
	inventory_y=4;
	hold_inventory_bar=false;

	deck_x=4;
	deck_y=204;
	hold_deck_bar=false;
	
	//
	if event_kind=ref_event_glyph {
		glyph_add_id=ob_main.current_glyph_add;
	}
	//
	
	evolution_retry=false;
	evolution_position=0;
	for (var i=0; i<8; i++;) {
		evo_list[i]=-1;
	}
	//
	card_event_inventory_total=0;
	card_event_total=0;
	var i=0;
	repeat (ob_main.maindeck_total) {
		if ob_main.serial_card_indeck[ob_main.main_card_serial[i]][0]=true {
			card_event_total++;
		} else {
			card_event_inventory_total++;
		}
		i++;
	}
	//
	var i=0, ii=0, iii=0;
	repeat (ob_main.maindeck_total) {
			create_card_cat=0;
			create_card_id=ob_main.main_card_id[i];
			create_card_level=ob_main.main_card_level[i];
			create_card_glyph_a=ob_main.main_card_glyph_a[i];
			create_card_glyph_b=ob_main.main_card_glyph_b[i];
			create_card_glyph_c=ob_main.main_card_glyph_c[i];
			create_card_innate=ob_main.main_card_innate[i];
			create_card_form_value=ob_main.main_card_form_value[i];
			//
			if ob_main.serial_card_indeck[ob_main.main_card_serial[i]][0]=true {
				card_event[ii]=instance_create_layer(x,y,"instances",ob_card);
				card_event[ii].num_in_all=i;
				//
				ii++;
			} else {
				card_inventory[iii]=instance_create_layer(x,y,"instances",ob_card);
				card_inventory[iii].num_in_all=i;
				//
				iii++;
			}
		i++;
	}
	//
	var spacing = 71;
	if event_kind=ref_event_tribute or event_kind=ref_event_sacrifice {
		var spacing = 142-35;
		event_space_total=2;
		for (var i=0; i<event_space_total; i++;) {
			event_space_id[i]=instance_create_layer(screen_main_x+227-35+71*i,screen_main_y+109,"instances",ob_card_space);
		}
	}
	else {
		var spacing = 71;
		event_space_total=1;
		for (var i=0; i<event_space_total; i++;) {
			event_space_id[i]=instance_create_layer(screen_main_x+227,screen_main_y+109,"instances",ob_card_space);
		}
	}
	//
	var i=0, button_create;
	repeat (2) {
		button_create=instance_create_layer(screen_main_x+227+spacing,screen_main_y+117+42*i,"instances",ob_button_31x24);
		button_create.button_id=i;
		i++;
	}
}