/// If you have a custom camera, you will want to change the 
/// flux_camera_custom_pos
/// function. This exists in order for you to use your custom camera
/// for drawing instead of relying on Flux's default system
/// You can find this in: 04 - Camera

/// The Default Flux Camera uses a view_camera index
/// Ensure this number is a valid number for a view_camera. This is used 
/// to ensure flux works regardless of camera system
#macro	FLUX_CAMERA_VIEW_ID			0