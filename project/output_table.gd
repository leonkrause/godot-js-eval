extends RichTextLabel

func _init():
	randomize()
	set_scroll_follow( true )
	push_table( 2 )
	set_table_column_expand( 1, true, 1 )

func print_line( meta, text ):
	push_cell()
	add_text( meta + '\t' )
	pop()
	push_cell()
	add_text( text )
	pop()
