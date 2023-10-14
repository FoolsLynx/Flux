function __flux_draw(){
	if(!global.__flux_active || !surface_exists(global.__flux_surface)) return;
	
	draw_surface(global.__flux_surface, 0, 0);
}