///-------------------------------------------------------------------------
/// Example - Room Swap (Events)
///-------------------------------------------------------------------------
/// This example shows a way to swap between rooms while using a single
/// sequence and events
///
/// First we create a Flux Sequence with flux_create passing in the
/// sequence we are going to use.
///
/// We then add an event at a point where a transition will not be seen.
/// The function we use prepares for the transition but we pass in -1
/// and set preserve to true before we switch room.
///-------------------------------------------------------------------------


// Return if Flux is Running (Prevents Issues)
if(flux_is_running()) return;

// Only Run Code if Space has been pressed
if(!keyboard_check_pressed(vk_right)) return;

// Create the Flux Sequence
var _sequence = flux_create(seqBarsRight);

// Add an event in the middle that handles the room change
_sequence.addEvent(60, function() {
	flux_room_prepare(-1, true);
	room_goto(room == rmExample ? rmExample2 : rmExample);
});

// Start the Flux Event
flux_start(_sequence);