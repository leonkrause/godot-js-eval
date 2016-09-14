extends Button

export(NodePath) onready var line_edit = get_node( line_edit )

func _ready():
	connect( "pressed", line_edit, "send" )
