extends Node

class_name GlobalStats

####### Constants #########
var dimension = 2
var mainLocation = [0,0]

<<<<<<< Updated upstream
"""
M - Main 
H - Horizontal
V - Vertical
X - XRoom
"""
var map = [[preload('res://RoomChunk.gd').new().set_Params(["M", false, false]), preload('res://RoomChunk.gd').new().set_Params(["H", false, false])],
				[preload('res://RoomChunk.gd').new().set_Params(["H", false, false]), preload('res://RoomChunk.gd').new().set_Params(["V", false, true])]]
=======
var map = [["M", "H"],
			["H", "V"]]
>>>>>>> Stashed changes
		

var curPos = [mainLocation[0], mainLocation[1]]

func getCurPos():
	return curPos
	
func getDimensions():
	return dimension
	
func setHPos(direction):
	curPos[0] += direction
	
func setVPos(direction):
	curPos[1] = direction
