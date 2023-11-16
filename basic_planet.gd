extends Object
class_name Planet

var planet_name: String
var planet_type: String
var planet_size: String
var planet_conditions: String
var planet_resources: Dictionary

func _init(_name: String, _type: String, _size: String, _conditions: String, _resources: Dictionary):
	planet_name = _name
	planet_type = _type
	planet_size = _size
	planet_conditions = _conditions
	planet_resources = _resources

#func _init(settings: Dictionary):
#	planet_name = settings.get("planet_name", "DefaultName")
#	planet_type = settings.get("planet_type", "DefaultType")
#	planet_size = settings.get("planet_size", "DefaultSize")
#	planet_conditions = settings.get("planet_conditions", "DefaultConditions")
#	planet_resources = settings.get("planet_resources", {})

