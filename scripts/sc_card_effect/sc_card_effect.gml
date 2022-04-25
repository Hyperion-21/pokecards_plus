function sc_card_effect(argument0,argument1,argument2,argument3) {
/// @param x
/// @param y
/// @param effect_type
/// @param sub_depth
//————————————————————————————————————————————————————————————————————————————————————————————————————
var card_effect=instance_create_layer(argument0,argument1,"instances",ob_card_effect);
card_effect.effect_type=argument2;
//
if argument3=true { card_effect.depth=299; } //right above ob_card_space
else { card_effect.depth=-500; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
}