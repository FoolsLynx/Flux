function flux_start_ext(_seq, _callback = undefined, _caller = undefined, _speed = 1, _rotation = 0, _destroy = true){
	// Ensure any made using Flux Create uses the normal Flux Start.
	if(is_struct(_seq)) {
		flux_start(_seq);
		return;
	}
	
	__flux_clear_sequence_old();
	
	var _pos = __flux_camera_pos(_seq);
	
	global.__flux_sequence = __flux_create_sequence(_seq, _callback, _caller, _speed, _rotation, _destroy);
	__flux_place_sequence(global.__flux_sequence, _pos[0], _pos[1], global.__flux_layer);
	
	global.__flux_active = true;
	global.__flux_paused = false;
}