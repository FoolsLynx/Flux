function __flux_room_start(){
	if(!layer_exists(FLUX_SEQUENCE_LAYER_NAME)) {
		layer_create(FLUX_SEQUENCE_LAYER_DEPTH, FLUX_SEQUENCE_LAYER_NAME);	
	}
	
	global.__flux_layer = layer_get_id(FLUX_SEQUENCE_LAYER_NAME);
	
	if(!layer_exists(global.__flux_layer)) {
		__flux_trace($"Could not find a valid layer with name \"{FLUX_SEQUENCE_LAYER_NAME}\"!", true);
	}
	
	layer_script_begin(global.__flux_layer, __flux_layer_begin);
	layer_script_end(global.__flux_layer, __flux_layer_end);
	
	if(global.__flux_sequence_target != undefined) {
		
		flux_start(global.__flux_sequence_target);
		if(global.__flux_sequence_preserve) {
			layer_sequence_headpos(global.__flux_sequence.element, global.__flux_headpos);		
			global.__flux_sequence_preserve = false;
		}
		global.__flux_sequence_target = undefined;
		
		
	}
}