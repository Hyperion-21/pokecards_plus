if card_spawn=0 {
	ob_main.event_transition=3;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if count_berries=true {
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
	count_berries=false;
}