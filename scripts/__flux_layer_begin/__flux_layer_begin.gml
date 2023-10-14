function __flux_layer_begin(){
	if(!global.__flux_active) return;
	
	if(event_type != ev_draw) return;
	if(event_number != 0) return;
	
	if(!surface_exists(global.__flux_surface)) {
		__flux_create_surface();	
	}
	
	surface_set_target(global.__flux_surface);
	draw_clear_alpha(FLUX_SURFACE_CLEAR_COLOUR, FLUX_SURFACE_CLEAR_ALPHA);
}