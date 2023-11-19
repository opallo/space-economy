extends Node

class_name PlanetGenerator

# Possible planet attributes
var planet_types = ["Habitable", "Gas Giant", "Frozen", "Ocean", "Rocky"]
var planet_sizes = ["Small", "Medium", "Large"]
var planet_resources = ["Alloys", "Minerals", "Water", "Gas"]
var planet_conditions = ["Temperate", "Arid", "Frozen", "Toxic"]
var planet_population
var planet_happiness_levels = ["Low", "Medium", "High"]

func generate_random_planet() -> Planet:
	var random_planet_attributes = {
		"planet_name": "Planet_" + str(randi()),  # Simple random name	
		"planet_type": planet_types[randi() % planet_types.size()],
		"planet_size": planet_sizes[randi() % planet_sizes.size()],
		"planet_conditions": planet_conditions[randi() % planet_conditions.size()],
		"planet_resources": generate_resources(),
		"planet_population": randi() % 100,
		"planet_happiness": planet_happiness_levels[randi() % planet_happiness_levels.size()]
	}
	
	var new_planet = Planet.new(random_planet_attributes)
	return new_planet

func generate_resources() -> Dictionary:
	var resources = {}
	var num_resources = randi() % planet_resources.size() + 1

	for i in range(num_resources):
		var resource = planet_resources[randi() % planet_resources.size()]
		var amount = randi() % 1000
		resources[resource] = amount

	return resources

func generate_home_planet() -> Planet:
	var settings: HomePlanet = HomePlanet.new()
	var home_planet_attributes = {
		"planet_name": settings.HOME_NAME,
		"planet_type": settings.HOME_TYPE,
		"planet_size": settings.HOME_SIZE,
		"planet_conditions": settings.HOME_CONDITIONS,
		"planet_resources": settings.HOME_RESOURCES,
		"planet_population": settings.HOME_POPULATION,
		"planet_happiness": settings.HOME_HAPPINESS
	}
	var home_planet: Planet = Planet.new(home_planet_attributes)
	return home_planet
