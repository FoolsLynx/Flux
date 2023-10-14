///-------------------------------------------------------------------------
/// Example - Events - Pausing and Unpausing
///-------------------------------------------------------------------------
/// This example shows how to create a Sequence with events at certains
/// intervals in the sequence.
///
/// Read the description of objExample_Events for a basic undersstanding.
///
/// In this example, we have a variable called timer which will be used
/// to determine when to resume flux.
///
/// But first we need to pause flux. We do this with an event.
/// Like before we are adding an event at frame 60. This time we are
/// passing in both a caller and arguments.
/// 
/// Arguments are in the form of arrays, so our first argument is [0] 
/// which represents the number of frames to set the timer to.
///
/// So we first pause flux and then set our timer based on the argument 
/// in this case 120. Which is 2 seconds at 60fps. 
/// 
/// Once the timer in the object hits 0, it will resume Flux.
///
/// We add this event once more using addEvent passing in the:
/// frame, callback, caller and argument array.
///-------------------------------------------------------------------------

// Decrease our timer and resume if timer is 0.
if(timer > 0) {
	timer--;
	if(timer == 0) {
		flux_resume();	
	}
}

// Return if Flux is Running (Prevents Issues)
if(flux_is_running()) return;

// Only Run Code if Space has been pressed
if(!keyboard_check_pressed(vk_shift)) return;

// Create a Flux Sequence
var _sequence = flux_create(seqBarsRight);

// We want to add an event at the 60 frames mark
// This callback takes in the caller (this object) and an argument array that contains the time we are using
// We first pause flux and then we set our timer variable to the argument
var _callback = function(_caller, _args) {
	flux_pause();
	_caller.timer = _args[0];
}

// To add this to the event list we do the following
_sequence.addEvent(60, _callback, self, [120]);

// Now we can start the effect with flux_start or flux_start_ext
flux_start(_sequence);