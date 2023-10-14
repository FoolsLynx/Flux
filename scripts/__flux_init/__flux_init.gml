__flux_init();
function __flux_init(){
	if(variable_global_exists("__flux")) return;
	
	try {
		global.__flux_tick = time_source_create(time_source_global, 1, time_source_units_frames, __flux_update, [], -1);
		time_source_start(global.__flux_tick);
	} catch(e) {
		__flux_trace("Failed to create \"Flux Time Source\" in __flux_init!", true);
	}
	
	
	global.__flux_active = false;
	
	global.__flux_sequence = undefined;
	global.__flux_sequence_old = undefined;
	global.__flux_sequence_target = undefined;
	
	global.__flux_sequence_preserve = false;
	
	global.__flux_layer = -1;
	global.__flux_surface = -1;
	
	global.__flux_paused = false;
	
	global.__flux_object = undefined;
	
	global.__flux_headpos = -1;
	global.__flux_headpos_old = -1;
	
	global.__flux_init = true;
	
	
}