local Net = _G.LuaNetworking

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
	}
	
	local character = peer:character()
	
	managers.chat:_receive_message(1, "Player Info", "Infos of " .. peer:name(), Color.green)
	--if peer:rank then
		
	--end
	managers.chat:_receive_message(1, "Name", peer:name(), Color.red)
	managers.chat:_receive_message(1, "ID", peer:id(), Color.red)
	managers.chat:_receive_message(1, "IP", peer:ip(), Color.red)
	managers.chat:_receive_message(1, "Character", personagens[tostring(character)], Color.red)
	--managers.chat:_receive_message(1, "Ping", peer:qos(), Color.red)
	--managers.chat:_receive_message(1, "Rpc", peer:rpc(), Color.red)
	--managers.chat:_receive_message(1, "Steam rpc", peer:steam_rpc(), Color.red)
end

if Net:IsMultiplayer() then
	local peer = managers.network._session:peer(id)
	local myId = managers.network:session():local_peer():id()
	local peerLocal = Net:GetNameFromPeerID(myId)
	local menu_options = {}
	menu_options[#menu_options+1] = { text = peerLocal, data = myId, callback = info }
	for _, peer in pairs(managers.network:session():peers()) do
		menu_options[#menu_options+1] = { text = peer:name(), data = peer:id(), callback = info }
	end
	menu_options[#menu_options+1] = {text = "", is_cancel_button = true}
	menu_options[#menu_options+1] = {text = "Close", is_cancel_button = true}
	local infoMenu = QuickMenu:new("Player Info", "Show the infos of...", menu_options)
	infoMenu:Show()
end
