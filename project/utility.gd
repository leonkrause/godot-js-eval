func _init():
	printerr( "Instantiating library `Util`!" )

const TYPE_STRINGS =\
{
	0: "NIL",
	1: "BOOL",
	2: "INT",
	3: "REAL",
	4: "STRING",
	5: "VECTOR2",
	6: "RECT2",
	7: "VECTOR3",
	8: "MATRIX32",
	9: "PLANE",
	10: "QUAT",
	11: "AABB",
	12: "MATRIX3",
	13: "TRANSFORM",
	14: "COLOR",
	15: "IMAGE",
	16: "NODE_PATH",
	17: "RID",
	18: "OBJECT",
	19: "INPUT_EVENT",
	20: "DICTIONARY",
	21: "ARRAY",
	22: "RAW_ARRAY",
	23: "INT_ARRAY",
	24: "REAL_ARRAY",
	25: "STRING_ARRAY",
	26: "VECTOR2_ARRAY",
	27: "VECTOR3_ARRAY",
	28: "COLOR_ARRAY"
}

static func type_string_of( variable ):
	return TYPE_STRINGS[typeof(variable)]
