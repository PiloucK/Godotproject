extends Node


var SERVER_IP = "127.0.0.1"
const SERVER_PORT = 31400
const MAX_PLAYERS = 4

var players = {}


func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	
	create_server()
	
	
func create_server():
#	my_info.name = "Blue"
#	my_info.position = Vector2(360, 180)
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(SERVER_PORT, MAX_PLAYERS)
	get_tree().network_peer = peer
	print("server launched")
	
	
func _player_connected(id):
	players[id] = { name = "Blue", position = Vector2.ZERO }
	rpc_id(id, "create_player", id,  players.size())
	
	
func _player_disconnected(id):
	players.erase(id)
	
	
remote func register_other_player(info):
	var id = get_tree().get_rpc_sender_id()
	
	players[id] = info
	
	
var players_done = []


remote func done_registering():
	var who = get_tree().get_rpc_sender_id()
	
	assert(get_tree().is_network_server())
	assert(who in players)
	assert(not who in players_done)
	
	players_done.append(who)
	
	if players_done.size() == players.size():
		print("All registered")
		players_done.clear()
		rpc("pre_configure_game")


remote func done_preconfiguring():
	var who = get_tree().get_rpc_sender_id()
	
	assert(get_tree().is_network_server())
	assert(who in players)
	assert(not who in players_done)
	
	players_done.append(who)
	
	if players_done.size() == players.size():
		print("All ready")
#		rpc("post_configure_game")
		
#
#remote func post_configure_game():
#	if 1 == get_tree().get_rpc_sender_id():
#		get_tree().set_pause(false)
#
	
