function flux_resume(){
	if(!flux_is_running()) return;
	
	if(is_undefined(global.__flux_sequence)) return;
	if(is_undefined(global.__flux_sequence.element)) return;
	
	layer_sequence_play(global.__flux_sequence.element);
	global.__flux_paused = false;
}