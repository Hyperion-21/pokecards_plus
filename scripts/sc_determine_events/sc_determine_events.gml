// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_determine_events(events)
{
   var rnd = irandom(sc_event_chance_sum(events)-1);
   for(var i = 0; i < array_length(events); i++)
   {
      rnd -= events[i][0];
      if(rnd <= 0) {
		  return events[i];
	  }
   }
   return events[array_length(events)-1];
}

function sc_event_chance_sum(events){
	var sum = 0;
	
   for(var i = 0; i < array_length(events); i++)
   {
      sum += events[i][0];
   }
   return sum;
}