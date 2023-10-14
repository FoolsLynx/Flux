///-------------------------------------------------------------------------
/// Example - Room Swap
///-------------------------------------------------------------------------
/// This example shows a way to swap between rooms and transition without
/// issue.
///
/// First we create a callback function. This function is called when our
/// fade out transition is completed.
/// 
/// We need to prepare the next room with a sequence. We do this with
/// flux_room_prepare and we pass in a Flux Sequence created with
/// flux_create. Once that is done we are switching room.
///-------------------------------------------------------------------------


// Return if Flux is Running (Prevents Issues)
if(flux_is_running()) return;

// Only Run Code if Space has been pressed
if(!keyboard_check_pressed(vk_alt)) return;

// Create a Callback that changes the room and then starts the fade in transition
var _callback = function() {
	var _seq = flux_create(seqSimpleFadeIn);
	flux_room_prepare(_seq);
	room_goto(room == rmExample ? rmExample2 : rmExample);
}


// Start our fade out, once that has finished, we create the fade in sequence
flux_start_ext(seqSimpleFadeOut, _callback, undefined, 1, 0, false);