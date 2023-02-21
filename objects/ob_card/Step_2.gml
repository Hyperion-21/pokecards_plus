if marked = true
{
	if ob_deckbuild.reorder_type=-1
	{
			ob_deckbuild.reorder_swap_standby=ob_deckbuild.reorder_selected;
			ob_deckbuild.reorder_type=10;
			instance_destroy();
	}
}