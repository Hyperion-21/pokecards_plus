function sc_card_effect(argument0,argument1,argument2,argument3,argument4) {
/// @param x
/// @param y
/// @param effect_type
/// @param sub_depth
/// @param grow_effect
//————————————————————————————————————————————————————————————————————————————————————————————————————
var card_effect=instance_create_layer(argument0,argument1,"instances",ob_card_effect);
card_effect.effect_type=argument2;
card_effect.grow_effect=argument4;
//
if argument3=true { card_effect.depth=299; } //right above ob_card_space
else { card_effect.depth=-500; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
}