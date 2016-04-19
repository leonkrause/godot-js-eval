extends LineEdit

export(NodePath) var option_button_path
onready var option_button = get_node( option_button_path )

export(NodePath) var output_path
onready var output = get_node( output_path )

var JavaScript

static func get_raw_utf8(string):
	var result = String()
	for string_index in range( string.length() ):
		var char_array = string.substr(string_index,1).to_utf8()
		for char_index in range( char_array.size() ):
			if char_index != 0: result += ' '
			result += str(char_array[char_index])
		if string_index != string.length()-1: result += " | "
	return result

func _init():
	if Globals.has_singleton( "JavaScript" ):
		JavaScript = Globals.get_singleton( "JavaScript" )
	connect( "text_entered", self, "_on_text_entered" )

func _ready():
	if !JavaScript:
		output.print_line( "No JavaScript available!" )

func eval( code, mode ):
	if JavaScript:
		var result = JavaScript.eval( code, mode )
		prints( "VARIANT TYPE:", typeof( result ) )
		if str(result)!="":
			output.print_line( result )
			output.print_line( get_raw_utf8(str(result)) ) 

func _on_text_entered( text ):
	send()

func send():
	eval( get_text(), option_button.get_selected_ID() )
