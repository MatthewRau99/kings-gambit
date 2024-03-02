#tool

extends GridContainer

var keys = "BKNPQR" # Bishop King kNight Pawn Queen Rook
var pieceImages = {}

# Return a chess piece object defaulting to a White Pawn
func get_piece(key = "P", side = "W"):
	var i = keys.find(key)
	if side == "W":
		i += 6
	var p = get_child(i).duplicate()
	p.position = Vector2(0, 0)
	if side == "B":
		key = key.to_lower()
	p.texture = load(pieceImages[key])
	return p


func promote(p: Piece, promote_to = "q"):
	p.key = promote_to.to_upper()
	var parent = p.obj.get_parent()
	p.obj.queue_free() # Delete pawn
	# Now add the new piece in place of the pawn
	p.obj = get_piece(p.key, p.side)
	parent.add_child(p.obj)


# Edit this to start in the game or as a Tool script when the scene is loaded
func _ready():
	setup()
	visible = false # It is set up as an Autoloaded scene so want to hide it


# This function is used in Tool script mode to set up the 12 Grid child nodes
# It's useful when you change the child node type or the images to save time
func setup():
	# First create a sorted list of the chess piece images
	var dir = DirAccess.open("res://pieces")
	if dir != null:
		var files = []
		dir.list_dir_begin() # TODOConverter3To4 fill missing arguments https://github.com/godotengine/godot/pull/40547
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.get_extension() == "png":
				files.append(file_name)
			file_name = dir.get_next()
		files.sort()
		#print(files)
		# Now apply the images to the sprite textures
		pieceImages = {}
		for file in files:
			var key = make_key(file.get_basename())
			pieceImages[key] = "res://pieces/" + file
		print("PIECES:" + str(pieceImages))
		return pieceImages
		
func make_key(file : String):
	if file.begins_with("white"):
		if file.contains("Knight"):
			return "N"
		return file[5]
	else:
		if file.contains("Knight"):
			return "n"
		return file[5].to_lower()
