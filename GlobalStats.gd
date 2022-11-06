extends Node

class_name GlobalStats

####### Constants #########
var mainLocation = [0,0]

"""
M - Main 
H - Horizontal
V - Vertical
X - XRoom
"""
#var map = [[preload('res://RoomChunk.gd').new().set_Params(["M", false, false]), preload('res://RoomChunk.gd').new().set_Params(["H", false, false])],
#				[preload('res://RoomChunk.gd').new().set_Params(["H", false, false]), preload('res://RoomChunk.gd').new().set_Params(["V", false, true])]]
var map = [["M", "H", "X"],
			["X", "H", "X"],
			["X", "H", "H"]]
			
var dimensions = [map.size(), map[0].size()]
			

# [enemy, objective]
var metadata = [[[false, false], [true, true]],[[false, true], [false, true]]]

var objectiveGet = false
var lastDirection = "Right";

var curPos = [mainLocation[0], mainLocation[1]]
var timer_time_left = 45

func getCurPos():
	return curPos
	
func getDimensions():
	return dimensions
	
func setHPos(direction):
	curPos[0] += direction
	
func setVPos(direction):
	curPos[1] = direction
