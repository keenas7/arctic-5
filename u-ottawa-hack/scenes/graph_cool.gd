extends Control
class_name GraphCool

@export var metric_name : Label
var horz_dist : float
var vert_dist : float

func _ready() -> void:
	var botRight = get_node("ColorRect2/Node2D3")
	
	horz_dist = abs(botRight.x)
	vert_dist = abs(botRight.y)

func makeGraph(values: Array[float], metric_name_: String):
	metric_name.text = metric_name_
	var step_size = horz_dist/len(values)
	var line : Line2D = Line2D.new()
	for i in range(0,len(values)):
		line.add_point(Vector2(step_size*i,values[i]))
	
	add_child(line)
