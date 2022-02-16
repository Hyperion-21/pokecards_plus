//OB_NPC
//————————————————————————————————————————————————————————————————————————————————————————————————————
if ob_char.jumping_state>0 { solid=false; }
else { solid=true; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if object_get_name(object_index)="ob_npc_001" and (event_trigger=true or event_state>0) {
	switch (event_state) {
		case 0: se_event(true);
		case 1: se_look(id,true,-1); break;
		case 2: se_text("fuck dude i just watched it a year and a half ago fuck Jesse Eisenberg man he fucked over Spiderman crazy Winklevoss Twins rowing trent resin or did the soundtrack",true,false); break;
		case 3: se_text("fuck this guy who invented Facebook i don't like dying i can't think of who the fuck invented Facebook",true,false); break;
		case 4: se_text("all i can think is the guy who played the guy who invented Facebook who the fuck invented Facebook?",true,true); break;
		case 5: se_walk(id,0,8); break;
		case 6: se_look(id,true,-1); break;
		case 7: se_text("MARK ZUCKERBERG",true,true); break;
		case 8: se_event(false); break;
	}
}