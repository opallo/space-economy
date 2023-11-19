extends Object
class_name Planet

var planet_name: String
var planet_type: String
var planet_size: String
var planet_conditions: String
var planet_resources: Dictionary
var planet_population: int
var planet_happiness: String

func _init(settings: Dictionary):
	planet_name = settings.get("planet_name", "DefaultName")
	planet_type = settings.get("planet_type", "DefaultType")
	planet_size = settings.get("planet_size", "DefaultSize")
	planet_conditions = settings.get("planet_conditions", "DefaultConditions")
	planet_resources = settings.get("planet_resources", {})
	planet_population = settings.get("planet_population", 0)
	planet_happiness = settings.get("planet_happiness", null)

