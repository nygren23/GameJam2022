extends Node

####### Constants #########
var dimension = 2
var mainLocation = [0,0]

var map = [["M", "H"],
				["H", "V"]]
		

var curPos = [mainLocation[0], mainLocation[1]]

func getCurPos():
	return curPos
	
func getDimensions():
	return dimension
