// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_determine_starter_card(index, cards_pool)
{
   if (array_length(cards_pool) >= index) {
	   return irandom(normal_poke_id_max);
   }
   
   var cards = cards_pool[index];
   var rnd = irandom(sc_card_chance_sum(cards)-1);
   for(var i = 0; i < array_length(cards); i++)
   {
      rnd -= cards[i][0];
      if(rnd <= 0) {
		  return cards[i];
	  }
   }
   return cards[array_length(cards)-1];
}

function sc_card_chance_sum(cards){
	var sum = 0;
	
   for(var i = 0; i < array_length(cards); i++)
   {
      sum += cards[i][0];
   }
   return sum;
}