function sc_textbox(argument0) {
/// @param message_set
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument0=0 {
	ob_main.textbox_string[0]="Welcome to the world of Pokemon cards!";
	ob_main.textbox_string[1]="I am Prof. Aspen of the Hourou region, here to help you with the basics.";
	ob_main.textbox_string[2]="Do you think you have what it takes to be a Crystal League Champion? Well, let's start from the beginning! Pick your Starter Deck.";
}
else if argument0=1 {
	ob_main.textbox_string[0]="Excellent choice! Now go to your deck and equip your newly acquired cards. Make sure to include all of your berries too, you'll need them!";
	ob_main.textbox_string[1]="When you're done, come back here and let's get things started. Or, if you're already familiar with the rules, feel free to get a Payout instead!";
}
else if argument0=2 {
	ob_main.textbox_string[0]="Please go to your deck and equip all of your newly acquired cards!";
}
else if argument0=3 {
	ob_main.textbox_string[0]="Alright, here we go! Are you ready?";
}
else if argument0=4 { //new turn
	ob_main.textbox_string[0]="Welcome to card battling! Don't worry if it seems complicated at first, the rules are actually quite simple!";
	ob_main.textbox_string[1]="It's your turn first, so let's start by drawing cards.\nOn your first turn, you always get 5 Draw Points, or \"DP\". These are used to draw Pokemon and berries from your decks.";
	ob_main.textbox_string[2]="Drawing a Pokemon (from the deck on your right) costs 2 DP, while drawing berries (from the deck on your left) costs only 1 DP. Berries are necessary to play your Pokemon, so both are important.";
	ob_main.textbox_string[3]="Anyway, you have 5 DP, which means you can draw right now! Go ahead and draw, let's say, 2 Pokemon and 1 berry.";
}
else if argument0=5 { //drawn
	ob_main.textbox_string[0]="Good! It seems both of your Pokemon require 1 Oran Berry to be played, you can see the little berry icon next to their picture. Play the Oran Berry you just got anywhere you want, and then play your Rattata on top of it.";
	ob_main.textbox_string[1]="Pokemon can't attack during your first turn, so once your Rattata is played, click the big green button to end your turn.";
}
else if argument0=6 { //new turn
	ob_main.textbox_string[0]="I played my Rattata as well, but since it was my first turn, I couldn't attack either.";
	ob_main.textbox_string[1]="It is now your turn again! You get 2 DP on all turns after your first. Go ahead and draw two more berries, so that you can play your Pidgey!";
}
else if argument0=7 { //drawn
	ob_main.textbox_string[0]="Good! Play your Pidgey in front of my Rattata, blocking it. Then, attack with both your Pokemon by clicking on them!";
}
else if argument0=8 { //attacked
	ob_main.textbox_string[0]="Good job! Your Pidgey attacked my Rattata, dealing damage equal to your Pidgey's attack minus my Rattata's defense. And your Rattata was unopposed, attacking my Hit Points directly.";
	ob_main.textbox_string[1]="As you can see on the right, the Hit Points bar is now tipped in your favor. Each point of damage dealt directly reduces your opponent's Hit Points while increasing your own. You already took an early step towards victory!";
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}