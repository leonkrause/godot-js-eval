extends TextEdit

func _init():
	set_readonly( true )

func print_line( line ):
	if ( get_text() ):
		set_text( get_text() + '\n' )
	set_text( get_text() + str(line) )
	var last_line = get_line_count() - 1
	cursor_set_column( 0 )
	cursor_set_line( last_line, true )
	cursor_set_column( get_line( last_line ).length() )
