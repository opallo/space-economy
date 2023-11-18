extends Node

class_name PlanetGenerator

# Possible planet attributes
var planet_types = ["Rocky", "Ice", "Gas Giant", "Habitable"]
var planet_sizes = ["Small", "Medium", "Large"]
var planet_resources = ["Alloys", "Water", "Coal", "Hydrogen", "Uranium", "Silicon"]
var planet_conditions = ["Temperate", "Arid", "Frozen", "Toxic"]
var planet_population
var planet_happiness_levels = ["Low", "Medium", "High"]

func generate_home_planet() -> Planet:
	var settings: HomePlanet = HomePlanet.new()
	var home_planet: Planet = Planet.new(
		settings.HOME_NAME,
		settings.HOME_TYPE,
		settings.HOME_SIZE,
		settings.HOME_CONDITIONS,
		settings.HOME_RESOURCES,
		settings.HOME_POPULATION,
		settings.HOME_HAPPINESS
	)
	return home_planet

func generate_random_planet() -> Planet:
	var planet_name = "Planet_" + str(randi())  # Simple random name
	var type = planet_types[randi() % planet_types.size()]
	var size = planet_sizes[randi() % planet_sizes.size()]
	var conditions = planet_conditions[randi() % planet_conditions.size()]
	var resources = generate_resources()
	var population = randi() % 100
	var happiness = planet_happiness_levels[randi() % planet_happiness_levels.size()]
	var new_planet = Planet.new(planet_name, type, size, conditions, resources, population, happiness)

	return new_planet

func generate_resources() -> Dictionary:
	var resources = {}
	var num_resources = randi() % planet_resources.size() + 1

	for i in range(num_resources):
		var resource = planet_resources[randi() % planet_resources.size()]
		var amount = randi() % 1000
		resources[resource] = amount

	return resources
