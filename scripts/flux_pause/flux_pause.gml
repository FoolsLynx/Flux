function flux_pause(){
	if(!flux_is_running()) return;
	
	if(is_undefined(global.__flux_sequence)) return;
	if(is_undefined(global.__flux_sequence.element)) return;
	
	layer_sequence_pause(global.__flux_sequence.element);
	global.__flux_paused = true;
}