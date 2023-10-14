#-------------------------------------------------------#
#					Flux - Version 2.0.0				#
#						Fool Studios					#
#-------------------------------------------------------#

What is Flux?
	Flux is a plugin that allows for the use of sequences as transitions
ensuring that they are drawn above the GUI layer.

How does it work?
	Flux handles basically everything you need for handling transitions.
All that you will need to do is create sequences for your transitions
and then utilise the functions to initialise transitions.

How to install:
	1. Import the Flux.yymps
	2. Modify the macros in (Configuration) to fit your game.
	3. Done
	
I have a custom camera system. Will flux work?
	Flux draws transitions to a seperate surface, all that flux needs
to do is place the sequences correctly based on the camera. Flux needs
the top left corner point of your camera and the width and height of 
the camera's view. 

	By modifying the "flux_camera_custom_pos" function you will be
able to use your camera system with flux. Unfortunetly, there is no
one size fits all when it comes to camera systems. 

	Flux by default uses view_camera[0] (can be changed with macros)
and gets the X, Y, Width and Height from that and correctly places
the Sequences.

Functions:
	Method: flux_start(sequence_id) 
	Description: Simple start a transition that plays through from start to finish
	Params:
		sequence_id: Sequence ID - The Sequence to be used.
	Example: flux_start(seqFadeToBlack)
	
	Method: flux_start_ext(sequence_id, [callback], [caller], [speed], [rotation], [destroy])
	Description: Advanced way to start a transition, allows for adjusting speed and rotation.
			As well as adding functionality for callbacks when the transition has finished
	Params:
		sequence_id: Sequence ID - The Sequence to be used.
		[callback]: Function - Takes in [Caller] as its only parameter. Default: undefined
		[caller]: Struct - The caller of the function. Can be undefined but needed if changing anything within the caller. Default: undefined
		[speed]: Real - The speed at which the transition plays. Default: 1
		[rotation]: Real - The angle at which the transition plays. Default: 0
		[destroy]: Bool - Tells Flux if the Transition should be destroyed when completed. Default: true
	Example 1: flux_start_ext(seqFadeToBlack, function() { flux_start(seqFadeFromBlack); }, undefined, 1, 0, false);
	Example 2: flux_start_ext(seqFadeToBlack, function(_caller) { _caller.timer = 5; }, self, 1, 0, false);
	Example 3: flux_start_ext(seqFadeToBlack, undefined, undefined, 2, 45, true);
	
	Method: flux_create(sequence_id)
	Description: Creates and returns a Flux Sequence Struct to allow for modification.
	Params:
		sequence_id: Sequence ID - The Sequence to be used.
	Example: var _sequence = flux_create(seqFadeToBlack);
	
	Method: flux_create_ext(sequence_id, [callback], [caller], [speed], [rotation], [destroy])
	Descrition: Creates and returns a Flux Sequence struct while setting values early on.
	Params: 
		sequence_id: Sequence ID - The Sequence to be used.
		[callback]: Function - Takes in [Caller] as its only parameter. Default: undefined
		[caller]: Struct - The caller of the function. Can be undefined but needed if changing anything within the caller. Default: undefined
		[speed]: Real - The speed at which the transition plays. Default: 1
		[rotation]: Real - The angle at which the transition plays. Default: 0
		[destroy]: Bool - Tells Flux if the Transition should be destroyed when completed. Default: true
	Example 1: var _sequence = flux_create_ext(seqFadeToBlack, function() { flux_start(seqFadeFromBlack); }, undefined, 1, 0, false);
	Example 2: var _sequence = flux_create_ext(seqFadeToBlack, undefined, undefined, 2, 0, true);
	
	Method: flux_pause() and flux_resume()
	Description: Pauses and Resumes sequences being played by flux.
	
	Method: flux_room_prepare(sequence, [preserve])
	Description: Sets up flux for entering a new room. 
	Params:
		sequence: Flux Sequence or Sequence ID - The Sequence that is used in the new room. Use -1 or undefined to use same transition
		[preserve]: Bool - Tells Flux to start the sequence at the same position it ended in previous room. Default: false
	Example 1: flux_room_prepare(flux_create(seqFadeIn));
	Example 2: flux_room_prepare(_sequence, true);
	Example 3: flux_room_prepare(-1, true);
	
Flux Sequence Functions:

The Flux Sequence is a struct that contains settings that are being used to create the desired transition effect.
This can be extended upon by utilising the functions included within the Flux Sequence.

	Method: addEvent(frame, callback, [caller], [args])
	Description: Adds an event at a specified frame. When the sequence is at that frame, it executes the event(s) at that position.
	Params:
		frame: Real - the Frame or Position in the Sequence to play the event.
		callback: Function - Takes in [Caller] and [Args]. The function that is to be called.
		[caller]: Struct - The caller of the function. Can be undefined. Default: undefined
		[args]: Array - An array of parameters that can be used in the callback function. Default: []
	Example 1: _sequence.addEvent(60, function() { show_debug_message("Hello World!"); });
	Example 2: _sequence.addEvent(60, function(_caller) { _caller.timer = 120; }, self);
	Example 3: _sequence.addEvent(60, function(_caller, _args) { _caller.timer = _args[0]; }, self, [120]);
	
In order to start a Flux Sequence you will want to pass the Flux Sequence through flux_start. Below is an example of utilising the 
event system.

// Create the Flux Sequence
var _sequence = flux_create(seqFadeToBlack);

// Add an Event at frame 30
_sequence.addEvent(30, function() { 
	show_debug_message("Halfway Point");
});

// Add an Event at frame 45 that sets a timer of the caller.
_sequence.addEvent(45, function(_caller, _args)) {
	_caller.timer = _args[0];
}, self, [60]);

// Add another Event at frame 45 that pauses Flux.
_sequence.addEvent(45, function()) {
	flux_pause();
});

// Start the Flux Sequence
flux_start(_sequence);

Room Transitions are very important and by default the way sequences work is strange when changing room, Flux fixes that and also has some
easy ways to transition to a new room without much complexity. Below are two examples.

Example 1: Two Sequences

var _callback = function() {
	var _sequence = flux_create(seqFadeIn);
	flux_prepare_room(_sequence);
	room_goto_next();
}

flux_start(seqFadeOut, _callback);

Example 2: Single Sequence using Events

var _sequence = flux_create(seqFade);

_sequence.addEvent(30, function() {
	flux_prepare_room(-1, true);
	room_goto_next();
});
