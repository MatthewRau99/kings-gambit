extends Sprite2D

@onready var spr = $"."

var mod = "TODO:MOD"

# Called when the node enters the scene tree for the first time.
func _ready():
	spr.modulate = Color("green")

