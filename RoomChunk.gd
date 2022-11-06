extends Node2D

class_name RoomChunk

export(String) var type = "" setget set_Type, get_Type
export(bool) var enemyAlive = false setget set_Enemy_Alive, get_Enemy_Alive
export(bool) var objectiveInRoom = false setget set_Objective_In_Room, get_Objective_In_Room

func set_Type(var Type):
	type = Type
func get_Type():
	return type

func set_Enemy_Alive(var EnemyAlive):
	enemyAlive = EnemyAlive;
func get_Enemy_Alive():
	return enemyAlive

func set_Objective_In_Room(var ObjectiveInRoom):
	objectiveInRoom = ObjectiveInRoom
func get_Objective_In_Room():
	return objectiveInRoom

func set_Params(var Params):
	type = Params[0]
	enemyAlive = Params[1]
	objectiveInRoom = Params[2]


func decideNextRoom(curPos):
	#print(curPos)
	
	if curPos[0]<0 or curPos[1]<0:
		return null
		
	if curPos[0]<Global.dimensions[0] and curPos[1]<Global.dimensions[1]:
		return Global.map[curPos[0]][curPos[1]]
	else:
		print("out of bounds")
		return null