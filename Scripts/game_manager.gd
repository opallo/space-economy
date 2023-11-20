extends Node2D

var planet_generator: PlanetGenerator = PlanetGenerator.new()
@onready var debug_input = $CanvasLayer/LineEdit
@onready var debug_label = $CanvasLayer/Label
@onready var generate_planet_button = $CanvasLayer/GeneratePlanetButton


func _ready():
	randomize()

	debug_log("Generating home planet")
	var home_planet = planet_generator.generate_home_planet()
	debug_log("Showing home planet summary")
	show_planet_summary(home_planet)


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.is_action_pressed("ui_accept"):
			var input_text = debug_input.text
			if input_text == "generate":
				debug_log("Generating random planet")
				var new_planet = planet_generator.generate_random_planet()
				debug_log("Showing random planet summary")
				show_planet_summary(new_planet)
				debug_input.select_all()
				debug_input.clear()


func show_planet_summary(planet: Planet):
	print("Name: " + planet.planet_name)
	print("Type: " + planet.planet_type)
	print("Size: " + planet.planet_size)
	print("Conditions: " + planet.planet_conditions)
	print("Resources: ")
	print(planet.planet_resources)
	print("Population: ")
	print(planet.planet_population)
	print("Happiness: ")
	print(planet.planet_happiness)
	print("\n")


func _on_generate_planet_button_pressed():
	debug_log("Generating random planet")
	var new_planet = planet_generator.generate_random_planet()
	debug_log("Showing random planet summary")
	show_planet_summary(new_planet)


func debug_log(message: String):
	debug_label.text += message + "\n"
