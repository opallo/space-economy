extends Node2D

var planet_generator: PlanetGenerator = PlanetGenerator.new()
@onready var debug_input = $CanvasLayer/LineEdit
@onready var debug_label = $CanvasLayer/Label


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	#var planet_generator = PlanetGenerator.new()

	var home_planet = planet_generator.generate_home_planet()
	show_planet_summary(home_planet)

	#var random_planet = planet_generator.generate_random_planet()
	#show_planet_summary(random_planet)

	# Process console input


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.is_action_pressed("ui_accept"):
			var input_text = debug_input.text  # Assuming you have a TextInput node
			if input_text == "generate":
				debug_log("generating planet")
				var new_planet = planet_generator.generate_random_planet()
				debug_log("showing planet summary")
				show_planet_summary(new_planet)
				debug_input.select_all()
				debug_input.clear()  # Clear input


func show_planet_summary(planet: Planet):
	print(planet.planet_name)
	print(planet.planet_type)
	print(planet.planet_size)
	print(planet.planet_conditions)
	print(planet.planet_resources)


func debug_log(message: String):
	debug_label.text += message + "\n"
