extends Node

class_name GlobalStats

####### Constants #########
var level
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
			

# [enemy, objective, "LRUD"]
var metadata = [[[false, false, "0000"], [false, false, "0000"], [false, false, "0110"]],
				[[false, false, "1010"], [false, false, "0000"], [false, false, "0101"]],
				[[false, false, "1001"], [false, false, "0000"], [false, true, "0000"]]]

var objectiveGet = false

var lastDirection = "Right";
var lastPosition = Vector2.ZERO

var curPos = [mainLocation[0], mainLocation[1]]
var timer_time_left = 2500
var gameOver = false
var youLose = false

var musicStart = 700.0

func startTimer():
	pass
