#folder to keep things more organised
const SAVE_DIR = "user://saves/"

#location of the save file
var save_path = SAVE_DIR + "save_game.dat"

#when the save button is pressed
func _on_SaveButton_pressed():
	#this is all the data that we are planning to store (not the most effecient method)
	var data = {
		"name" : "Marc",
		"family_name" : "Daaboul",
		"jump_height" : 9001,
		"max_health" : 100,
		"health" : 82,
		"strength" : 4000,
	}
	#this makes a new directory
	var dir = Directory.new()
	#this checks if the directory exists
	if !dir.dir_exists(SAVE_DIR):
		#(recursive will make sure that all the folders are made)
		dir.make_dir_recursive(SAVE_DIR)
	
	#the instance variable for the file
	var save_game = File.new()
	#this write all the data in an encrypted format to the file
	var error = save_game.open_encrypted_with_pass(save_path, File.WRITE, "epyc")
	#this checks the process was done correctly
	if error == OK:
		#stores data in the save_game
		save_game.store_var(data)
		#closes the save_game to make sure there are no leaks
		save_game.close()
	

#when the load button is pressed
func _on_LoadButton_pressed():
	#the instance variable for the file
	var save_game = File.new()
	#this makes sure the file is available
	if save_game.file_exists(save_path):
		#this reads the encrypted file
		var error = save_game.open_encrypted_with_pass(save_path, File.READ, "epyc")
		#checks if its okay
		if error ==OK:
			#this is where the save data is loaded
			var player_data = save_game.get_var()
			#closes the save_game to make sure there are no leaks
			save_game.close()
			
	
