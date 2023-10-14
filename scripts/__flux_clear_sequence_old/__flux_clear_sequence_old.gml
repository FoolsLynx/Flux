function __flux_clear_sequence_old(){
	if(!is_undefined(global.__flux_sequence)) {
		if(!is_undefined(global.__flux_sequence_old)) {
			global.__flux_sequence_old.timer = 1;
			global.__flux_sequence_old.onTimer();
		}
		global.__flux_sequence_old = global.__flux_sequence;
		global.__flux_sequence_old.timer = 1;
		global.__flux_sequence = undefined;
	}
}