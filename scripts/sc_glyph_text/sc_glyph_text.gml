function sc_glyph_text(argument0) {
/// @param glyph
//————————————————————————————————————————————————————————————————————————————————————————————————————
switch (argument0) {
	case ob_main.ref_glyph_lucky: return "// LUCKY //\nGrants 2 DP (Draw Points) when played."; break;
	case ob_main.ref_glyph_harvest: return "// HARVEST //\nConsumed berries return to hand (if not full) when fainting."; break;
	case ob_main.ref_glyph_weakness: return "// WEAKNESS //\nThe opposing card's attack is lowered by 1."; break;
	case ob_main.ref_glyph_ruthless: return "// RUTHLESS //\nThe opposing card's defense is lowered by 2."; break;
	case ob_main.ref_glyph_courage: return "// COURAGE //\nRaises attack of nearby friendly Pokemon by 2."; break;
	case ob_main.ref_glyph_piercing: return "// PIERCING ATTACK //\nAlways attacks the enemy trainer directly."; break;
	case ob_main.ref_glyph_counter: return "// COUNTERATTACK //\nWhen attacked, the attacker is also hurt (without fainting)."; break;
	case ob_main.ref_glyph_shield: return "// SHIELD //\nRaises defense of nearby friendly Pokemon by 1."; break;
	case ob_main.ref_glyph_medic: return "// MEDIC //\nFully heals all friendly cards when played."; break;
	case ob_main.ref_glyph_tenacity: return "// TENACITY //\nWhen fainting, it has a 50% chance to return to hand (if not full)."; break;
	case ob_main.ref_glyph_bulwark: return "// BULWARK //\nSummons rocks on each empty side when played."; break;
	case ob_main.ref_glyph_fork: return "// FORK ATTACK //\nAttacks diagonally to its sides instead of straight ahead."; break;
	case ob_main.ref_glyph_vampire: return "// VAMPIRE //\nWhen attacking another card, half of the damage is absorbed."; break;
	case ob_main.ref_glyph_curse: return "// CURSE //\nWhen fainting, the enemy card is left with 1 HP."; break;
	case ob_main.ref_glyph_memento: return "// MEMENTO //\nGrants 2 DP (Draw Points) when fainting."; break;
	case ob_main.ref_glyph_berserk: return "// BERSERK //\nWhen HP is 1, base attack is doubled."; break;
	case ob_main.ref_glyph_adaptability: return "// ADAPTABILITY //\nType advantage deals 2 extra damage instead of 1."; break;
	//
	case ob_main.ref_glyph_mist: return "// MIST //\nWhile this card is active, glyphs have no effect."; break;
	case ob_main.ref_glyph_transform: return "// TRANSFORM //\nTransforms into the opposing enemy Pokemon."; break;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}