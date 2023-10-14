function __flux_trace(_message, _abort = true){
	var _info = $"Flux {FLUX_VERSION}\nEncountered a fatal error.\n\n{_message}";
	
	show_error(_info, _abort);
}