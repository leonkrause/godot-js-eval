extends LineEdit

const Util = preload("res://utility.gd")

#export(NodePath) onready var option_button = get_node( option_button )
export(NodePath) onready var output = get_node( output )
export(NodePath) onready var context_toggle = get_node( context_toggle )

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
	connect( "text_entered", self, "eval" )

func _ready():
	if !JavaScript:
		output.print_line( "ERROR", "No JavaScript available!" )

func eval( code ):
	if JavaScript:
		var result = JavaScript.eval( code, context_toggle.is_pressed() )
		output.print_line( Util.type_string_of(result), str(result) )
		#output.print_line( "UTF8", get_raw_utf8(str(result)) ) 

func send():
	eval( get_text() )
