local Net = _G.LuaNetworking
local playerPing = 0

function info(id)
	local peer = managers.network._session:peer(id)
	--[[
	local peerName = peer:name()
	local peerIP = peer:ip()
	local peerID = peer:id()
	local peerRpc = peer:rpc()
	local peerSteamRpc = peer:steam_rpc()
	local peerChar = peer:character()
	local peerPing = peer:qos()
	local peerLevel = peer:level()
	local peerRank = peer:rank()
	]]
	
	personagens = {
		["russian"] = "Dallas",
		["american"] = "Houston",
		["german"] = "Wolf",
		["spanish"] = "Chains",
		["jowi"] = "John Wick",
		["female_1"] = "Clover",
		["old_hoxton"] = "Hoxton",
		["dragan"] = "Dragan",
		["jacket"] = "Jacket",
		["boonie"] = "Boonie",
		["sokol"] = "Sokol",
		["dragon"] = "Jiro",
		["bodhi"] = "Bodhi",
	}
	
	local character = peer:character()
	local qos = Network:qos(peer:rpc()) or {}
	playerPing = qos and qos.ping or 0
	playerPing = math.round(playerPing)
	
	managers.chat:_receive_message(1, "Player Info", "Infos of " .. peer:name(), Color.green)

	managers.chat:_receive_message(1, "Name", peer:name(), Color.red)
	managers.chat:_receive_message(1, "ID", peer:id(), Color.red)
	managers.chat:_receive_message(1, "IP", peer:ip(), Color.red)
	managers.chat:_receive_message(1, "Character", personagens[tostring(character)], Color.red)
	managers.chat:_receive_message(1, "Ping", tostring(playerPing) .. "ms", Color.red)
end

if Net:IsMultiplayer() then
	local local_peer = managers.network:session():local_peer()
	local peer = managers.network._session:peer(id);
	local local_id=local_peer:id()
	local id = peer:id()
	
	local menu_options = {}
	menu_options[#menu_options+1] = { text = Net:GetNameFromPeerID(local_id), data = local_id, callback = info }
	for _, peer in pairs(managers.network:session():peers()) do
		menu_options[#menu_options+1] = { text = peer:name(), data = peer:id(), callback = info }
	end
	menu_options[#menu_options+1] = {text = "", is_cancel_button = true}
	menu_options[#menu_options+1] = {text = "Close", is_cancel_button = true}
	local infoMenu = QuickMenu:new("Player Info", "Show the infos of...", menu_options)
	infoMenu:Show()
end
