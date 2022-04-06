function sc_glyph_text(argument0) {
/// @param glyph
//————————————————————————————————————————————————————————————————————————————————————————————————————
switch (argument0) {
	case 00: return "// LUCKY //\nAllows you to draw extra cards when played."; break;
	case 01: return "// HARVEST //\nConsumed berries return to your hand (if not full) when fainting."; break;
		case 02: return "// WEAKNESS //\nThe opposing card's attack is lowered."; break;
		case 03: return "// RUTHLESS //\nThe opposing card's defense is lowered."; break;
		case 04: return "// COURAGE //\nRaises attack of nearby friendly cards."; break;
		case 05: return "// PIERCING ATTACK //\nAlways attacks the enemy trainer directly."; break;
		case 06: return "// COUNTERATTACK //\nWhen attacked, the attacker is hurt for half of its current HP."; break;
		case 07: return "// SHIELD //\nRaises defense of nearby friendly cards."; break;
		case 08: return "// MEDIC //\nFully heals all friendly cards when played."; break;
	case 09: return "// TENACITY //\n50% chance: when fainting, returns to your hand (if not full)."; break;
	case 10: return "// BULWARK //\nSummons rocks on each empty side when played."; break;
	case 11: return "// FORK ATTACK //\nAttacks diagonally to its sides instead of straight ahead."; break;
		case 12: return "// VAMPIRE //\nHeals itself by absorbing life when attacking."; break;
		case 13: return "// CURSE //\nWhen fainting, the enemy card is left with 1 HP."; break;
	case 14: return "// MEMENTO //\nAllows you to draw extra cards when fainting."; break;
	//
	case 15: return "// MIST //\nWhile this card is active, glyphs have no effect."; break;
	case 16: return "// TRANSFORM //\nTransforms into the opposing enemy card."; break;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}