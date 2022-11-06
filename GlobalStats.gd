extends Node

class_name GlobalStats

####### Constants #########
var level
var mainLocation
var map
var metadata
var dimensions
var curPos
var player_on_lift = false
var player_using_lift = false

var mainLocation1 = [0,0]
var mainLocation2 = [0,1]

"""
M - Main 
H - Horizontal
V - Vertical
X - XRoom
"""
#var map = [[preload('res://RoomChunk.gd').new().set_Params(["M", false, false]), preload('res://RoomChunk.gd').new().set_Params(["H", false, false])],
#				[preload('res://RoomChunk.gd').new().set_Params(["H", false, false]), preload('res://RoomChunk.gd').new().set_Params(["V", false, true])]]
var map1 = [["M", "H", "X"],
			["X", "H", "X"],
			["X", "H", "H"]]
			
var map2 = [["X", "M", "X", "X"],
			["V", "X", "V", "V"],
			["X", "X", "X", "X"],
			["X", "X", "X", "X"]]
			
			
# 'LRUD' = enable Left, Right, Up, Down walls
# [enemy, objective, "LRUD"]
var metadata1 = [[[false, false, "0000"], [false, false, "0000"], [false, false, "0110"]],
				[[false, false, "1010"], [false, false, "0000"], [false, false, "0101"]],
				[[false, false, "1001"], [false, false, "0000"], [false, true, "0000"]]]

var metadata2 = [[[false, true, "1110"], [false, false, "0000"], [false, false, "0010"], [false, false, "0110"]],
				[[false, false, "0000"], [false, false, "1110"], [false, false, "0000"], [false, false, "0000"]],
				[[false, false, "1000"], [false, false, "0001"], [false, false, "0000"], [false, false, "0101"]],
				[[false, false, "1001"], [false, false, "0111"], [false, false, "1001"], [false, true, "0111"]]]

var objectiveGet = false

var lastDirection = "Right";
var lastPosition = Vector2.ZERO

var timer_time_left = 2500
var gameOver = false
var youLose = false

var musicStart = 700.0
var preReignMusicStart = 0.0

func startTimer():
	pass
	
func reset_level():
	objectiveGet = false
	lastDirection = "Right";

	timer_time_left = 2500
	gameOver = false
	youLose = false
