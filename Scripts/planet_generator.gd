extends Node

class_name PlanetGenerator

# Possible planet attributes
var planet_types = ["Habitable", "Gas", "Frozen", "Ocean", "Rocky"]
var planet_sizes = ["Small", "Medium", "Large"]
var planet_resources = ["Alloys", "Minerals", "Water", "Gas"]
var planet_conditions = ["Temperate", "Arid", "Frozen", "Toxic"]
var planet_happiness_levels = ["Low", "Medium", "High"]

var planet_type_to_resources = {
	"Habitable": {"Water": 100, "Minerals": 100, "Gas": 100, "Alloys": 100},
	"Gas": {"Water": 0, "Minerals": 50, "Gas": 500, "Alloys": 10},
	"Frozen": {"Water": 400, "Minerals": 50, "Gas": 0, "Alloys": 50},
	"Ocean": {"Water": 500, "Minerals": 50, "Gas": 0, "Alloys": 10},
	"Rocky": {"Water": 10, "Minerals": 200, "Gas": 0, "Alloys": 50}
}

func generate_random_planet() -> Planet:
	var planet_type = planet_types[randi() % planet_types.size()]
	var planet_population = randi() % 100 if planet_type == "Habitable" else 0
	var planet_happiness = (
		planet_happiness_levels[randi() % planet_happiness_levels.size()]
		if planet_population > 0
		else "N/A"
	)

	var random_planet_attributes = {
		"planet_name": "Planet_" + str(randi()),  # Simple random name
		"planet_type": planet_type,
		"planet_size": planet_sizes[randi() % planet_sizes.size()],
		"planet_conditions": planet_conditions[randi() % planet_conditions.size()],
		"planet_resources": planet_type_to_resources[planet_type],
		"planet_population": planet_population,
		"planet_happiness": planet_happiness
	}

	var new_planet = Planet.new(random_planet_attributes)
	return new_planet


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
