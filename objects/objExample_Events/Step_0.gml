///-------------------------------------------------------------------------
/// Example - Events
///-------------------------------------------------------------------------
/// This example shows how to create a Sequence with events at certains
/// intervals in the sequence.
///
/// First we create a Flux Sequence using flux_create passing in the sequence
/// we are using.
///
/// We then create a callback function that takes the caller as a parameter.
/// Using this we are showing a debug message that display the object name.
///
/// This callback is then added to the event list at a given frame. In this
/// case on frame 60 we are calling this function. 
///
/// We add our callback using the addEvent function contained within the
/// Flux Sequence. This takes in the frame, callback and caller.
///
/// We then use flux_start to trigger the sequence. 
///-------------------------------------------------------------------------


// Return if Flux is Running (Prevents Issues)
if(flux_is_running()) return;

// Only Run Code if Space has been pressed
if(!keyboard_check_pressed(vk_tab)) return;

// Create a Flux Sequence
var _sequence = flux_create(seqBarsRight);

// We want to add an event at the 60 frames mark
// This callback function takes in the caller as a parameter and we are using the caller to get the object name
var _callback = function(_caller) {
	show_debug_message($"Flux: This event was called by {object_get_name(_caller.object_index)} at 60 frames.");
}

// To add this to the event list we do the following
_sequence.addEvent(60, _callback, self);

// Now we can start the effect with flux_start or flux_start_ext
flux_start(_sequence);