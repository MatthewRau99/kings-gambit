extends Node

class_name Hand

var pieces: Array
var isPlayer: bool

func _init(hand:Array = [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null]):
	pieces = hand


func setHand(hand):
	pieces = hand
	
func setPiece(piece, index):
	pieces[index] = piece
	
func swapPieces(i1, i2):
	var temp = pieces[i1]
	pieces[i1] = pieces[i2]
	pieces[i2] = temp
