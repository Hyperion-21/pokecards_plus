depth=-1000;
//————————————————————————————————————————————————————————————————————————————————————————————————————
event_kind=1;
tooltip_text="";
//————————————————————————————————————————————————————————————————————————————————————————————————————
if event_kind=1 { //booster pack
	card_spawn=5;
	var i=0, main_amount=3, berry_amount=2;
	repeat (card_spawn) {
		if main_amount>0 and berry_amount>0 { create_card_cat=choose(0,1); }
		else if main_amount>0 and berry_amount=0 { create_card_cat=0; }
		else if main_amount=0 and berry_amount>0 { create_card_cat=1; }
		if create_card_cat=0 { main_amount--; }
		else { berry_amount--; }
		//
		event_card[i]=instance_create_layer(ob_main.screen_main_x+83+(72*i),ob_main.screen_main_y+104,"instances",ob_card);
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var i=0;
repeat (4) {
	deck_berry_total[i]=0;
	i++;
}
var i=0;
repeat (ob_main.berrydeck_total) {
	deck_berry_total[ob_main.berry_card_id[i]-3000]++;
	i++;
}