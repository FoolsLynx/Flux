function __flux_place_sequence(_sequence, _x, _y, _layer = global.__flux_layer){
	if(!variable_struct_exists(_sequence, "element")) {
		__flux_trace($"Given parameter: _sequence does not contain the element variable. Ensure sequences are created using \"__flux_create_sequence\".");
		return;
	}
	
	_sequence.onCreate(_x, _y, _layer);
}