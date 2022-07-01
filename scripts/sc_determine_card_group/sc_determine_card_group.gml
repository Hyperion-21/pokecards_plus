// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_determine_card_group(group_pool)
{
   var rnd = irandom(sc_group_chance_sum(group_pool)-1);
   for(var i = 0; i < array_length(group_pool); i++)
   {
      rnd -= group_pool[i][0];
      if(rnd <= 0) {
		  return group_pool[i][1];
	  }
   }
   return group_pool[array_length(group_pool)-1];
}

function sc_group_chance_sum(group_pool){
	var sum = 0;
	
   for(var i = 0; i < array_length(group_pool); i++)
   {
      sum += group_pool[i][0];
   }
   return sum;
}