extends Control
class_name GraphCool

@export var metric_name : Label
var horz_dist : float
var vert_dist : float

func _ready() -> void:
	var botRight : Node2D = get_node("ColorRect2/Node2D3")
	
	horz_dist = abs(botRight.position.x)
	vert_dist = abs(botRight.position.y)

func makeGraph(values: Array[float], metric_name_: String):
	metric_name.text = metric_name_
	var step_size = horz_dist/len(values)
	var line : Line2D = Line2D.new()
	var highest : float = -9999999
	
	for i in values:
		if i > highest:
			highest = i
	
	
	for i in range(0,len(values)):
		line.add_point(Vector2(step_size*i,(values[i]/highest)*vert_dist))
	
	get_node("ColorRect2").add_child(line)
