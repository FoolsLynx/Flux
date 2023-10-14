function __flux_camera_pos(_sequence){
	var _seq = sequence_get(_sequence);
	var _ox = _seq.xorigin;
	var _oy = _seq.yorigin;
	
	var _cam = undefined;
	var _cam_x = 0;
	var _cam_y = 0;
	var _cam_w = 0;
	var _cam_h = 0;
	
	// Default to View
	_cam = view_camera[FLUX_CAMERA_VIEW_ID];
	_cam_x = camera_get_view_x(_cam);
	_cam_y = camera_get_view_y(_cam);
	_cam_w = camera_get_view_width(_cam);
	_cam_h = camera_get_view_height(_cam);
	
	// Custom Camera
	var _rect = flux_camera_custom_pos();
	if(_rect[2] != 0 && _rect[3] != 0) {
		_cam_x = _rect[0];
		_cam_y = _rect[1];
		_cam_w = _rect[2];
		_cam_h = _rect[3];
	}
	
	
	var _cam_hw = _cam_w * 0.5;
	var _cam_hh = _cam_h * 0.5;
	
	var _sx = (_cam_x + _cam_hw) + _ox;
	var _sy = (_cam_y + _cam_hh) + _oy;
	
	return [_sx, _sy];
}