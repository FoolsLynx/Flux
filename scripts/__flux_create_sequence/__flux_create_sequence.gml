function __flux_create_sequence(_seq, _callback = undefined, _caller = undefined, _speed = 1, _rotation = 0, _destroy = true){
	return {
		sequence: _seq,
		element: undefined,
		spd: _speed,
		rotation: _rotation,
		destroy: _destroy,
		events: {},
		timer: 0,
		callback: _callback,
		caller: _caller,
		/// @desc Creates the sequence
		onCreate: function(_x, _y, _layer) {
			element = layer_sequence_create(_layer, _x, _y, sequence);
			layer_sequence_speedscale(element, spd);
			layer_sequence_angle(element, rotation);
		},		
		/// @desc Add an Event to the Sequence
		addEvent: function(_pos, _callback, _caller = self, _args = []) {
			// Get the Event at the Head position
			var _value = events[$ _pos];
			// If no event, ensure an array is created
			if(!is_array(_value)) events[$ _pos] = [];
			// Create the Event to handle callback
			var _event = {
				callback: _callback,
				caller: _caller,
				args: _args,
				onExecute: function() {
					callback(caller, args);
				}
			}
			// Add to Event Array
			array_push(events[$ _pos], _event);
		},
		onTimer: function() {
			if(timer == 0 || is_undefined(element)) return true;
			timer--;
			if(timer != 0) return false;
			if(layer_sequence_exists(global.__flux_layer, element)) {
				layer_sequence_destroy(element);
			}
			element = undefined;
			return true;
		},
		onTick: function() {
			if(element == undefined) return;
			if(global.__flux_headpos == global.__flux_headpos_old) return;
			
			//var _pos = layer_sequence_get_headpos(element);
			var _event = events[$ global.__flux_headpos];
			if(!is_array(_event)) return;
			
			var _i = 0;
			repeat(array_length(_event)) {
				_event[_i].onExecute();
				_i++;
			}
		},
		isFinished: function() {
			return is_undefined(element) ? true : layer_sequence_is_finished(element);
		}
	}
}