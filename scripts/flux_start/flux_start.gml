function flux_start(_seq){
	__flux_clear_sequence_old();
	
	var _pos = [0, 0];
	if(!is_struct(_seq)) {
		global.__flux_sequence = __flux_create_sequence(_seq);
		_pos = __flux_camera_pos(_seq);
	} else {
		global.__flux_sequence = _seq;
		_pos = __flux_camera_pos(_seq.sequence);
	}
	
	__flux_place_sequence(global.__flux_sequence, _pos[0], _pos[1], global.__flux_layer);
	
	global.__flux_active = true;
	global.__flux_paused = false;
}