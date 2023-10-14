function __flux_create_surface(){
	if(is_undefined(global.__flux_surface)) {
		global.__flux_surface = -1;	
	}
	
	if(!surface_exists(global.__flux_surface)) {
		surface_free(global.__flux_surface);
		global.__flux_surface = surface_create(FLUX_SURFACE_WIDTH, FLUX_SURFACE_HEIGHT);
	}
}