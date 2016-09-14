extends Control

func _ready():
	set_process_input( true )
	get_close_button().hide()
	call_deferred( 'popup_centered' )

func _input( event ):
	if event.type==InputEvent.MOUSE_BUTTON and event.button_index==BUTTON_LEFT and not event.is_pressed():
		var drag_rect = get_rect();
		drag_rect.size.height = -4;
		if not get_viewport_rect().intersects( drag_rect ):
			popup_centered()
