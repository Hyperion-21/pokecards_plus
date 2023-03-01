// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_determine_card_delta(){
	randomize();
	var roll = irandom_range(1,1000);
	if roll < 20
	{
		card_holo = true;
	}
	var roll2 = irandom_range(1,10)
	var rollmax = 2;
	
	if card_delta_type = -1 {
		
		if (card_type_b = -1 or (roll2 > rollmax)){  // checks if Pokemon is a dual type
			// water, ice, steel, normal, dragon, ghost 
			if (card_type_a = 03 or card_type_a = 13 or card_type_a = 15 or card_type_a = 00 or card_type_a = 14 or card_type_a = 16) // oran berry
			{
				card_delta_type = choose(01,04,12,11,05,10,02,07,08,06,09,17); // lum or leppa
			}
			// fire, psychic, fairy, fighting, ground, dark
			else if (card_type_a = 02 or card_type_a = 07 or card_type_a = 08 or card_type_a = 06 or card_type_a = 09 or card_type_a = 17) // leppa berry
			{
				card_delta_type = choose(03,13,15,00,14,16,01,04,12,11,05,10); // oran or lum
			}
			// grass, electric, poison, bug, flying, rock
			if (card_type_a = 01 or card_type_a = 04 or card_type_a = 12 or card_type_a = 11 or card_type_a = 05 or card_type_a = 10) // lum berry
			{
				card_delta_type = choose(03,13,15,00,14,16,02,07,08,06,09,17); // oran or leppa
			}	
			//card_delta_type = 20;
			
		}
		else  // if pokemon is a dual type, it rerolls for everything
		{
			 /// gives it a chance to stay the same berry type but never its same type.

						if card_type_a = 00 //normal
						{
							card_delta_type = choose (03,13,15,14,16);
						}
						else if card_type_a = 01 //grass
						{
							card_delta_type = choose (04,12,11,05,10);
						}
						else if card_type_a = 02 //fire
						{
							card_delta_type = choose (07,08,06,09,17);
						}
						else if card_type_a = 03 //water
						{
							card_delta_type = choose (13,15,00,14,16);
						}
						else if card_type_a = 04 //electric
						{
							card_delta_type = choose (01,12,11,05,10);
						}
						else if card_type_a = 05 //flying
						{
							card_delta_type = choose (01,04,12,11,10);
						}
						else if card_type_a = 06 //fighting
						{
							card_delta_type = choose (02,07,08,09,17);
						}
						else if card_type_a = 07 //psychic
						{
							card_delta_type = choose (02,08,06,09,17);
						}
						else if card_type_a = 08 //fairy
						{
							card_delta_type = choose (02,07,06,09,17);
						}
						else if card_type_a = 09 //ground
						{
							card_delta_type = choose (02,07,06,08,17);
						}
						else if card_type_a = 10 //rock
						{
							card_delta_type = choose (01,04,12,11,05);
						}
						else if card_type_a = 11 //bug
						{
							card_delta_type = choose (01,04,12,05,10);
						}
						else if card_type_a = 12 //poison
						{
							card_delta_type = choose (01,04,11,05,10);
						}
						else if card_type_a = 13 //ice
						{
							card_delta_type = choose (03,15,00,14,16);
						}
						else if card_type_a = 14 //dragon
						{
							card_delta_type = choose (03,13,15,00,16);
						}
						else if card_type_a = 15 //steel
						{
							card_delta_type = choose (03,13,00,14,16);
						}
						else if card_type_a = 16 //ghost
						{
							card_delta_type = choose (03,13,15,00,14);
						}
						else if card_type_a = 17 //dark
						{
							card_delta_type = choose (02,07,08,06,09);
						}
						//card_delta_type = 21;

		}
		
			
	}
			if (card_environment = true or card_secret = true)
			{
				card_delta = false;
			}
			else if card_delta = true
			{
				card_type_a = card_delta_type;
				card_type_b = -1;
			}
}