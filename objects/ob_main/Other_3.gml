
if instance_exists(ob_event)
{
	if ob_event.event_kind = ref_event_freecard or ob_event.event_kind = ref_event_cardpack or ob_event.event_kind = ref_event_holo_freecard or ob_event.event_kind = ref_event_delta or
		ob_event.event_kind = ref_event_cardpack_0 or ob_event.event_kind = ref_event_cardpack_1 or ob_event.event_kind = ref_event_cardpack_2 or ob_event.event_kind = ref_event_cardpack_3 or
		ob_event.event_kind = ref_event_cardpack_4 or ob_event.event_kind = ref_event_cardpack_5 or ob_event.event_kind = ref_event_cardpack_6 or ob_event.event_kind = ref_event_cardpack_7 or
		ob_event.event_kind = ref_event_cardpack_8 or ob_event.event_kind = ref_event_cardpack_9
		{
			roadmap_area++;	
		}
}
roadmap_area++;	
sc_data_save(false);
sc_data_save(true);