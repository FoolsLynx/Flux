///-------------------------------------------------------------------------
/// Example - Fade Out and In
///-------------------------------------------------------------------------
/// This example shows a simple way to have Flux transition out and back in.
/// We do this with the flux_start_ext function
///
/// The flux_start_ext function is useful for adding callbacks for when the
/// sequence has finished playing. Which can be helpful for changing rooms
/// opening menus, etc.
///
/// This example has us create the Fade In sequence as soon as the Fade out
/// is completed.
///-------------------------------------------------------------------------


// Return if Flux is Running (Prevents Issues)
if(flux_is_running()) return;

// Only Run Code if Space has been pressed
if(!keyboard_check_pressed(vk_space)) return;

// Start our fade out, once that has finished, we create the fade in sequence
flux_start_ext(seqSimpleFadeOut, function() { flux_start(seqSimpleFadeIn); }, undefined, 1, 0, false);