extends Button

export(NodePath) var line_edit_path
onready var line_edit = get_node( line_edit_path )

func _ready():
	connect( "pressed", line_edit, "send" )
