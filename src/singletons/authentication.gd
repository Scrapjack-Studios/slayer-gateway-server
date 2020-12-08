extends Node

const DEFAULT_IP = "192.168.1.195"
const DEFAULT_PORT = 1911

var network = NetworkedMultiplayerENet.new()

func _ready() -> void:
	connect_to_server(DEFAULT_IP, DEFAULT_PORT)

func connect_to_server(ip, port):
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	
	network.connect("connection_failed", self, "on_connection_failed")
	network.connect("connection_succeeded", self, "on_connection_succeeded")

func on_connection_failed():
	print("Connection failed")

func on_connection_succeeded():
	print("Connection succeeded")
