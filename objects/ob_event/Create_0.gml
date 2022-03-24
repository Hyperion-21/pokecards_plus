depth=-1000;
//————————————————————————————————————————————————————————————————————————————————————————————————————
count_berries=true;
tooltip_text="";
//————————————————————————————————————————————————————————————————————————————————————————————————————
if ob_main.event_transition=3 { //booster pack
	card_spawn=5;
	var i=0, main_amount=3, berry_amount=2;
	repeat (card_spawn) {
		if main_amount>0 and berry_amount>0 { create_card_cat=choose(0,1); }
		else if main_amount>0 and berry_amount=0 { create_card_cat=0; }
		else if main_amount=0 and berry_amount>0 { create_card_cat=1; }
		if create_card_cat=0 { main_amount--; }
		else { berry_amount--; }
		create_card_id=-1;
		//
		instance_create_layer(ob_main.screen_main_x+83+(72*i),ob_main.screen_main_y+104,"instances",ob_card);
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if ob_main.event_transition>=100 { //starter pack
	card_spawn=10;
	var i=0;
	repeat (card_spawn) {
		if i<=4 {
			create_card_cat=0;
			if i=0 and ob_main.event_transition=100 { create_card_id=001; } //bulbasaur
			else if i=0 and ob_main.event_transition=101 { create_card_id=004; } //charmander
			else if i=0 and ob_main.event_transition=102 { create_card_id=007; } //squirtle
			else if i=1 { create_card_id=016; } //pidgey
			else if i=2 { create_card_id=019; } //rattata
			else if i=3 { create_card_id=010; } //caterpie
			else if i=4 { create_card_id=013; } //weedle
			create_card_level=1;
			create_card_glyph_a=-1;
			create_card_glyph_b=-1;
			create_card_glyph_c=-1;
		}
		else {
			create_card_cat=1;
			if i<=6 { create_card_id=3000; } //oran
			else if i<=8 { create_card_id=3001; } //leppa
			else { create_card_id=3002; } //lum
		}
		//
		if i<=4 { var card_x=ob_main.screen_main_x+83+(72*i), card_y=ob_main.screen_main_y+104-47; }
		else { var card_x=ob_main.screen_main_x+83+(72*(i-5)), card_y=ob_main.screen_main_y+104+47; }
		instance_create_layer(card_x,card_y,"instances",ob_card);
		i++;
	}
}