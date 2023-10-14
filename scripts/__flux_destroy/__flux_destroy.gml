function __flux_destroy(){
	time_source_stop(global.__flux_tick);
	time_source_destroy(global.__flux_tick);
	
	global.__flux_tick = undefined;
	
	if(!is_undefined(global.__flux_sequence)) {
		if(!is_undefined(global.__flux_sequence.element)) {
			layer_sequence_destroy(global.__flux_sequence.element);
		}
		global.__flux_sequence = undefined;
	}
	
	if(!is_undefined(global.__flux_sequence_old)) {
		if(!is_undefined(global.__flux_sequence_old.element)) {
			layer_sequence_destroy(global.__flux_sequence_old.element);
		}
		global.__flux_sequence_old = undefined;
	}
}