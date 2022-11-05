extends Node

####### Constants #########
var dimension = 2
var mainLocation = [0,0]

"""
M - Main 
H - Horizontal
V - Vertical
X - XRoom
"""
var map = [[preload('res://RoomChunk.gd').new().set_Params(["M", false, false]), preload('res://RoomChunk.gd').new().set_Params(["H", false, false])],
				[preload('res://RoomChunk.gd').new().set_Params(["H", false, false]), preload('res://RoomChunk.gd').new().set_Params(["V", false, true])]]
		

var curPos = [mainLocation[0], mainLocation[1]]

func getCurPos():
	return curPos
	
func getDimensions():
	return dimension
