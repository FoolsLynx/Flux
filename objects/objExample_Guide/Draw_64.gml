
var _text = $"Flux Version {FLUX_VERSION}\n"
	+ "Press the following for examples\n\n"
	+ "Space - Fade out and In\n"
	+ "Tab - Events (Show Debug Message)\n"
	+ "Shift - Events (Pause/Unpause)\n"
	+ "Alt - Switch Rooms\n"
	+ "Right - Switch Rooms (Preserved)\n\n"
	+ "This should also show sequences drawn after Draw GUI.";

var _old = draw_get_font();
draw_set_font(fntFlux);
draw_set_colour(c_red);
draw_text_ext(0, 0, _text, 16, 426);
draw_set_colour(c_white);
draw_set_font(_old);