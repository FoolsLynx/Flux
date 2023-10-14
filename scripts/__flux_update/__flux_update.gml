function __flux_update(){
	// Ensure that a instance exists
	if(!instance_exists(global.__flux_object)) global.__flux_object = instance_create_depth(0, 0, FLUX_SEQUENCE_LAYER_DEPTH, objFluxController);	
	
	// Ensure Layers are Set Correctly
	if(global.__flux_layer == -1) __flux_room_start();
	
	// Destroy Old Sequence
	if(!is_undefined(global.__flux_sequence_old)) {
		if(global.__flux_sequence_old.onTimer()) {
			global.__flux_sequence_old = undefined;	
		}
	}
	
	// Return if not active
	if(!global.__flux_active) {
		global.__flux_headpos_old = -1;
		return;
	}
	
	// Get the last frame pos
	global.__flux_headpos_old = global.__flux_headpos;
	global.__flux_headpos = layer_sequence_get_headpos(global.__flux_sequence.element);
	
	// Return if paused
	if(global.__flux_paused) return;
	
	// Don't run if no sequence exists
	if(is_undefined(global.__flux_sequence)) {
		global.__flux_active = false;
		return;
	}
	
	// Handle Flux Events
	global.__flux_sequence.onTick();
	
	// Return if current sequence is playing
	if(!global.__flux_sequence.isFinished()) return;
	
	// Get Callbacks
	var _callback = global.__flux_sequence.callback;
	var _caller = global.__flux_sequence.caller;
	
	// Handle Destruction
	if(global.__flux_sequence.destroy) {
		global.__flux_sequence_old = global.__flux_sequence;
		global.__flux_sequence_old.timer = 1;
		global.__flux_sequence = undefined;
	}
	
	// Handle Callbacks
	if(!is_undefined(_callback)) _callback(_caller);
	
	// Clear Variables
	if(is_undefined(global.__flux_sequence)) {
		global.__flux_active = false;	
	}
}