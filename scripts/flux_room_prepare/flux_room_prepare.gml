function flux_room_prepare(_seq, _preserve = false){
	if(is_undefined(_seq) || _seq < 0) {
		_seq = flux_create_ext(global.__flux_sequence.sequence, global.__flux_sequence.callback, global.__flux_sequence.caller, global.__flux_sequence.spd, global.__flux_sequence.rotation, global.__flux_sequence.destroy);
	} else if(!is_struct(_seq)) {
		_seq = flux_create(_seq);
	}
	
	global.__flux_sequence_target = _seq;
	global.__flux_sequence_preserve = _preserve;
}