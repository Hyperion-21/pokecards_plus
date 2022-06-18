// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_array_sum(array){
	var sum = 0;
	
   for(var i = 0; i < array_length(array); i++)
   {
      sum += array[i];
   }
   return sum;
}