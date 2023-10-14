function __flux_layer_end(){
	if(!global.__flux_active) return;
	
	if(event_type != ev_draw) return;
	if(event_number != 0) return;
	
	surface_reset_target();
}