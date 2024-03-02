extends Resource

class_name Piece


var side : String # The Black or the white "B" or "W"
# The key code used in notation (PRNBQK)
# Pawn Rook kNight Bishop Queen King
var key : String
# Betza notation
var movement : String
# piece in Fen notation
var piece_name : String

var obj : Sprite2D # The sprite object in the running game
var pos = Vector2(0, 0) # position in grid
var new_pos = Vector2(0, 0) # position to move to in grid coors
var tagged = false # Used to indicate if castling is enabled for Rook or King

func _init(s, k, m, n):
	side = s
	key = k
	movement = m
	piece_name = n
	
func duplicatePiece() -> Resource:
	var p = Piece.new(side, key, movement, piece_name)
	p.obj = obj
	p.pos = pos
	p.new_pos = new_pos
	p.tagged = tagged
	return p
	
	
